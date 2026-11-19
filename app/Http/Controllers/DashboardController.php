<?php

namespace App\Http\Controllers;

use App\Models\ActivityLog;
use App\Models\Category;
use App\Models\Console;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\View\View;

class DashboardController extends Controller
{
    public function index(): View
    {
        $user = auth()->user();

        if ($user->isPengguna()) {
            return view('dashboard.pengguna', [
                'totalPengajuan' => Transaction::where('user_id', $user->id)->count(),
                'menunggu' => Transaction::where('user_id', $user->id)->where('status', 'pending')->count(),
                'dipinjam' => Transaction::where('user_id', $user->id)->where('status', 'borrowed')->count(),
                'selesai' => Transaction::where('user_id', $user->id)->where('status', 'returned')->count(),
            ]);
        }

        if ($user->isPetugas()) {
            return view('dashboard.petugas', [
                'menunggu' => Transaction::where('status', 'pending')->count(),
                'disetujui' => Transaction::where('status', 'approved')->count(),
                'dipinjam' => Transaction::where('status', 'borrowed')->count(),
                'terlambat' => Transaction::where('status', 'late')->count(),
            ]);
        }

        // $bulan = [];
        // $jumlahPeminjaman = [];

        // for ($i = 5; $i >= 0; $i--) {
        //     $waktu = now()->subMonths($i);

        //     $bulan[] = $waktu->translatedFormat('M Y');
        //     $jumlahPeminjaman[] = Transaction::whereYear('rental_date', $waktu->year)
        //         ->whereMonth('rental_date', $waktu->month)
        //         ->count();
        // }

        return view('dashboard.admin', [
            'totalKategori' => Category::count(),
            'totalObjek' => Console::count(),
            'objekTersedia' => Console::where('status', 'available')->count(),
            'totalUser' => User::count(),
            'menunggu' => Transaction::where('status', 'pending')->count(),
            'dipinjam' => Transaction::where('status', 'borrowed')->count(),
            'aktivitasTerbaru' => ActivityLog::with('user')->orderByDesc('id')->limit(5)->get(),
            // 'bulan' => $bulan,
            // 'jumlahPeminjaman' => $jumlahPeminjaman,
            'objekPopuler' => Console::withCount('transactions')->orderByDesc('transactions_count')->limit(5)->get(),
        ]);
    }
}
