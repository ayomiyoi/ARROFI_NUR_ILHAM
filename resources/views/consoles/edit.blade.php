@extends('layouts.app')

@section('title', 'Edit Objek')

@section('content')
  <div class="row">
    <div class="col-md-10">
      <div class="card">
        <h5 class="card-header">Edit Objek</h5>
        <div class="card-body">
          <form action="{{ route('consoles.update', $console) }}" method="POST">
            @csrf
            @method('PUT')
            @include('consoles.partials.form')
            <button class="btn btn-primary" type="submit">Perbarui</button>
            <a href="{{ route('consoles.index') }}" class="btn btn-secondary">Kembali</a>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection
