@extends('layouts.app')

@section('title', 'Tambah Kategori')

@section('content')
  <div class="row">
    <div class="col-md-8">
      <div class="card">
        <h5 class="card-header">Tambah Kategori</h5>
        <div class="card-body">
          <form action="{{ route('categories.store') }}" method="POST">
            @csrf
            {{-- @include('categories.partials.form') --}}
            <div class="mb-3">
                <label for="name" class="form-label">Nama Kategori</label>
                <input
                    type="text"
                    name="name"
                    id="name"
                    value="{{ old('name', $category->name ?? '') }}"
                    class="form-control @error('name') is-invalid @enderror"
                    placeholder="Contoh: Konsol PlayStation"
                />
                @error('name')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
                </div>

                <div class="mb-3">
                <label for="description" class="form-label">Deskripsi</label>
                <textarea
                    name="description"
                    id="description"
                    rows="3"
                    class="form-control @error('description') is-invalid @enderror"
                    placeholder="Keterangan tambahan (boleh dikosongkan)"
                >{{ old('description', $category->description ?? '') }}</textarea>
                @error('description')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
                <div class="form-text">Slug dibuat otomatis dari nama kategori.</div>
            </div>
            <button class="btn btn-primary" type="submit">Simpan</button>
            <a href="{{ route('categories.index') }}" class="btn btn-secondary">Kembali</a>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection
