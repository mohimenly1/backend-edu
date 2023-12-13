<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    use HasFactory;

    protected $fillable =[
        'unit_id',
        'user_id',
        'name',
        'content',
        'note',
        'is_unlocked', // Add this field to control lesson accessibility
        'is_completed', // Add this field to track lesson completion
    ];

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function mediaFiles() {
        return $this->hasMany(MediaFile::class);
    }


    public function students()
{
    return $this->belongsToMany(Student::class);
}

    
}
