@extends('layouts.app')
@section('title','Dashboard Admin') @section('page-title','Dashboard Admin')
@section('content')
<div class="mb-4"><h4 class="fw-bold mb-1">Dashboard Admin</h4><p class="text-muted mb-0">Ringkasan pengelolaan GameVault.</p></div>
@php($stats = [
['Total Kategori',$totalKategori,'bx-category','primary'],['Total Konsol',$totalObjek,'bx-joystick','success'],
['Konsol Tersedia',$objekTersedia,'bx-check-circle','info'],['Total Pengguna',$totalUser,'bx-user','warning'],
['Menunggu Persetujuan',$menunggu,'bx-time-five','danger'],['Sedang Dipinjam',$dipinjam,'bx-transfer','secondary']
])
<div class="row">@foreach($stats as $s)<div class="col-lg-4 col-md-6 col-12 mb-4"><div class="card"><div class="card-body d-flex align-items-center justify-content-between"><div><span class="text-muted">{{ $s[0] }}</span><h3 class="mb-0 mt-2">{{ $s[1] }}</h3></div><div class="avatar"><span class="avatar-initial rounded bg-label-{{ $s[3] }}"><i class="bx {{ $s[2] }} bx-sm"></i></span></div></div></div></div>@endforeach</div>
<div class="row"><div class="col-12 mb-4"><div class="card"><h5 class="card-header">Aktivitas Terbaru</h5><div class="table-responsive text-nowrap"><table class="table"><thead><tr><th>Pengguna</th><th>Aktivitas</th><th>Waktu</th></tr></thead><tbody>
@forelse($aktivitasTerbaru as $a)<tr><td>{{ $a->user->name ?? 'Pengguna dihapus' }}</td><td>{{ $a->description }}</td><td>{{ $a->created_at?->format('d-m-Y H:i') }}</td></tr>@empty<tr><td colspan="3" class="text-center">Belum ada aktivitas.</td></tr>@endforelse
</tbody></table></div></div></div>
<div class="col-12"><div class="card"><h5 class="card-header">Konsol Populer</h5><div class="table-responsive text-nowrap"><table class="table"><thead><tr><th>Nama Konsol</th><th>Jumlah Transaksi</th></tr></thead><tbody>
@forelse($objekPopuler as $o)<tr><td>{{ $o->name }}</td><td>{{ $o->transactions_count }}</td></tr>@empty<tr><td colspan="2" class="text-center">Belum ada data konsol.</td></tr>@endforelse
</tbody></table></div></div></div></div>
@endsection
