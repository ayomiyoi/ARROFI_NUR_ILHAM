<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;

class UserController extends Controller
{
    public function index(Request $request): View
    {
        $this->cekRole('admin');

        $query = User::with('role');

        if ($request->query('q')) {
            $query->where('name', 'like', '%'.$request->query('q').'%')
                ->orWhere('email', 'like', '%'.$request->query('q').'%');
        }

        $users = $query->orderBy('name')->paginate(10)->withQueryString();

        return view('users.index', [
            'users' => $users,
            'cari' => $request->query('q'),
        ]);
    }

    public function create(): View
    {
        $this->cekRole('admin');

        return view('users.create', ['roles' => Role::orderBy('id')->get()]);
    }

    public function store(Request $request): RedirectResponse
    {
        $this->cekRole('admin');

        $user = User::create($this->validasi($request));

        $this->catatLog('create', 'Menambah user: '.$user->name, $user);

        return redirect()->route('users.index')->with('success', 'User berhasil ditambahkan.');
    }

    public function edit(User $user): View
    {
        $this->cekRole('admin');

        return view('users.edit', [
            'user' => $user,
            'roles' => Role::orderBy('id')->get(),
        ]);
    }

    public function update(Request $request, User $user): RedirectResponse
    {
        $this->cekRole('admin');

        $user->update($this->validasi($request, $user));

        $this->catatLog('update', 'Mengubah user: '.$user->name, $user);

        return redirect()->route('users.index')->with('success', 'User berhasil diubah.');
    }

    public function destroy(User $user): RedirectResponse
    {
        $this->cekRole('admin');

        if ($user->is(auth()->user())) {
            return redirect()->route('users.index')->with('error', 'Akun yang sedang dipakai tidak bisa dihapus.');
        }

        if ($user->transactions()->exists()) {
            return redirect()->route('users.index')->with('error', 'User tidak bisa dihapus karena sudah punya riwayat peminjaman.');
        }

        $user->delete();

        $this->catatLog('delete', 'Menghapus user: '.$user->name, $user);

        return redirect()->route('users.index')->with('success', 'User berhasil dihapus.');
    }

    /**
     * @return array<string, mixed>
     */
    private function validasi(Request $request, ?User $user = null): array
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', Rule::unique('users', 'email')->ignore($user)],
            'password' => [$user ? 'nullable' : 'required', 'string', 'min:6'],
            'phone' => ['nullable', 'string', 'max:20'],
            'address' => ['nullable', 'string'],
            'role_id' => ['required', 'exists:roles,id'],
        ]);

        if (empty($data['password'])) {
            unset($data['password']);
        }

        return $data;
    }
}
