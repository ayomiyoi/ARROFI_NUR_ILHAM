@php
  $warna = [
      'login' => 'success',
      'logout' => 'secondary',
      'create' => 'primary',
      'update' => 'info',
      'delete' => 'danger',
      'approve' => 'success',
      'reject' => 'danger',
      'cancel' => 'warning',
      'borrow' => 'primary',
      'return' => 'info',
  ];
  $aksi = $log->action;
@endphp
<span class="badge bg-label-{{ $warna[$aksi] ?? 'secondary' }}">{{ $log->labelAksi() }}</span>
