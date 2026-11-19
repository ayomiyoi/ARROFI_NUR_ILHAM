<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\View\View;

class CategoryController extends Controller
{
    public function index(Request $request): View
    {
        $this->cekRole('admin');

        $query = Category::withCount('consoles');

        // if ($request->query('q')) {
        //     $query->where('name', 'like', '%'.$request->query('q').'%');
        // }

        $categories = $query->orderBy('name')->paginate(10)->withQueryString();

        return view('categories.index', [
            'categories' => $categories,
            'cari' => $request->query('q'),
        ]);
    }

    public function create(): View
    {
        $this->cekRole('admin');

        return view('categories.create');
    }

    public function store(Request $request): RedirectResponse
    {
        $this->cekRole('admin');

        $category = Category::create($this->validasi($request));

        $this->catatLog('create', 'Menambah kategori: '.$category->name, $category);

        return redirect()->route('categories.index')->with('success', 'Kategori berhasil ditambahkan.');
    }

    public function edit(Category $category): View
    {
        $this->cekRole('admin');

        return view('categories.edit', compact('category'));
    }

    public function update(Request $request, Category $category): RedirectResponse
    {
        $this->cekRole('admin');

        $category->update($this->validasi($request, $category));

        $this->catatLog('update', 'Mengubah kategori: '.$category->name, $category);

        return redirect()->route('categories.index')->with('success', 'Kategori berhasil diubah.');
    }

    public function destroy(Category $category): RedirectResponse
    {
        $this->cekRole('admin');

        if ($category->consoles()->exists()) {
            return redirect()->route('categories.index')
                ->with('error', 'Kategori tidak bisa dihapus karena masih dipakai oleh data objek.');
        }

        $category->delete();

        $this->catatLog('delete', 'Menghapus kategori: '.$category->name, $category);

        return redirect()->route('categories.index')->with('success', 'Kategori berhasil dihapus.');
    }

    /**
     * @return array<string, mixed>
     */
    private function validasi(Request $request, ?Category $category = null): array
    {
        $request->merge(['slug' => Str::slug((string) $request->input('name'))]);

        return $request->validate([
            'name' => ['required', 'string', 'max:100', Rule::unique('categories', 'name')->ignore($category)],
            'slug' => ['required', 'string', 'max:100', Rule::unique('categories', 'slug')->ignore($category)],
        ]);
    }
}
