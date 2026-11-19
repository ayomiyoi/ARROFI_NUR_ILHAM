<?php

namespace App\Http\Controllers;

use App\Models\ActivityLog;
use Illuminate\Database\Eloquent\Model;

abstract class Controller
{
    /**
     * Cek apakah role user yang login diizinkan. Contoh: $this->cekRole('admin');
     */

    protected function cekRole(string ...$roles): void
    {
        $slug = auth()->user()?->role?->slug;

        abort_unless(in_array($slug, $roles, true), 403, 'Anda tidak punya akses ke halaman ini.');
    }
    
    /**
     * Simpan satu baris ke tabel activity_logs.
     *
     * @param  array<string, mixed>  $extra
     */
    protected function catatLog(string $action, string $description, ?Model $subject = null, array $extra = []): void
    {
        ActivityLog::create(array_merge([
            'user_id' => auth()->id(),
            'action' => $action,
            'description' => $description,
            'subject_type' => $subject ? $subject::class : null,
            'subject_id' => $subject?->getKey(),
            'ip_address' => request()->ip(),
            'user_agent' => request()->userAgent(),
        ], $extra));
    }
}
