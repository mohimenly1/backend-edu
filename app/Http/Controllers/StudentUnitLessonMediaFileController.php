<?php

namespace App\Http\Controllers;

use App\Models\Lesson;
use App\Models\MediaFile;
use App\Models\Student;
use App\Models\Unit;
use Illuminate\Http\Request;

class StudentUnitLessonMediaFileController extends Controller
{
    


    public function createUnitLessonToStudent(Request $request)
    {
        // Validate the input data from the frontend
        $request->validate([
            'student_id' => 'required|exists:students,id',
            'unit_id' => 'required|exists:units,id',
            'lesson_id' => 'required|exists:lessons,id',
        ]);

        // Retrieve the student, unit, and lesson using the IDs provided
        $student = Student::find($request->input('student_id'));
        $unit = Unit::find($request->input('unit_id'));
        $lesson = Lesson::find($request->input('lesson_id'));

        // Attach the unit and lesson to the student
        $student->units()->attach($unit);
        $student->lessons()->attach($lesson);

        return response()->json([
            'message' => 'Units and lessons assigned to the student successfully.',
        ]);
    }
    

    public function getLessonsByUnit(Request $request)
{
    $unitId = $request->input('unit_id');

    // Get the lessons associated with the selected unit
    $lessons = Unit::find($unitId)->lessons;

    return response()->json([
        'lessons' => $lessons,
    ]);
}




public function getUnitsAndLessonsForStudent($user_id, $unit_id)
{
    // Use the provided $user_id to retrieve the student's ID
    $student = Student::where('user_id', $user_id)->first();

    if (!$student) {
        return response()->json(['message' => 'Student not found.'], 404);
    }

    // Check if the student is assigned to the clicked unit
    $unit = $student->units()->find($unit_id);

    if (!$unit) {
        return response()->json(['message' => 'You are not assigned to this unit.'], 200);
    }

    // Get the lessons assigned to the student for the clicked unit
    $lessons = $student->lessons()
        ->where('unit_id', $unit_id)
        ->get();

    if ($lessons->isEmpty()) {
        return response()->json(['message' => 'There are no lessons assigned for this unit.'], 200);
    }

    // Eager load the lessons and their associated media files
    $lessons->load('mediaFiles');

    return response()->json([
        'unit' => $unit,
        'lessons' => $lessons,
    ]);
}






    
}
