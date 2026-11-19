@extends('layouts.app')

@section('title', 'Pengembalian')

@section('content')
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">Pengembalian Objek</h5>

          <form action="{{ route('pengembalian.index') }}" method="GET" class="d-flex gap-2">
            <input type="text" name="q" value="{{ $cari }}" class="form-control form-control-sm" placeholder="Cari kode peminjaman..." />
            <select name="status" class="form-select form-select-sm" onchange="this.form.submit()">
              @foreach (['borrowed' => 'Sedang Dipinjam', 'returned' => 'Selesai', 'late' => 'Terlambat'] as $nilai => $label)
                <option value="{{ $nilai }}" @selected($statusDipilih === $nilai)>{{ $label }}</option>
              @endforeach
            </select>
            <button class="btn btn-sm btn-outline-primary" type="submit">Cari</button>
          </form>
        </div>

        <div class="table-responsive text-nowrap">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Kode</th>
                <th>Peminjam</th>
                <th>Objek</th>
                <th>Jatuh Tempo</th>
                <th>Lama Pinjam</th>
                <th>Total Harga</th>
                <th>Kondisi Kembali</th>
                <th>Denda</th>
                <th>Status</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              @forelse ($transactions as $transaction)
                <tr>
                  <td>{{ $transactions->firstItem() + $loop->index }}</td>
                  <td><strong>{{ $transaction->rental_code }}</strong></td>
                  <td>{{ $transaction->user->name }}</td>
                  <td>{{ $transaction->console->name }}</td>
                  <td>
                    {{ $transaction->return_date->format('d-m-Y') }}
                    @if ($transaction->status === 'borrowed' && $transaction->return_date->lt(today()))
                      <span class="badge bg-label-danger">{{ (int) $transaction->return_date->diffInDays(today(), true) }} hari lewat</span>
                    @endif
                  </td>
                  <td>{{ $transaction->total_days }} hari</td>
                  <td>Rp {{ number_format($transaction->total_price, 0, ',', '.') }}</td>
                  <td>{{ $transaction->retur ? App\Models\Console::daftarKondisi()[$transaction->retur->condition] : '-' }}</td>
                  <td>Rp {{ number_format($transaction->retur->fine ?? 0, 0, ',', '.') }}</td>
                  <td>@include('partials.badge-status', ['status' => $transaction->status])</td>
                  <td>
                    <a href="{{ route('transactions.show', $transaction) }}" class="btn btn-sm btn-info">Detail</a>
                    @if ($transaction->status === 'borrowed')
                      <a href="{{ route('pengembalian.create', $transaction) }}" class="btn btn-sm btn-primary">Kembalikan</a>
                    @endif
                  </td>
                </tr>
              @empty
                <tr>
                  <td colspan="11" class="text-center text-muted">Tidak ada data pengembalian.</td>
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
