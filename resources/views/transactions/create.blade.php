@extends('layouts.app')

@section('title', 'Ajukan Peminjaman')

@section('content')
  <div class="row">
    <div class="col-md-9">
      <div class="card">
        <h5 class="card-header">Form Pengajuan Peminjaman</h5>
        <div class="card-body">
          <form action="{{ route('transactions.store') }}" method="POST">
            @csrf

            <div class="mb-3">
              <label for="console_id" class="form-label">Objek yang Dipinjam</label>
              <select name="console_id" id="console_id" class="form-select @error('console_id') is-invalid @enderror">
                <option value="">-- Pilih Objek --</option>
                @foreach ($consoles as $console)
                  <option value="{{ $console->id }}" data-harga="{{ $console->price_per_day }}" @selected(old('console_id') == $console->id)>
                    {{ $console->name }} ({{ $console->category->name }}) - Rp {{ number_format($console->price_per_day, 0, ',', '.') }}/hari, stok {{ $console->stock }}
                  </option>
                @endforeach
              </select>
              @error('console_id')
                <div class="invalid-feedback">{{ $message }}</div>
              @enderror
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="rental_date" class="form-label">Tanggal Pinjam</label>
                <input type="date" name="rental_date" id="rental_date" value="{{ old('rental_date', date('Y-m-d')) }}" class="form-control @error('rental_date') is-invalid @enderror" />
                @error('rental_date')
                  <div class="invalid-feedback">{{ $message }}</div>
                @enderror
              </div>

              <div class="col-md-6 mb-3">
                <label for="return_date" class="form-label">Tanggal Kembali</label>
                <input type="date" name="return_date" id="return_date" value="{{ old('return_date', date('Y-m-d', strtotime('+1 day'))) }}" class="form-control @error('return_date') is-invalid @enderror" />
                @error('return_date')
                  <div class="invalid-feedback">{{ $message }}</div>
                @enderror
              </div>
            </div>

            <div class="alert alert-info" id="infoTotal">Pilih objek dan tanggal untuk melihat perkiraan total.</div>

            <div class="mb-3">
              <label for="identification" class="form-label">Nomor Identitas (KTP/Kartu Pelajar)</label>
              <input type="text" name="identification" id="identification" value="{{ old('identification') }}" class="form-control @error('identification') is-invalid @enderror" placeholder="Contoh: KTP 3201xxxx" />
              @error('identification')
                <div class="invalid-feedback">{{ $message }}</div>
              @enderror
              <div class="form-text">Identitas ditahan sebagai jaminan selama masa peminjaman.</div>
            </div>

            <div class="mb-3">
              <label for="notes" class="form-label">Catatan (opsional)</label>
              <textarea name="notes" id="notes" rows="2" class="form-control @error('notes') is-invalid @enderror">{{ old('notes') }}</textarea>
              @error('notes')
                <div class="invalid-feedback">{{ $message }}</div>
              @enderror
            </div>

            <button class="btn btn-primary" type="submit">Kirim Pengajuan</button>
            <a href="{{ route('transactions.index') }}" class="btn btn-secondary">Kembali</a>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection

@push('scripts')
  <script>
    const objek = document.getElementById('console_id');
    const mulai = document.getElementById('rental_date');
    const kembali = document.getElementById('return_date');
    const info = document.getElementById('infoTotal');

    function hitungTotal() {
      const harga = objek.value ? Number(objek.selectedOptions[0].dataset.harga) : 0;

      if (!harga || !mulai.value || !kembali.value) {
        info.textContent = 'Pilih objek dan tanggal untuk melihat perkiraan total.';
        return;
      }

      const hari = Math.max(1, Math.round((new Date(kembali.value) - new Date(mulai.value)) / 86400000));
      info.textContent = 'Perkiraan: ' + hari + ' hari x Rp ' + harga.toLocaleString('id-ID') + ' = Rp ' + (hari * harga).toLocaleString('id-ID');
    }

    objek.addEventListener('change', hitungTotal);
    mulai.addEventListener('change', hitungTotal);
    kembali.addEventListener('change', hitungTotal);
    hitungTotal();
  </script>
@endpush
