<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
            'name',
            'image',
            'description',
            'file',
    ];


        public function user()
    {
        return $this->belongsTo(User::class, 'user_id'); // Assuming 'users' is the model for your users table
    }
    

    public function lessons()
    {
        return $this->hasMany(Lesson::class);
    }

    public function students()
    {
        return $this->belongsToMany(Student::class);
    }
    
}
