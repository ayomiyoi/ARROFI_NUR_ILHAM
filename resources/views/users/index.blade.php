@extends('layouts.app')

@section('title', 'Data User')

@section('content')
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">Data User</h5>

          <form action="{{ route('users.index') }}" method="GET" class="d-flex gap-2">
            <input type="text" name="q" value="{{ $cari }}" class="form-control form-control-sm" placeholder="Cari nama atau email..." />
            <button class="btn btn-sm btn-outline-primary" type="submit">Cari</button>
          </form>

          <a href="{{ route('users.create') }}" class="btn btn-primary btn-sm">
            <i class="bx bx-plus me-1"></i> Tambah User
          </a>
        </div>

        <div class="table-responsive text-nowrap">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Email</th>
                <th>Telepon</th>
                <th>Alamat</th>
                <th>Role</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              @forelse ($users as $user)
                <tr>
                  <td>{{ $users->firstItem() + $loop->index }}</td>
                  <td>
                    <strong>{{ $user->name }}</strong>
                    @if ($user->is(auth()->user()))
                      <span class="badge bg-label-info ms-1">Anda</span>
                    @endif
                  </td>
                  <td>{{ $user->email }}</td>
                  <td>{{ $user->phone ?? '-' }}</td>
                  <td>{{ $user->address ?? '-' }}</td>
                  <td><span class="badge bg-label-primary">{{ $user->role->name }}</span></td>
                  <td>
                    <a href="{{ route('users.edit', $user) }}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="{{ route('users.destroy', $user) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus user ini?')">
                      @csrf
                      @method('DELETE')
                      <button class="btn btn-sm btn-danger" type="submit">Hapus</button>
                    </form>
                  </td>
                </tr>
              @empty
                <tr>
                  <td colspan="7" class="text-center text-muted">Belum ada data user.</td>
                </tr>
              @endforelse
            </tbody>
          </table>
        </div>

        @if ($users->hasPages())
          <div class="card-body">
            {{ $users->links() }}
          </div>
        @endif
      </div>
    </div>
  </div>
@endsection
