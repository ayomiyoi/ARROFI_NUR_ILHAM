<?php

namespace App\Http\Controllers;

use App\Models\Console;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class TransactionController extends Controller
{
    public function index(): View
    {
        $this->cekRole('pengguna');

        $transactions = Transaction::with('console')
            ->where('user_id', auth()->id())
            ->orderByDesc('id')
            ->paginate(10);

        return view('transactions.index', compact('transactions'));
    }

    public function create(): View
    {
        $this->cekRole('pengguna');

        return view('transactions.create', [
            'consoles' => Console::with('category')->where('stock', '>', 0)->orderBy('name')->get(),
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $this->cekRole('pengguna');

        $data = $request->validate([
            'console_id' => ['required', 'exists:consoles,id'],
            'rental_date' => ['required', 'date', 'after_or_equal:today'],
            'return_date' => ['required', 'date', 'after_or_equal:rental_date'],
            'identification' => ['required'],
            'notes' => ['nullable'],
        ]);

        $console = Console::findOrFail($data['console_id']);

        if ($console->stock < 1) {
            return back()->withInput()->with('error', 'Stok objek ini sedang kosong.');
        }

        $totalHari = (int) Carbon::parse($data['rental_date'])->diffInDays(Carbon::parse($data['return_date']));

        if ($totalHari < 1) {
            $totalHari = 1;
        }

        $transaction = Transaction::create([
            'rental_code' => $this->buatKodePeminjaman(),
            'user_id' => auth()->id(),
            'console_id' => $console->id,
            'rental_type' => 'daily',
            'rental_date' => $data['rental_date'],
            'return_date' => $data['return_date'],
            'total_days' => $totalHari,
            'total_price' => $console->price_per_day * $totalHari,
            'deposit' => $console->deposit,
            'status' => 'pending',
            'identification' => $data['identification'],
            'notes' => $data['notes'] ?? null,
        ]);

        $this->catatLog('create', 'Mengajukan peminjaman '.$transaction->rental_code, $transaction);

        return redirect()->route('transactions.index')->with('success', 'Pengajuan peminjaman berhasil dikirim.');
    }

    public function show(Transaction $transaction): View
    {
        $this->cekRole('pengguna', 'petugas', 'admin');

        if (auth()->user()->isPengguna() && $transaction->user_id !== auth()->id()) {
            abort(403, 'Pengajuan ini bukan milik Anda.');
        }

        $transaction->load(['console.category', 'approver', 'retur']);

        return view('transactions.show', compact('transaction'));
    }

    public function batalkan(Transaction $transaction): RedirectResponse
    {
        $this->cekRole('pengguna');

        if ($transaction->user_id !== auth()->id()) {
            abort(403, 'Pengajuan ini bukan milik Anda.');
        }

        if ($transaction->status !== 'pending') {
            return redirect()->route('transactions.index')
                ->with('error', 'Hanya pengajuan yang masih menunggu persetujuan yang bisa dibatalkan.');
        }

        $transaction->update(['status' => 'cancelled']);

        $this->catatLog('cancel', 'Membatalkan pengajuan '.$transaction->rental_code, $transaction);

        return redirect()->route('transactions.index')->with('success', 'Pengajuan berhasil dibatalkan.');
    }

    private function buatKodePeminjaman(): string
    {
        $tanggal = date('Ymd');
        $jumlah = Transaction::count() + 1;

        return 'GV-'.$tanggal.'-'.$jumlah;
    }
}
