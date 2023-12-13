<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentUnitLessonMediaFile extends Model
{
    use HasFactory;
    
    protected $table = 'student_unit_lesson_media_file'; // Set the table name

    protected $fillable = [
        'student_id',
        'unit_id',
        'lesson_id',
        // Add additional fields if necessary
    ];


       // Define relationships
       public function student()
       {
           return $this->belongsTo(Student::class, 'student_id');
       }
   
       public function unit()
       {
           return $this->belongsTo(Unit::class, 'unit_id');
       }
   
       public function lesson()
       {
           return $this->belongsTo(Lesson::class, 'lesson_id');
       }
   
 
}
