<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
<div class="app-brand demo"><a href="{{ route('dashboard') }}" class="app-brand-link">
<span class="app-brand-logo demo"><i class="bx bx-joystick text-primary" style="font-size:2rem"></i></span>
<span class="app-brand-text demo menu-text fw-bolder ms-2">GameVault</span></a>
<a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none"><i class="bx bx-chevron-left bx-sm align-middle"></i></a></div>
<div class="menu-inner-shadow"></div><ul class="menu-inner py-1">
<li class="menu-header small text-uppercase"><span class="menu-header-text">Menu Utama</span></li>
<li class="menu-item {{ request()->routeIs('dashboard') ? 'active' : '' }}"><a href="{{ route('dashboard') }}" class="menu-link"><i class="menu-icon tf-icons bx bx-home-circle"></i><div>Dashboard</div></a></li>
@if(auth()->user()->isAdmin())
<li class="menu-header small text-uppercase"><span class="menu-header-text">Manajemen</span></li>
<li class="menu-item"><a href="{{ Route::has('categories.index') ? route('categories.index') : '#' }}" class="menu-link"><i class="menu-icon tf-icons bx bx-category"></i><div>Kategori</div></a></li>
<li class="menu-item"><a href="{{ Route::has('consoles.index') ? route('consoles.index') : '#' }}" class="menu-link"><i class="menu-icon tf-icons bx bx-joystick"></i><div>Data Konsol</div></a></li>
<li class="menu-item"><a href="{{ Route::has('users.index') ? route('users.index') : '#' }}" class="menu-link"><i class="menu-icon tf-icons bx bx-user"></i><div>Data Pengguna</div></a></li>
@endif
@if(auth()->user()->isAdmin() || auth()->user()->isPetugas())
<li class="menu-header small text-uppercase"><span class="menu-header-text">Transaksi</span></li>
<li class="menu-item"><a href="{{ Route::has('transaction.index') ? route('transaction.index') : '#' }}" class="menu-link"><i class="menu-icon tf-icons bx bx-transfer"></i><div>Transaksi</div></a></li>
<li class="menu-item"><a href="{{ Route::has('pengembalian.index') ? route('pengembalian.index') : '#' }}" class="menu-link"><i class="menu-icon tf-icons bx bx-undo"></i><div>Pengembalian</div></a></li>
@endif
@if(auth()->user()->isAdmin())
<li class="menu-header small text-uppercase"><span class="menu-header-text">Lainnya</span></li>
<li class="menu-item"><a href="{{ Route::has('activity-logs.index') ? route('activity-logs.index') : '#' }}" class="menu-link"><i class="menu-icon tf-icons bx bx-history"></i><div>Log Aktivitas</div></a></li>
<li class="menu-item"><a href="{{ Route::has('reports.index') ? route('reports.index') : '#' }}" class="menu-link"><i class="menu-icon tf-icons bx bx-file"></i><div>Laporan</div></a></li>
@endif</ul></aside>
