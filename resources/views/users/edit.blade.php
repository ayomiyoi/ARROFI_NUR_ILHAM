@extends('layouts.app')

@section('title', 'Edit User')

@section('content')
  <div class="row">
    <div class="col-md-8">
      <div class="card">
        <h5 class="card-header">Edit User</h5>
        <div class="card-body">
          <form action="{{ route('users.update', $user) }}" method="POST">
            @csrf
            @method('PUT')
            @include('users.partials.form')
            <button class="btn btn-primary" type="submit">Perbarui</button>
            <a href="{{ route('users.index') }}" class="btn btn-secondary">Kembali</a>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection
