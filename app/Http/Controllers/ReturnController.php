<?php

namespace App\Http\Controllers;

use App\Models\ReturnItems;
use App\Models\Transaction;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ReturnController extends Controller
{
    public function index(Request $request): View
    {
        $this->cekRole('petugas', 'admin');

        $status = $request->query('status', 'borrowed');

        $query = Transaction::with(['user', 'console', 'retur'])->where('status', $status);

        // if ($request->query('q')) {
        //     $query->where('rental_code', 'like', '%'.$request->query('q').'%');
        // }

        $transactions = $query->orderBy('return_date')->paginate(10)->withQueryString();

        return view('returns.index', [
            'transactions' => $transactions,
            'statusDipilih' => $status,
            // 'cari' => $request->query('q'),
        ]);
    }

    public function create(Transaction $transaction): View|RedirectResponse
    {
        $this->cekRole('petugas', 'admin');

        // if ($transaction->status !== 'borrowed') {
        //     return redirect()->route('pengembalian.index')->with('error', 'Hanya peminjaman yang sedang berjalan yang bisa dikembalikan.');
        // }

        $transaction->load(['user', 'console']);

        return view('returns.create', compact('transaction'));
    }

    public function store(Request $request, Transaction $transaction): RedirectResponse
    {
        $this->cekRole('petugas', 'admin');

        // if ($transaction->status !== 'borrowed') {
        //     return redirect()->route('pengembalian.index')->with('error', 'Peminjaman ini sudah diproses pengembaliannya.');
        // }

        $data = $request->validate([
            'return_date' => ['required', 'date', 'after_or_equal:'.$transaction->rental_date->toDateString()],
            'condition' => ['required', 'in:excellent,good,minor_damage,needs_repair,broken'],
            'fine' => ['required', 'numeric', 'min:0'],
            'notes' => ['nullable', 'string'],
        ]);

        $terlambat = 0;

        if ($data['return_date'] > $transaction->return_date->toDateString()) {
            $terlambat = (int) $transaction->return_date->diffInDays($data['return_date'], true);
        }

        ReturnItems::create([
            'transaction_id' => $transaction->id,
            'return_date' => $data['return_date'],
            'condition' => $data['condition'],
            'fine' => $data['fine'],
            'notes' => $data['notes'] ?? null,
        ]);
        
        $transaction->update([
            'status' => $terlambat > 0 ? 'late' : 'returned',
            'fine' => $data['fine'],
        ]);

        $console = $transaction->console;
        $console->increment('stock');
        $console->condition = $data['condition'];

        if (in_array($data['condition'], ['needs_repair', 'broken'], true)) {
            $console->status = 'maintenance';
        } elseif ($console->stock > 0 && $console->status === 'rented') {
            $console->status = 'available';
        }

        $console->save();

        $keterangan = $terlambat > 0 ? " (terlambat {$terlambat} hari)" : '';
        $this->catatLog('return', 'Pengembalian objek untuk '.$transaction->rental_code.$keterangan, $transaction);

        return redirect()->route('pengembalian.index')
            ->with('success', 'Pengembalian '.$transaction->rental_code.' berhasil dicatat.');


    }
}
