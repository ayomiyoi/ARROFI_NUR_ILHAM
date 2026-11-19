@extends('layouts.app')
@section('title','Dashboard Pengguna') @section('page-title','Dashboard Pengguna')
@section('content')
<div class="mb-4"><h4 class="fw-bold mb-1">Dashboard Pengguna</h4><p class="text-muted mb-0">Pantau pengajuan dan peminjaman konsol kamu.</p></div>
@php($stats = [['Total Pengajuan',$totalPengajuan,'bx-receipt','primary'],['Menunggu',$menunggu,'bx-time-five','warning'],['Sedang Dipinjam',$dipinjam,'bx-joystick','info'],['Selesai',$selesai,'bx-check-circle','success']])
<div class="row">@foreach($stats as $s)<div class="col-lg-3 col-md-6 col-12 mb-4"><div class="card"><div class="card-body d-flex align-items-center justify-content-between"><div><span class="text-muted">{{ $s[0] }}</span><h3 class="mb-0 mt-2">{{ $s[1] }}</h3></div><div class="avatar"><span class="avatar-initial rounded bg-label-{{ $s[3] }}"><i class="bx {{ $s[2] }} bx-sm"></i></span></div></div></div></div>@endforeach</div>
<div class="card"><div class="card-body"><h5 class="card-title">Mulai Peminjaman</h5><p>Lihat konsol yang tersedia dan ajukan peminjaman.</p><a href="{{ Route::has('consoles.index') ? route('consoles.index') : '#' }}" class="btn btn-primary"><i class="bx bx-joystick me-1"></i>Lihat Konsol</a></div></div>
@endsection
