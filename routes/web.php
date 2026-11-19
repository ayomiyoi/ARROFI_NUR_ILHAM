<?php

use App\Http\Controllers\ActivityLogController;
use App\Http\Controllers\ApprovalController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ConsoleController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ReturnController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/login', [AuthController::class, 'showLogin'])->middleware('guest')->name('login');
Route::post('/login', [AuthController::class, 'login'])->middleware('guest');
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth')->name('logout');

Route::middleware('auth')->group(function () {
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');

    Route::resource('categories', CategoryController::class)->except('show');
    Route::resource('consoles', ConsoleController::class)->except('show');
    Route::resource('users', UserController::class)->except('show');

    Route::resource('transactions', TransactionController::class)->only(['index', 'create', 'store', 'show']);
    Route::post('transactions/{transaction}/batalkan', [TransactionController::class, 'batalkan'])->name('transactions.batalkan');

    Route::get('persetujuan', [ApprovalController::class, 'index'])->name('persetujuan.index');
    Route::post('persetujuan/{transaction}/setujui', [ApprovalController::class, 'setujui'])->name('persetujuan.setujui');
    Route::post('persetujuan/{transaction}/tolak', [ApprovalController::class, 'tolak'])->name('persetujuan.tolak');
    Route::post('persetujuan/{transaction}/pinjam', [ApprovalController::class, 'pinjam'])->name('persetujuan.pinjam');

    Route::get('pengembalian', [ReturnController::class, 'index'])->name('pengembalian.index');
    Route::get('pengembalian/{transaction}/kembalikan', [ReturnController::class, 'create'])->name('pengembalian.create');
    Route::post('pengembalian/{transaction}/kembalikan', [ReturnController::class, 'store'])->name('pengembalian.store');

    Route::get('log-aktivitas', [ActivityLogController::class, 'index'])->name('log-aktivitas.index');

    Route::get('laporan', [ReportController::class, 'index'])->name('laporan.index');
    Route::get('laporan/cetak', [ReportController::class, 'cetak'])->name('laporan.cetak');
    Route::get('laporan/export', [ReportController::class, 'export'])->name('laporan.export');
});
