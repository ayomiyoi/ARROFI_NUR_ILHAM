<?php

namespace Database\Factories;

use App\Models\Console;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Transaction>
 */
class TransactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'rental_code' => 'TRX-'.fake()->unique()->numerify('#####'),
            'user_id' => User::factory(),
            'console_id' => Console::factory(),
            'rental_type' => 'daily',
            'rental_date' => now()->toDateString(),
            'return_date' => now()->addDays(2)->toDateString(),
            'total_days' => 2,
            'total_price' => 100000,
            'deposit' => 200000,
        ];
    }
}
