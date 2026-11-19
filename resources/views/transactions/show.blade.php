@extends('layouts.app')

@section('title', 'Detail Pengajuan')

@section('content')
  <div class="row">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">Detail Pengajuan {{ $transaction->rental_code }}</h5>
          @include('partials.badge-status', ['status' => $transaction->status])
        </div>
        <div class="card-body">
          <table class="table table-borderless">
            <tr>
              <th width="35%">Nama Peminjam</th>
              <td>{{ $transaction->user->name }}</td>
            </tr>
            <tr>
              <th>Objek</th>
              <td>{{ $transaction->console->name }} ({{ $transaction->console->category->name }})</td>
            </tr>
            <tr>
              <th>Tanggal Pinjam</th>
              <td>{{ $transaction->rental_date->format('d-m-Y') }}</td>
            </tr>
            <tr>
              <th>Tanggal Kembali</th>
              <td>{{ $transaction->return_date->format('d-m-Y') }}</td>
            </tr>
            <tr>
              <th>Lama Peminjaman</th>
              <td>{{ $transaction->total_days }} hari</td>
            </tr>
            <tr>
              <th>Total Harga</th>
              <td>Rp {{ number_format($transaction->total_price, 0, ',', '.') }}</td>
            </tr>
            <tr>
              <th>Uang Jaminan</th>
              <td>Rp {{ number_format($transaction->deposit, 0, ',', '.') }}</td>
            </tr>
            <tr>
              <th>Denda</th>
              <td>Rp {{ number_format($transaction->fine, 0, ',', '.') }}</td>
            </tr>
            <tr>
              <th>Identitas</th>
              <td>{{ $transaction->identification ?? '-' }}</td>
            </tr>
            <tr>
              <th>Catatan</th>
              <td>{{ $transaction->notes ?? '-' }}</td>
            </tr>
            <tr>
              <th>Disetujui Oleh</th>
              <td>{{ $transaction->approver->name ?? '-' }}</td>
            </tr>
            @if ($transaction->retur)
              <tr>
                <th>Tanggal Dikembalikan</th>
                <td>{{ $transaction->retur->return_date->format('d-m-Y') }}</td>
              </tr>
              <tr>
                <th>Kondisi Saat Kembali</th>
                <td>{{ App\Models\Console::daftarKondisi()[$transaction->retur->condition] }}</td>
              </tr>
              <tr>
                <th>Catatan Pengembalian</th>
                <td>{{ $transaction->retur->notes ?? '-' }}</td>
              </tr>
            @endif
          </table>

          @if (auth()->user()->isPengguna() && $transaction->status === 'pending')
            <form action="{{ route('transactions.batalkan', $transaction) }}" method="POST" onsubmit="return confirm('Batalkan pengajuan ini?')">
              @csrf
              <button class="btn btn-danger" type="submit">Batalkan Pengajuan</button>
            </form>
          @endif

          <a href="{{ url()->previous() }}" class="btn btn-secondary">Kembali</a>
        </div>
      </div>
    </div>
  </div>
@endsection
