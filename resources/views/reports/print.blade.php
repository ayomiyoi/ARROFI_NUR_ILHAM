<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="utf-8" />
  <title>Cetak Laporan Peminjaman</title>
  <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 12px;
      color: #000;
      margin: 20px;
    }

    h2, h3, p {
      margin: 0 0 6px 0;
      text-align: center;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 12px;
    }

    th, td {
      border: 1px solid #000;
      padding: 4px 6px;
      text-align: left;
    }

    th {
      background: #eee;
    }

    .kanan {
      text-align: right;
    }

    .tombol {
      margin-bottom: 16px;
      text-align: center;
    }

    @media print {
      .tombol {
        display: none;
      }

      body {
        margin: 0;
      }
    }
  </style>
</head>
<body>
  <div class="tombol">
    <button onclick="window.print()">Cetak Sekarang</button>
  </div>

  <h2>Aplikasi Peminjaman Alat</h2>
  <h3>Laporan Peminjaman</h3>
  <p>
    Periode:
    {{ $dari ? \Carbon\Carbon::parse($dari)->format('d-m-Y') : 'Awal' }}
    s/d
    {{ $sampai ? \Carbon\Carbon::parse($sampai)->format('d-m-Y') : 'Sekarang' }}
    @if ($statusDipilih)
      | Status: {{ App\Models\Transaction::daftarStatus()[$statusDipilih] }}
    @endif
  </p>

  <table>
    <thead>
      <tr>
        <th>No</th>
        <th>Kode</th>
        <th>Tanggal Pinjam</th>
        <th>Peminjam</th>
        <th>Objek</th>
        <th>Lama</th>
        <th class="kanan">Total Harga</th>
        <th class="kanan">Denda</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      @forelse ($transactions as $transaction)
        <tr>
          <td>{{ $loop->iteration }}</td>
          <td>{{ $transaction->rental_code }}</td>
          <td>{{ $transaction->rental_date->format('d-m-Y') }}</td>
          <td>{{ $transaction->user->name }}</td>
          <td>{{ $transaction->console->name }}</td>
          <td>{{ $transaction->total_days }} hari</td>
          <td class="kanan">{{ number_format($transaction->total_price, 0, ',', '.') }}</td>
          <td class="kanan">{{ number_format($transaction->fine, 0, ',', '.') }}</td>
          <td>{{ $transaction->labelStatus() }}</td>
        </tr>
      @empty
        <tr>
          <td colspan="9" style="text-align: center">Tidak ada data peminjaman pada periode ini.</td>
        </tr>
      @endforelse
    </tbody>
    <tfoot>
      <tr>
        <th colspan="6">Total</th>
        <th class="kanan">{{ number_format($totalPendapatan, 0, ',', '.') }}</th>
        <th class="kanan">{{ number_format($totalDenda, 0, ',', '.') }}</th>
        <th></th>
      </tr>
    </tfoot>
  </table>

  <p style="text-align: right; margin-top: 24px">
    Dicetak oleh: {{ auth()->user()->name }}<br />
    Tanggal cetak: {{ now()->format('d-m-Y H:i') }}
  </p>
</body>
</html>
