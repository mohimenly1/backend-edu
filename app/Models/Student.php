<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id',
        'name',
        'address',
        'class',
        'image',
        'note',
        'phone'
    ];

    public function lessons()
    {
        return $this->belongsToMany(Lesson::class);
    }

    public function school(){
        return $this->belongsTo(School::class);
    }

    public function units()
    {
        return $this->belongsToMany(Unit::class);
    }
    
}
