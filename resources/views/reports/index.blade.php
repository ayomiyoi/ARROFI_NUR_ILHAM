@extends('layouts.app')

@section('title', 'Laporan Peminjaman')

@section('content')
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h5 class="mb-3">Laporan Peminjaman</h5>

          <form action="{{ route('laporan.index') }}" method="GET" class="row g-2 align-items-end">
            <div class="col-md-3">
              <label for="dari" class="form-label mb-1">Dari Tanggal</label>
              <input type="date" name="dari" id="dari" value="{{ $dari }}" class="form-control form-control-sm" />
            </div>

            <div class="col-md-3">
              <label for="sampai" class="form-label mb-1">Sampai Tanggal</label>
              <input type="date" name="sampai" id="sampai" value="{{ $sampai }}" class="form-control form-control-sm" />
            </div>

            <div class="col-md-3">
              <label for="status" class="form-label mb-1">Status</label>
              <select name="status" id="status" class="form-select form-select-sm">
                <option value="">Semua Status</option>
                @foreach (App\Models\Transaction::daftarStatus() as $nilai => $label)
                  <option value="{{ $nilai }}" @selected($statusDipilih === $nilai)>{{ $label }}</option>
                @endforeach
              </select>
            </div>

            <div class="col-md-3">
              <label for="q" class="form-label mb-1">Kode Peminjaman</label>
              <input type="text" name="q" id="q" value="{{ $cari }}" class="form-control form-control-sm" placeholder="Cari kode..." />
            </div>

            <div class="col-md-12 mt-2">
              <button class="btn btn-sm btn-primary" type="submit">Tampilkan</button>
              <a href="{{ route('laporan.index') }}" class="btn btn-sm btn-secondary">Reset</a>
              <a href="{{ route('laporan.cetak', request()->query()) }}" target="_blank" class="btn btn-sm btn-success">Cetak</a>
              <a href="{{ route('laporan.export', request()->query()) }}" class="btn btn-sm btn-outline-primary">Export CSV</a>
            </div>
          </form>
        </div>

        <div class="card-body border-bottom">
          <div class="row">
            <div class="col-md-4">
              <div class="border rounded p-3 mb-2 mb-md-0">
                <span class="text-muted d-block">Jumlah Transaksi</span>
                <h4 class="mb-0">{{ $totalTransaksi }}</h4>
              </div>
            </div>
            <div class="col-md-4">
              <div class="border rounded p-3 mb-2 mb-md-0">
                <span class="text-muted d-block">Total Pendapatan</span>
                <h4 class="mb-0">Rp {{ number_format($totalPendapatan, 0, ',', '.') }}</h4>
              </div>
            </div>
            <div class="col-md-4">
              <div class="border rounded p-3">
                <span class="text-muted d-block">Total Denda</span>
                <h4 class="mb-0">Rp {{ number_format($totalDenda, 0, ',', '.') }}</h4>
              </div>
            </div>
          </div>
        </div>

        <div class="table-responsive text-nowrap">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Kode</th>
                <th>Tanggal Pinjam</th>
                <th>Peminjam</th>
                <th>Objek</th>
                <th>Lama</th>
                <th>Total Harga</th>
                <th>Denda</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              @forelse ($transactions as $transaction)
                <tr>
                  <td>{{ $loop->iteration }}</td>
                  <td><strong>{{ $transaction->rental_code }}</strong></td>
                  <td>{{ $transaction->rental_date->format('d-m-Y') }}</td>
                  <td>{{ $transaction->user->name }}</td>
                  <td>{{ $transaction->console->name }}</td>
                  <td>{{ $transaction->total_days }} hari</td>
                  <td>Rp {{ number_format($transaction->total_price, 0, ',', '.') }}</td>
                  <td>Rp {{ number_format($transaction->fine, 0, ',', '.') }}</td>
                  <td>@include('partials.badge-status', ['status' => $transaction->status])</td>
                </tr>
              @empty
                <tr>
                  <td colspan="9" class="text-center text-muted">Tidak ada data peminjaman pada periode ini.</td>
                </tr>
              @endforelse
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
@endsection
