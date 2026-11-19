@extends('layouts.app')

@section('title', 'Persetujuan Peminjaman')

@section('content')
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">Persetujuan Peminjaman</h5>

          <form action="{{ route('persetujuan.index') }}" method="GET" class="d-flex gap-2">
            <input type="text" name="q" value="{{ $cari }}" class="form-control form-control-sm" placeholder="Cari kode peminjaman..." />
            <select name="status" class="form-select form-select-sm" onchange="this.form.submit()">
              <option value="">Semua Status</option>
              @foreach (App\Models\Transaction::daftarStatus() as $nilai => $label)
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
                <th>Tanggal Pinjam</th>
                <th>Tanggal Kembali</th>
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
                  <td>{{ $transaction->user->name }}</td>
                  <td>{{ $transaction->console->name }}</td>
                  <td>{{ $transaction->rental_date->format('d-m-Y') }}</td>
                  <td>{{ $transaction->return_date->format('d-m-Y') }}</td>
                  <td>Rp {{ number_format($transaction->total_price, 0, ',', '.') }}</td>
                  <td>@include('partials.badge-status', ['status' => $transaction->status])</td>
                  <td>
                    <a href="{{ route('transactions.show', $transaction) }}" class="btn btn-sm btn-info">Detail</a>

                    @if ($transaction->status === 'pending')
                      <form action="{{ route('persetujuan.setujui', $transaction) }}" method="POST" class="d-inline" onsubmit="return confirm('Setujui pengajuan ini?')">
                        @csrf
                        <button class="btn btn-sm btn-success" type="submit">Setujui</button>
                      </form>
                      <form action="{{ route('persetujuan.tolak', $transaction) }}" method="POST" class="d-inline" onsubmit="return confirm('Tolak pengajuan ini?')">
                        @csrf
                        <button class="btn btn-sm btn-danger" type="submit">Tolak</button>
                      </form>
                    @elseif ($transaction->status === 'approved')
                      <form action="{{ route('persetujuan.pinjam', $transaction) }}" method="POST" class="d-inline" onsubmit="return confirm('Serahkan objek ke peminjam?')">
                        @csrf
                        <button class="btn btn-sm btn-primary" type="submit">Serah Terima</button>
                      </form>
                    @endif
                  </td>
                </tr>
              @empty
                <tr>
                  <td colspan="9" class="text-center text-muted">Tidak ada pengajuan yang perlu diproses.</td>
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
