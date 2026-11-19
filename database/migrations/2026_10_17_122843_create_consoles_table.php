<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('consoles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('category_id');
            $table->foreignId('room_id')->nullable();
            $table->string('desk_number', 20)->nullable();
            $table->string('name', 150);
            $table->text('description')->nullable();
            $table->string('image')->nullable();
            $table->decimal('price_per_day', 10, 2);
            $table->decimal('price_per_hour', 10, 2)->nullable()->comment('Tarif per jam; null = hanya support sewa harian');
            $table->decimal('deposit', 10, 2);
            $table->unsignedInteger('stock')->default(0);
            $table->enum('status', ['available', 'rented', 'maintenance', 'inactive'])->default('available');
            $table->enum('condition', ['excellent', 'good', 'minor_damage', 'needs_repair', 'broken'])->default('good');
            $table->timestamps();

            $table->index('status');
            $table->index('category_id');
            $table->index('room_id');

            $table->foreign('category_id')->references('id')->on('categories')->cascadeOnDelete();
            $table->foreign('room_id')->references('id')->on('rooms')->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('consoles');
    }
};
