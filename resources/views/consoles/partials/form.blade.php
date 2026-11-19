<div class="row">
  <div class="col-md-6 mb-3">
    <label for="category_id" class="form-label">Kategori</label>
    <select name="category_id" id="category_id" class="form-select @error('category_id') is-invalid @enderror">
      <option value="">-- Pilih Kategori --</option>
      @foreach ($categories as $category)
        <option value="{{ $category->id }}" @selected(old('category_id', $console->category_id ?? '') == $category->id)>{{ $category->name }}</option>
      @endforeach
    </select>
    @error('category_id')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-6 mb-3">
    <label for="room_id" class="form-label">Ruangan (opsional)</label>
    <select name="room_id" id="room_id" class="form-select @error('room_id') is-invalid @enderror">
      <option value="">-- Tanpa Ruangan --</option>
      @foreach ($rooms as $room)
        <option value="{{ $room->id }}" @selected(old('room_id', $console->room_id ?? '') == $room->id)>{{ $room->name }}</option>
      @endforeach
    </select>
    @error('room_id')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>
</div>

<div class="row">
  <div class="col-md-8 mb-3">
    <label for="name" class="form-label">Nama Objek</label>
    <input
      type="text"
      name="name"
      id="name"
      value="{{ old('name', $console->name ?? '') }}"
      class="form-control @error('name') is-invalid @enderror"
      placeholder="Contoh: PlayStation 5 Slim"
    />
    @error('name')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-4 mb-3">
    <label for="desk_number" class="form-label">Nomor Meja (opsional)</label>
    <input
      type="text"
      name="desk_number"
      id="desk_number"
      value="{{ old('desk_number', $console->desk_number ?? '') }}"
      class="form-control @error('desk_number') is-invalid @enderror"
      placeholder="Contoh: 12"
    />
    @error('desk_number')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>
</div>

<div class="mb-3">
  <label for="description" class="form-label">Deskripsi (opsional)</label>
  <textarea
    name="description"
    id="description"
    rows="3"
    class="form-control @error('description') is-invalid @enderror"
  >{{ old('description', $console->description ?? '') }}</textarea>
  @error('description')
    <div class="invalid-feedback">{{ $message }}</div>
  @enderror
</div>

<div class="row">
  <div class="col-md-4 mb-3">
    <label for="price_per_day" class="form-label">Tarif per Hari</label>
    <input
      type="number"
      step="0.01"
      min="0"
      name="price_per_day"
      id="price_per_day"
      value="{{ old('price_per_day', $console->price_per_day ?? '') }}"
      class="form-control @error('price_per_day') is-invalid @enderror"
    />
    @error('price_per_day')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-4 mb-3">
    <label for="price_per_hour" class="form-label">Tarif per Jam (opsional)</label>
    <input
      type="number"
      step="0.01"
      min="0"
      name="price_per_hour"
      id="price_per_hour"
      value="{{ old('price_per_hour', $console->price_per_hour ?? '') }}"
      class="form-control @error('price_per_hour') is-invalid @enderror"
    />
    @error('price_per_hour')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-4 mb-3">
    <label for="deposit" class="form-label">Uang Jaminan</label>
    <input
      type="number"
      step="0.01"
      min="0"
      name="deposit"
      id="deposit"
      value="{{ old('deposit', $console->deposit ?? '') }}"
      class="form-control @error('deposit') is-invalid @enderror"
    />
    @error('deposit')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>
</div>

<div class="row">
  <div class="col-md-4 mb-3">
    <label for="stock" class="form-label">Stok</label>
    <input
      type="number"
      min="0"
      name="stock"
      id="stock"
      value="{{ old('stock', $console->stock ?? 0) }}"
      class="form-control @error('stock') is-invalid @enderror"
    />
    @error('stock')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-4 mb-3">
    <label for="status" class="form-label">Status</label>
    <select name="status" id="status" class="form-select @error('status') is-invalid @enderror">
      @foreach (App\Models\Console::daftarStatus() as $nilai => $label)
        <option value="{{ $nilai }}" @selected(old('status', $console->status ?? 'available') === $nilai)>{{ $label }}</option>
      @endforeach
    </select>
    @error('status')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-4 mb-3">
    <label for="condition" class="form-label">Kondisi</label>
    <select name="condition" id="condition" class="form-select @error('condition') is-invalid @enderror">
      @foreach (App\Models\Console::daftarKondisi() as $nilai => $label)
        <option value="{{ $nilai }}" @selected(old('condition', $console->condition ?? 'good') === $nilai)>{{ $label }}</option>
      @endforeach
    </select>
    @error('condition')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>
</div>
