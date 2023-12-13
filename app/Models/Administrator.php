<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Administrator extends Model
{
    use HasFactory;

    protected $fillable =[
        'name',
        'user_id'
    ];

    public function units()
    {
        return $this->hasMany(Unit::class);
    }

    public function lessons()
    {
        return $this->hasMany(Lesson::class);
    }
}
