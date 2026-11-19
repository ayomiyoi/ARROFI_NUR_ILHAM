<?php

namespace App\Models;

use Database\Factories\TransactionFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

#[Fillable([
    'rental_code',
    'user_id',
    'console_id',
    'rental_type',
    'approved_by',
    'rental_date',
    'start_time',
    'end_time',
    'return_date',
    'total_days',
    'total_hours',
    'total_price',
    'deposit',
    'fine',
    'status',
    'notes',
    'identification',
])]
class Transaction extends Model
{
    /** @use HasFactory<TransactionFactory> */
    use HasFactory;

    /**
     * @return array<string, string>
     */
    public static function daftarStatus(): array
    {
        return [
            'pending' => 'Menunggu Persetujuan',
            'approved' => 'Disetujui',
            'rejected' => 'Ditolak',
            'borrowed' => 'Sedang Dipinjam',
            'returned' => 'Selesai',
            'cancelled' => 'Dibatalkan',
            'late' => 'Terlambat',
        ];
    }

    public function labelStatus(): string
    {
        return self::daftarStatus()[$this->status] ?? $this->status;
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function console(): BelongsTo
    {
        return $this->belongsTo(Console::class);
    }

    public function approver(): BelongsTo
    {
        return $this->belongsTo(User::class, 'approved_by');
    }

    public function retur(): HasOne
    {
        return $this->hasOne(ReturnItems::class);
    }

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'rental_date' => 'date',
            'return_date' => 'date',
            'start_time' => 'datetime',
            'end_time' => 'datetime',
            'total_days' => 'integer',
            'total_price' => 'decimal:2',
            'deposit' => 'decimal:2',
            'fine' => 'decimal:2',
        ];
    }
}
