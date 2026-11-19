<!DOCTYPE html>
<html lang="id" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="{{ asset('assets') }}/" data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>@yield('title', 'Dashboard') | GameVault</title>
<link rel="icon" href="{{ asset('assets/img/favicon/favicon.ico') }}">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="{{ asset('assets/vendor/fonts/boxicons.css') }}">
<link rel="stylesheet" href="{{ asset('assets/vendor/css/core.css') }}" class="template-customizer-core-css">
<link rel="stylesheet" href="{{ asset('assets/vendor/css/theme-default.css') }}" class="template-customizer-theme-css">
<link rel="stylesheet" href="{{ asset('assets/css/demo.css') }}">
<link rel="stylesheet" href="{{ asset('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css') }}">
@stack('styles')
<script src="{{ asset('assets/vendor/js/helpers.js') }}"></script><script src="{{ asset('assets/js/config.js') }}"></script>
</head><body>
<div class="layout-wrapper layout-content-navbar"><div class="layout-container">
@include('partials.sidebar')
<div class="layout-page">@include('partials.navbar')
<div class="content-wrapper"><div class="container-xxl flex-grow-1 container-p-y">@yield('content')</div>
@include('partials.footer')<div class="content-backdrop fade"></div></div></div></div>
<div class="layout-overlay layout-menu-toggle"></div><div class="drag-target"></div></div>
<script src="{{ asset('assets/vendor/libs/jquery/jquery.js') }}"></script>
<script src="{{ asset('assets/vendor/libs/popper/popper.js') }}"></script>
<script src="{{ asset('assets/vendor/js/bootstrap.js') }}"></script>
<script src="{{ asset('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js') }}"></script>
<script src="{{ asset('assets/vendor/js/menu.js') }}"></script><script src="{{ asset('assets/js/main.js') }}"></script>
@stack('scripts')
</body></html>
