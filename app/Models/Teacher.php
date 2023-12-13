<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    use HasFactory;
    protected $fillable =[
        'school_id',
        'name',
        'address',
        'class',
        'image',
        'note',
    ];

    public function units()
    {
        return $this->hasMany(Unit::class);
    }
}
