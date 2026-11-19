<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->string('rental_code', 50)->unique();
            $table->foreignId('user_id');
            $table->foreignId('console_id');
            $table->enum('rental_type', ['daily', 'hourly'])->default('daily');
            $table->foreignId('approved_by')->nullable();
            $table->date('rental_date');
            $table->dateTime('start_time')->nullable()->comment('Diisi untuk rental_type=hourly');
            $table->dateTime('end_time')->nullable()->comment('Diisi untuk rental_type=hourly');
            $table->date('return_date');
            $table->unsignedInteger('total_days');
            $table->unsignedInteger('total_hours')->nullable()->comment('Total jam bermain (hourly)');
            $table->decimal('total_price', 10, 2);
            $table->decimal('deposit', 10, 2);
            $table->decimal('fine', 10, 2)->default(0);
            $table->enum('status', ['pending', 'approved', 'rejected', 'borrowed', 'returned', 'cancelled', 'late'])->default('pending');
            $table->text('notes')->nullable();
            $table->string('identification')->nullable()->comment('Kartu tanda pengenal penyewa');
            $table->timestamps();

            $table->index('user_id');
            $table->index('console_id');
            $table->index('approved_by');
            $table->index('status');
            $table->index(['user_id', 'console_id', 'status'], 'transactions_user_console_status_index');
            $table->index(['status', 'return_date'], 'transactions_status_return_date_index');

            $table->foreign('user_id')->references('id')->on('users')->cascadeOnDelete();
            $table->foreign('console_id')->references('id')->on('consoles')->cascadeOnDelete();
            $table->foreign('approved_by')->references('id')->on('users')->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
