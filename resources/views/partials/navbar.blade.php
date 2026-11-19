<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none"><a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)"><i class="bx bx-menu bx-sm"></i></a></div>
<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse"><div class="navbar-nav align-items-center"><span class="fw-semibold">@yield('page-title', 'Dashboard')</span></div>
<ul class="navbar-nav flex-row align-items-center ms-auto"><li class="nav-item lh-1 me-3 d-none d-sm-block"><span class="fw-semibold">{{ auth()->user()->name }}</span></li>
<li class="nav-item"><form action="{{ route('logout') }}" method="POST">@csrf<button class="btn btn-sm btn-outline-danger" type="submit"><i class="bx bx-log-out me-1"></i>Keluar</button></form></li></ul></div></nav>
