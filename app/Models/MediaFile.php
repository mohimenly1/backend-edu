<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MediaFile extends Model
{
    use HasFactory;
    protected $fillable =[
        'lesson_id',
        'type',
        'file_name',

    ];


    public function lesson() {
        return $this->belongsTo(Lesson::class);
    }

}
