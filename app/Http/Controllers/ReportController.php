<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ReportController extends Controller
{
    public function index(Request $request): View
    {
        $this->cekRole('petugas', 'admin');

        return view('reports.index', $this->ambilData($request));
    }

    public function cetak(Request $request): View
    {
        $this->cekRole('petugas', 'admin');

        return view('reports.print', $this->ambilData($request));
    }

    public function export(Request $request)
    {
        $this->cekRole('petugas', 'admin');

        $data = $this->ambilData($request);

        return response()->streamDownload(function () use ($data) {
            $file = fopen('php://output', 'w');

            fputcsv($file, ['Kode', 'Tanggal Pinjam', 'Tanggal Kembali', 'Peminjam', 'Objek', 'Lama (hari)', 'Total Harga', 'Denda', 'Status']);

            foreach ($data['transactions'] as $transaction) {
                fputcsv($file, [
                    $transaction->rental_code,
                    $transaction->rental_date->format('d-m-Y'),
                    $transaction->return_date->format('d-m-Y'),
                    $transaction->user->name,
                    $transaction->console->name,
                    $transaction->total_days,
                    $transaction->total_price,
                    $transaction->fine,
                    $transaction->labelStatus(),
                ]);
            }

            fclose($file);
        }, 'laporan-peminjaman.csv', ['Content-Type' => 'text/csv']);
    }

    /**
     * @return array<string, mixed>
     */
    private function ambilData(Request $request): array
    {
        $dari = $request->query('dari');
        $sampai = $request->query('sampai');
        $status = $request->query('status');
        $cari = $request->query('q');

        $query = Transaction::with(['user', 'console']);

        if ($dari) {
            $query->whereDate('rental_date', '>=', $dari);
        }

        if ($sampai) {
            $query->whereDate('rental_date', '<=', $sampai);
        }

        if ($status) {
            $query->where('status', $status);
        }

        if ($cari) {
            $query->where('rental_code', 'like', '%'.$cari.'%');
        }

        $transactions = $query->orderBy('rental_date')->get();

        return [
            'transactions' => $transactions,
            'dari' => $dari,
            'sampai' => $sampai,
            'statusDipilih' => $status,
            'cari' => $cari,
            'totalTransaksi' => $transactions->count(),
            'totalPendapatan' => $transactions->sum('total_price'),
            'totalDenda' => $transactions->sum('fine'),
        ];
    }
}
