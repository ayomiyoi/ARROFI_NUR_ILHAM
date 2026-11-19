@extends('layouts.app')
@section('title','Dashboard Petugas') @section('page-title','Dashboard Petugas')
@section('content')
<div class="mb-4"><h4 class="fw-bold mb-1">Dashboard Petugas</h4><p class="text-muted mb-0">Ringkasan transaksi dan pengembalian konsol.</p></div>
@php($stats = [['Menunggu Persetujuan',$menunggu,'bx-time-five','warning'],['Disetujui',$disetujui,'bx-check','info'],['Sedang Dipinjam',$dipinjam,'bx-transfer','primary']])
<div class="row">@foreach($stats as $s)<div class="col-lg-4 col-md-6 col-12 mb-4"><div class="card"><div class="card-body d-flex align-items-center justify-content-between"><div><span class="text-muted">{{ $s[0] }}</span><h3 class="mb-0 mt-2">{{ $s[1] }}</h3></div><div class="avatar"><span class="avatar-initial rounded bg-label-{{ $s[3] }}"><i class="bx {{ $s[2] }} bx-sm"></i></span></div></div></div></div>@endforeach</div>
<div class="card"><div class="card-body"><h5 class="card-title">Menu Petugas</h5><p>Kelola persetujuan transaksi dan proses pengembalian konsol.</p>
<a href="{{ Route::has('transaction.index') ? route('transaction.index') : '#' }}" class="btn btn-primary me-2"><i class="bx bx-transfer me-1"></i>Kelola Transaksi</a>
<a href="{{ Route::has('pengembalian.index') ? route('pengembalian.index') : '#' }}" class="btn btn-outline-primary"><i class="bx bx-undo me-1"></i>Pengembalian</a></div></div>
@endsection
