@extends('layouts.app')

@section('title', 'Log Aktivitas')

@section('content')
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h5 class="mb-3">Log Aktivitas</h5>

          <form action="{{ route('log-aktivitas.index') }}" method="GET" class="row g-2 align-items-end">
            <div class="col-md-3">
              <label for="action" class="form-label mb-1">Jenis Aksi</label>
              <select name="action" id="action" class="form-select form-select-sm">
                <option value="">Semua Aksi</option>
                @foreach (App\Models\ActivityLog::daftarAksi() as $nilai => $label)
                  <option value="{{ $nilai }}" @selected($aksiDipilih === $nilai)>{{ $label }}</option>
                @endforeach
              </select>
            </div>

            <div class="col-md-3">
              <label for="user_id" class="form-label mb-1">Pengguna</label>
              <select name="user_id" id="user_id" class="form-select form-select-sm">
                <option value="">Semua Pengguna</option>
                @foreach ($users as $user)
                  <option value="{{ $user->id }}" @selected((string) $userDipilih === (string) $user->id)>{{ $user->name }}</option>
                @endforeach
              </select>
            </div>

            <div class="col-md-3">
              <label for="tanggal" class="form-label mb-1">Tanggal</label>
              <input type="date" name="tanggal" id="tanggal" value="{{ $tanggalDipilih }}" class="form-control form-control-sm" />
            </div>

            <div class="col-md-3">
              <label for="q" class="form-label mb-1">Keterangan</label>
              <input type="text" name="q" id="q" value="{{ $cari }}" class="form-control form-control-sm" placeholder="Cari keterangan..." />
            </div>

            <div class="col-md-12 mt-2">
              <button class="btn btn-sm btn-primary" type="submit">Filter</button>
              <a href="{{ route('log-aktivitas.index') }}" class="btn btn-sm btn-secondary">Reset</a>
            </div>
          </form>
        </div>

        <div class="table-responsive text-nowrap">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Waktu</th>
                <th>Pengguna</th>
                <th>Aksi</th>
                <th>Keterangan</th>
                <th>Data Terkait</th>
                <th>IP Address</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              @forelse ($logs as $log)
                <tr>
                  <td>{{ $logs->firstItem() + $loop->index }}</td>
                  <td>{{ $log->created_at->format('d-m-Y H:i') }}</td>
                  <td>{{ $log->user->name ?? 'Sistem' }}</td>
                  <td>@include('partials.badge-aksi', ['log' => $log])</td>
                  <td>{{ $log->description ?? '-' }}</td>
                  <td>
                    @if ($log->subject_type)
                      {{ class_basename($log->subject_type) }} #{{ $log->subject_id }}
                    @else
                      -
                    @endif
                  </td>
                  <td>{{ $log->ip_address ?? '-' }}</td>
                </tr>
              @empty
                <tr>
                  <td colspan="7" class="text-center text-muted">Belum ada aktivitas yang cocok dengan filter.</td>
                </tr>
              @endforelse
            </tbody>
          </table>
        </div>

        @if ($logs->hasPages())
          <div class="card-body">
            {{ $logs->links() }}
          </div>
        @endif
      </div>
    </div>
  </div>
@endsection
