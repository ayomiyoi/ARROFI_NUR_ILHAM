@php
  $warna = [
      'pending' => 'warning',
      'approved' => 'info',
      'borrowed' => 'primary',
      'returned' => 'success',
      'rejected' => 'danger',
      'cancelled' => 'secondary',
      'late' => 'danger',
  ];
@endphp
<span class="badge bg-label-{{ $warna[$status] }}">{{ App\Models\Transaction::daftarStatus()[$status] }}</span>
