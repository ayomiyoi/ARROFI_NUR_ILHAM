@extends('layouts.app')

@section('title', 'Tambah Objek')

@section('content')
  <div class="row">
    <div class="col-md-10">
      <div class="card">
        <h5 class="card-header">Tambah Objek</h5>
        <div class="card-body">
          <form action="{{ route('consoles.store') }}" method="POST">
            @csrf
            @include('consoles.partials.form')
            <button class="btn btn-primary" type="submit">Simpan</button>
            <a href="{{ route('consoles.index') }}" class="btn btn-secondary">Kembali</a>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection
