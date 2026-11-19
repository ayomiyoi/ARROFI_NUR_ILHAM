<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable(['name', 'room_number', 'capacity', 'description', 'is_active'])]
class Room extends Model
{
    public function consoles(): HasMany
    {
        return $this->hasMany(Console::class);
    }
}
