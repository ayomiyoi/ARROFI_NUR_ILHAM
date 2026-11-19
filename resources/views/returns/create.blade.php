@extends('layouts.app')

@section('title', 'Form Pengembalian')

@section('content')
  <div class="row">
    <div class="col-md-8">
      <div class="card">
        <h5 class="card-header">Form Pengembalian {{ $transaction->rental_code }}</h5>
        <div class="card-body">
          <table class="table table-borderless mb-4">
            <tr>
              <th width="35%">Peminjam</th>
              <td>{{ $transaction->user->name }}</td>
            </tr>
            <tr>
              <th>Objek</th>
              <td>{{ $transaction->console->name }}</td>
            </tr>
            <tr>
              <th>Tanggal Pinjam</th>
              <td>{{ $transaction->rental_date->format('d-m-Y') }}</td>
            </tr>
            <tr>
              <th>Jatuh Tempo</th>
              <td>{{ $transaction->return_date->format('d-m-Y') }}</td>
            </tr>
            <tr>
              <th>Harga Sewa</th>
              <td>Rp {{ number_format($transaction->console->price_per_day, 0, ',', '.') }} / hari</td>
            </tr>
            <tr>
              <th>Uang Jaminan</th>
              <td>Rp {{ number_format($transaction->deposit, 0, ',', '.') }}</td>
            </tr>
          </table>

          <form action="{{ route('pengembalian.store', $transaction) }}" method="POST"
                data-jatuh-tempo="{{ $transaction->return_date->toDateString() }}"
                data-harga="{{ $transaction->console->price_per_day }}"
                data-jaminan="{{ $transaction->deposit }}">
            @csrf

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="return_date" class="form-label">Tanggal Dikembalikan</label>
                <input type="date" name="return_date" id="return_date" value="{{ old('return_date', date('Y-m-d')) }}" class="form-control @error('return_date') is-invalid @enderror" />
                @error('return_date')
                  <div class="invalid-feedback">{{ $message }}</div>
                @enderror
              </div>

              <div class="col-md-6 mb-3">
                <label for="condition" class="form-label">Kondisi Objek Saat Dikembalikan</label>
                <select name="condition" id="condition" class="form-select @error('condition') is-invalid @enderror">
                  @foreach (App\Models\Console::daftarKondisi() as $nilai => $label)
                    <option value="{{ $nilai }}" @selected(old('condition', 'good') === $nilai)>{{ $label }}</option>
                  @endforeach
                </select>
                @error('condition')
                  <div class="invalid-feedback">{{ $message }}</div>
                @enderror
              </div>
            </div>

            <div class="mb-3">
              <label for="fine" class="form-label">Denda (Rp)</label>
              <input type="number" name="fine" id="fine" min="0" step="500" value="{{ old('fine', 0) }}" class="form-control @error('fine') is-invalid @enderror" />
              @error('fine')
                <div class="invalid-feedback">{{ $message }}</div>
              @enderror
              <div class="form-text" id="keteranganDenda">Denda dihitung otomatis, tapi boleh diubah bila perlu.</div>
            </div>

            <div class="mb-3">
              <label for="notes" class="form-label">Catatan (opsional)</label>
              <textarea name="notes" id="notes" rows="2" class="form-control @error('notes') is-invalid @enderror">{{ old('notes') }}</textarea>
              @error('notes')
                <div class="invalid-feedback">{{ $message }}</div>
              @enderror
            </div>

            <button class="btn btn-primary" type="submit">Simpan Pengembalian</button>
            <a href="{{ route('pengembalian.index') }}" class="btn btn-secondary">Kembali</a>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection

@push('scripts')
  <script>
    const form = document.querySelector('form[data-jatuh-tempo]');
    const tanggal = document.getElementById('return_date');
    const kondisi = document.getElementById('condition');
    const denda = document.getElementById('fine');
    const keterangan = document.getElementById('keteranganDenda');
    const persenRusak = { minor_damage: 0.25, needs_repair: 0.5, broken: 1 };

    function hitungDenda() {
      const lewat = Math.max(0, Math.round((new Date(tanggal.value) - new Date(form.dataset.jatuhTempo)) / 86400000));
      const dendaTelat = lewat * form.dataset.harga * 0.5;
      const dendaRusak = form.dataset.jaminan * (persenRusak[kondisi.value] ?? 0);

      denda.value = dendaTelat + dendaRusak;
      keterangan.textContent = 'Telat ' + lewat + ' hari = Rp ' + dendaTelat.toLocaleString('id-ID') + ' + denda kerusakan Rp ' + dendaRusak.toLocaleString('id-ID');
    }

    tanggal.addEventListener('change', hitungDenda);
    kondisi.addEventListener('change', hitungDenda);
    hitungDenda();
  </script>
@endpush
