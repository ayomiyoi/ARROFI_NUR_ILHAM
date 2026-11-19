<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable(['name', 'slug', 'description'])]
class Role extends Model
{
    public const PENGGUNA = 1;

    public const ADMIN = 2;

    public const PETUGAS = 3;

    public function users(): HasMany
    {
        return $this->hasMany(User::class);
    }
}
