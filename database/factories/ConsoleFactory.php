<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Console;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Console>
 */
class ConsoleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'category_id' => Category::factory(),
            'name' => fake()->words(2, true),
            'price_per_day' => fake()->numberBetween(10000, 100000),
            'deposit' => fake()->numberBetween(20000, 200000),
            'stock' => fake()->numberBetween(1, 5),
        ];
    }
}
