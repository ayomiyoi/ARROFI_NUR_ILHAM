<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ApprovalController extends Controller
{
    public function index(Request $request): View
    {
        $this->cekRole('petugas', 'admin');

        $query = Transaction::with(['user', 'console']);

        if ($request->query('q')) {
            $query->where('rental_code', 'like', '%'.$request->query('q').'%');
        }

        if ($request->query('status')) {
            $query->where('status', $request->query('status'));
        }

        $transactions = $query->orderByDesc('id')->paginate(10)->withQueryString();

        return view('approvals.index', [
            'transactions' => $transactions,
            'statusDipilih' => $request->query('status'),
            'cari' => $request->query('q'),
        ]);
    }

    public function setujui(Transaction $transaction): RedirectResponse
    {
        $this->cekRole('petugas', 'admin');

        if ($transaction->status !== 'pending') {
            return back()->with('error', 'Hanya pengajuan yang masih menunggu persetujuan yang bisa diproses.');
        }

        $transaction->update([
            'status' => 'approved',
            'approved_by' => auth()->id(),
        ]);

        $this->catatLog('approve', 'Menyetujui pengajuan '.$transaction->rental_code, $transaction);

        return back()->with('success', 'Pengajuan '.$transaction->rental_code.' disetujui.');
    }

    public function tolak(Transaction $transaction): RedirectResponse
    {
        $this->cekRole('petugas', 'admin');

        if ($transaction->status !== 'pending') {
            return back()->with('error', 'Hanya pengajuan yang masih menunggu persetujuan yang bisa diproses.');
        }

        $transaction->update([
            'status' => 'rejected',
            'approved_by' => auth()->id(),
        ]);

        $this->catatLog('reject', 'Menolak pengajuan '.$transaction->rental_code, $transaction);

        return back()->with('success', 'Pengajuan '.$transaction->rental_code.' ditolak.');
    }

    public function pinjam(Transaction $transaction): RedirectResponse
    {
        $this->cekRole('petugas', 'admin');

        if ($transaction->status !== 'approved') {
            return back()->with('error', 'Hanya pengajuan yang sudah disetujui yang bisa diserahterimakan.');
        }

        $console = $transaction->console;

        if ($console->stock < 1) {
            return back()->with('error', 'Stok objek '.$console->name.' sedang kosong.');
        }

        $transaction->update(['status' => 'borrowed']);

        $console->decrement('stock');

        if ($console->refresh()->stock < 1 && $console->status === 'available') {
            $console->update(['status' => 'rented']);
        }

        $this->catatLog('borrow', 'Serah terima objek untuk '.$transaction->rental_code, $transaction);

        return back()->with('success', 'Objek untuk '.$transaction->rental_code.' sudah diserahkan ke peminjam.');
    }
}
