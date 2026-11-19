@extends('layouts.app')

@section('title', 'Data Objek')

@section('content')
  @php
    $warnaStatus = ['available' => 'success', 'rented' => 'info', 'maintenance' => 'warning', 'inactive' => 'secondary'];
  @endphp

  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">Data Objek</h5>

          <form action="{{ route('consoles.index') }}" method="GET" class="d-flex gap-2">
            <input type="text" name="q" value="{{ $cari }}" class="form-control form-control-sm" placeholder="Cari nama objek..." />
            <button class="btn btn-sm btn-outline-primary" type="submit">Cari</button>
          </form>

          <a href="{{ route('consoles.create') }}" class="btn btn-primary btn-sm">
            <i class="bx bx-plus me-1"></i> Tambah Objek
          </a>
        </div>

        <div class="table-responsive text-nowrap">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama Objek</th>
                <th>Kategori</th>
                <th>Ruangan</th>
                <th>Tarif / Hari</th>
                <th>Stok</th>
                <th>Status</th>
                <th>Kondisi</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              @forelse ($consoles as $console)
                <tr>
                  <td>{{ $consoles->firstItem() + $loop->index }}</td>
                  <td>
                    <strong>{{ $console->name }}</strong>
                    @if ($console->desk_number)
                      <small class="text-muted d-block">Meja {{ $console->desk_number }}</small>
                    @endif
                  </td>
                  <td>{{ $console->category->name }}</td>
                  <td>{{ $console->room->name ?? '-' }}</td>
                  <td>Rp {{ number_format($console->price_per_day, 0, ',', '.') }}</td>
                  <td>{{ $console->stock }}</td>
                  <td><span class="badge bg-label-{{ $warnaStatus[$console->status] ?? 'secondary' }}">{{ $console->labelStatus() }}</span></td>
                  <td>{{ $console->labelKondisi() }}</td>
                  <td>
                    <a href="{{ route('consoles.edit', $console) }}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="{{ route('consoles.destroy', $console) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus objek ini?')">
                      @csrf
                      @method('DELETE')
                      <button class="btn btn-sm btn-danger" type="submit">Hapus</button>
                    </form>
                  </td>
                </tr>
              @empty
                <tr>
                  <td colspan="9" class="text-center text-muted">Belum ada data objek.</td>
                </tr>
              @endforelse
            </tbody>
          </table>
        </div>

        @if ($consoles->hasPages())
          <div class="card-body">
            {{ $consoles->links() }}
          </div>
        @endif
      </div>
    </div>
  </div>
@endsection
