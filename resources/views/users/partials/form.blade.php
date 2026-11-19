<div class="row">
  <div class="col-md-6 mb-3">
    <label for="name" class="form-label">Nama</label>
    <input
      type="text"
      name="name"
      id="name"
      value="{{ old('name', $user->name ?? '') }}"
      class="form-control @error('name') is-invalid @enderror"
      placeholder="Nama lengkap"
    />
    @error('name')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-6 mb-3">
    <label for="email" class="form-label">Email</label>
    <input
      type="email"
      name="email"
      id="email"
      value="{{ old('email', $user->email ?? '') }}"
      class="form-control @error('email') is-invalid @enderror"
      placeholder="nama@contoh.com"
    />
    @error('email')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>
</div>

<div class="row">
  <div class="col-md-6 mb-3">
    <label for="password" class="form-label">Password</label>
    <input
      type="password"
      name="password"
      id="password"
      class="form-control @error('password') is-invalid @enderror"
      placeholder="{{ isset($user) ? 'Kosongkan bila tidak diubah' : 'Minimal 6 karakter' }}"
    />
    @error('password')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-6 mb-3">
    <label for="role_id" class="form-label">Role</label>
    <select name="role_id" id="role_id" class="form-select @error('role_id') is-invalid @enderror">
      <option value="">-- Pilih Role --</option>
      @foreach ($roles as $role)
        <option value="{{ $role->id }}" @selected(old('role_id', $user->role_id ?? '') == $role->id)>{{ $role->name }}</option>
      @endforeach
    </select>
    @error('role_id')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>
</div>

<div class="row">
  <div class="col-md-6 mb-3">
    <label for="phone" class="form-label">Telepon (opsional)</label>
    <input
      type="text"
      name="phone"
      id="phone"
      value="{{ old('phone', $user->phone ?? '') }}"
      class="form-control @error('phone') is-invalid @enderror"
      placeholder="08xxxxxxxxxx"
    />
    @error('phone')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>

  <div class="col-md-6 mb-3">
    <label for="address" class="form-label">Alamat (opsional)</label>
    <textarea
      name="address"
      id="address"
      rows="2"
      class="form-control @error('address') is-invalid @enderror"
    >{{ old('address', $user->address ?? '') }}</textarea>
    @error('address')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
  </div>
</div>
