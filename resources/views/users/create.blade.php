@extends('layouts.app')

@section('title', 'Tambah User')

@section('content')
  <div class="row">
    <div class="col-md-8">
      <div class="card">
        <h5 class="card-header">Tambah User</h5>
        <div class="card-body">
          <form action="{{ route('users.store') }}" method="POST">
            @csrf
            @include('users.partials.form')
            <button class="btn btn-primary" type="submit">Simpan</button>
            <a href="{{ route('users.index') }}" class="btn btn-secondary">Kembali</a>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection
