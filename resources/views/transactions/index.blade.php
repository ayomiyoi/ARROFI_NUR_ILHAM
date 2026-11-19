@extends('layouts.app')

@section('title', 'Pengajuan Saya')

@section('content')
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">Pengajuan Saya</h5>
          <a href="{{ route('transactions.create') }}" class="btn btn-primary btn-sm">
            <i class="bx bx-plus me-1"></i> Ajukan Peminjaman
          </a>
        </div>

        <div class="table-responsive text-nowrap">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Kode</th>
                <th>Objek</th>
                <th>Tanggal Pinjam</th>
                <th>Tanggal Kembali</th>
                <th>Lama</th>
                <th>Total Harga</th>
                <th>Status</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              @forelse ($transactions as $transaction)
                <tr>
                  <td>{{ $transactions->firstItem() + $loop->index }}</td>
                  <td><strong>{{ $transaction->rental_code }}</strong></td>
                  <td>{{ $transaction->console->name }}</td>
                  <td>{{ $transaction->rental_date->format('d-m-Y') }}</td>
                  <td>{{ $transaction->return_date->format('d-m-Y') }}</td>
                  <td>{{ $transaction->total_days }} hari</td>
                  <td>Rp {{ number_format($transaction->total_price, 0, ',', '.') }}</td>
                  <td>@include('partials.badge-status', ['status' => $transaction->status])</td>
                  <td>
                    <a href="{{ route('transactions.show', $transaction) }}" class="btn btn-sm btn-info">Detail</a>
                    @if ($transaction->status === 'pending')
                      <form action="{{ route('transactions.batalkan', $transaction) }}" method="POST" class="d-inline" onsubmit="return confirm('Batalkan pengajuan ini?')">
                        @csrf
                        <button class="btn btn-sm btn-danger" type="submit">Batalkan</button>
                      </form>
                    @endif
                  </td>
                </tr>
              @empty
                <tr>
                  <td colspan="9" class="text-center text-muted">Belum ada pengajuan peminjaman.</td>
                </tr>
              @endforelse
            </tbody>
          </table>
        </div>

        @if ($transactions->hasPages())
          <div class="card-body">
            {{ $transactions->links() }}
          </div>
        @endif
      </div>
    </div>
  </div>
@endsection
