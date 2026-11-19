<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Console;
use App\Models\Room;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ConsoleController extends Controller
{
    public function index(Request $request): View
    {
        $this->cekRole('admin');

        $query = Console::with(['category', 'room']);

        if ($request->query('q')) {
            $query->where('name', 'like', '%'.$request->query('q').'%');
        }

        $consoles = $query->orderBy('name')->paginate(10)->withQueryString();

        return view('consoles.index', [
            'consoles' => $consoles,
            'cari' => $request->query('q'),
        ]);
    }

    public function create(): View
    {
        $this->cekRole('admin');

        return view('consoles.create', [
            'categories' => Category::orderBy('name')->get(),
            'rooms' => Room::orderBy('name')->get(),
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $this->cekRole('admin');

        $console = Console::create($this->validasi($request));

        $this->catatLog('create', 'Menambah objek: '.$console->name, $console);

        return redirect()->route('consoles.index')->with('success', 'Objek berhasil ditambahkan.');
    }

    public function edit(Console $console): View
    {
        $this->cekRole('admin');

        return view('consoles.edit', [
            'console' => $console,
            'categories' => Category::orderBy('name')->get(),
            'rooms' => Room::orderBy('name')->get(),
        ]);
    }

    public function update(Request $request, Console $console): RedirectResponse
    {
        $this->cekRole('admin');

        $console->update($this->validasi($request));

        $this->catatLog('update', 'Mengubah objek: '.$console->name, $console);

        return redirect()->route('consoles.index')->with('success', 'Objek berhasil diubah.');
    }

    public function destroy(Console $console): RedirectResponse
    {
        $this->cekRole('admin');

        if ($console->transactions()->exists()) {
            return redirect()->route('consoles.index')
                ->with('error', 'Objek tidak bisa dihapus karena sudah punya riwayat peminjaman.');
        }

        $console->delete();

        $this->catatLog('delete', 'Menghapus objek: '.$console->name, $console);

        return redirect()->route('consoles.index')->with('success', 'Objek berhasil dihapus.');
    }
    
    /**
     * @return array<string, mixed>
     */
    private function validasi(Request $request): array
    {
        return $request->validate([
            'category_id' => ['required', 'exists:categories,id'],
            'room_id' => ['nullable', 'exists:rooms,id'],
            'desk_number' => ['nullable', 'string', 'max:20'],
            'name' => ['required', 'string', 'max:150'],
            'description' => ['nullable', 'string'],
            'price_per_day' => ['required', 'numeric', 'min:0'],
            'price_per_hour' => ['nullable', 'numeric', 'min:0'],
            'deposit' => ['required', 'numeric', 'min:0'],
            'stock' => ['required', 'integer', 'min:0'],
            'status' => ['required', 'in:available,rented,maintenance,inactive'],
            'condition' => ['required', 'in:excellent,good,minor_damage,needs_repair,broken'],
        ]);
    }
}
