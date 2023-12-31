<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;
    protected $fillable = [
        'lesson_id',
        'question',
    ];

    public function lesson()
    {
        return $this->belongsTo(Lesson::class,'lesson_id');
    }

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }
}