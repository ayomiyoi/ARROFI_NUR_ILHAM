@extends('layouts.app')

@section('title', 'Edit Kategori')

@section('content')
  <div class="row">
    <div class="col-md-8">
      <div class="card">
        <h5 class="card-header">Edit Kategori</h5>
        <div class="card-body">
          <form action="{{ route('categories.update', $category) }}" method="POST">
            @csrf
            @method('PUT')
            @include('categories.partials.form')
            <button class="btn btn-primary" type="submit">Perbarui</button>
            <a href="{{ route('categories.index') }}" class="btn btn-secondary">Kembali</a>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection
