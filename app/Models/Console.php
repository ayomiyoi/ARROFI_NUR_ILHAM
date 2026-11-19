<?php

namespace App\Models;

use Database\Factories\ConsoleFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable([
    'category_id',
    'room_id',
    'desk_number',
    'name',
    'description',
    'image',
    'price_per_day',
    'price_per_hour',
    'deposit',
    'stock',
    'status',
    'condition',
])]
class Console extends Model
{
    /** @use HasFactory<ConsoleFactory> */
    use HasFactory;

    /**
     * @return array<string, string>
     */
    public static function daftarStatus(): array
    {
        return [
            'available' => 'Tersedia',
            'rented' => 'Sedang Dipinjam',
            'maintenance' => 'Perawatan',
            'inactive' => 'Tidak Aktif',
        ];
    }

    /**
     * @return array<string, string>
     */
    public static function daftarKondisi(): array
    {
        return [
            'excellent' => 'Sangat Baik',
            'good' => 'Baik',
            'minor_damage' => 'Rusak Ringan',
            'needs_repair' => 'Perlu Perbaikan',
            'broken' => 'Rusak Berat',
        ];
    }

    public function labelStatus(): string
    {
        return self::daftarStatus()[$this->status] ?? $this->status;
    }

    public function labelKondisi(): string
    {
        return self::daftarKondisi()[$this->condition] ?? $this->condition;
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function room(): BelongsTo
    {
        return $this->belongsTo(Room::class);
    }

    public function transactions(): HasMany
    {
        return $this->hasMany(Transaction::class);
    }

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'price_per_day' => 'decimal:2',
            'price_per_hour' => 'decimal:2',
            'deposit' => 'decimal:2',
            'stock' => 'integer',
        ];
    }
}
