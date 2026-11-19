@extends('layouts.app')

@section('title', 'Data Kategori')

@section('content')
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">Data Kategori</h5>

          <form action="{{ route('categories.index') }}" method="GET" class="d-flex gap-2">
            <input type="text" name="q" value="{{ $cari }}" class="form-control form-control-sm" placeholder="Cari nama kategori..." />
            <button class="btn btn-sm btn-outline-primary" type="submit">Cari</button>
          </form>

          <a href="{{ route('categories.create') }}" class="btn btn-primary btn-sm">
            <i class="bx bx-plus me-1"></i> Tambah Kategori
          </a>
        </div>

        <div class="table-responsive text-nowrap">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Slug</th>
                
                <th>Jumlah Objek</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              @forelse ($categories as $category)
                <tr>
                  <td>{{ $categories->firstItem() + $loop->index }}</td>
                  <td><strong>{{ $category->name }}</strong></td>
                  <td>{{ $category->slug }}</td>
                  {{-- <td>{{ $category->description ?? '-' }}</td> --}}
                  <td><span class="badge bg-label-primary">{{ $category->consoles_count }}</span></td>
                  <td>
                    <a href="{{ route('categories.edit', $category) }}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="{{ route('categories.destroy', $category) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus kategori ini?')">
                      @csrf
                      @method('DELETE')
                      <button class="btn btn-sm btn-danger" type="submit">Hapus</button>
                    </form>
                  </td>
                </tr>
              @empty
                <tr>
                  <td colspan="6" class="text-center text-muted">Belum ada data kategori.</td>
                </tr>
              @endforelse
            </tbody>
          </table>
        </div>

        @if ($categories->hasPages())
          <div class="card-body">
            {{ $categories->links() }}
          </div>
        @endif
      </div>
    </div>
  </div>
@endsection
