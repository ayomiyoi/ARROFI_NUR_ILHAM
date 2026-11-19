<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['user_id', 'action', 'description', 'subject_type', 'subject_id', 'ip_address', 'user_agent'])]
class ActivityLog extends Model
{
    protected $table = 'activity_logs';

    /**
     * @return array<string, string>
     */
    public static function daftarAksi(): array
    {
        return [
            'login' => 'Login',
            'logout' => 'Logout',
            'create' => 'Tambah Data',
            'update' => 'Ubah Data',
            'delete' => 'Hapus Data',
            'approve' => 'Menyetujui',
            'reject' => 'Menolak',
            'cancel' => 'Membatalkan',
            'borrow' => 'Serah Terima',
            'return' => 'Pengembalian',
        ];
    }

    public function labelAksi(): string
    {
        return self::daftarAksi()[$this->action] ?? $this->action;
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
