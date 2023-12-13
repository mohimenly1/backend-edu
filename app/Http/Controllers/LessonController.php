<?php

namespace App\Http\Controllers;

use App\Models\Lesson;
use App\Models\MediaFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class LessonController extends Controller
{
    public function storeLesson(Request $request)
    {
        // Validate the request
        $validator = Validator::make($request->all(), [
            'unit_id' => 'required|exists:units,id',
            'user_id' => 'required|exists:users,id',
            'name' => 'required|string|max:255',
            'content' => 'required|string',
            'note' => 'string|max:255',
            'media_files.*' => 'required|mimes:jpeg,jpg,png,mp4,mp3',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
    
        // Process the uploaded media files
        $mediaFiles = [];
        foreach ($request->file('media_files') as $file) {
            $extension = $file->getClientOriginalExtension();
    
            // Determine the type based on the file extension
            $type = $extension === 'mp4' ? 'video' : ($extension === 'mp3' ? 'audio' : 'image');
    
            // Store the file with the determined type
            $path = $file->store('media', 'public');
    
            // Create the media file record with the determined type
            $mediaFile = new MediaFile([
                'type' => $type,
                'file_name' => $path,
            ]);
    
            $mediaFiles[] = $mediaFile;
        }
    
        // Create the lesson record
        $lesson = Lesson::create([
            'unit_id' => $request->input('unit_id'),
            'user_id' => $request->input('user_id'),
            'name' => $request->input('name'),
            'content' => $request->input('content'),
            'note' => $request->input('note'),
            'is_unlocked' => $request->input('is_unlocked'),
        ]);
    
        // Associate media files with the lesson
        $lesson->mediaFiles()->saveMany($mediaFiles);
    
        return response()->json(['message' => 'Lesson created successfully.']);
    }
    


public function updateLesson(Request $request, Lesson $lesson)
{
    
    Log::info($request->all());

    // Update the lesson properties
    // $lesson->unit_id = $request->input('unit_id');
    // $lesson->name = $request->input('name');
    // $lesson->content = $request->input('content');
    $lesson->note = $request->input('note');
    dd($request->all());
    $lesson->save();

    // Handle media file insertion
    if ($request->hasFile('media_files')) {
        foreach ($request->file('media_files') as $file) {
            $mediaFile = new MediaFile();
            $mediaFile->lesson_id = $lesson->id;
            $mediaFile->type = 'image'; // Set the type based on the uploaded file type
            $mediaFile->file_name = $file->store('media', 'public');
            $mediaFile->save();
        }
    }

    return response()->json(['message' => 'Lesson updated successfully'], 200);
}


public function update(Request $request, Lesson $lesson)
{

    // Validate the request data
    $request->validate([
        'unit_id' => 'required|exists:units,id',
        'name' => 'required|string',
        'content' => 'required|string',
        'note' => 'nullable|string',
        
    ]);

    // Update the lesson
    $lesson->unit_id = $request->input('unit_id');
    $lesson->name = $request->input('name');
    $lesson->content = $request->input('content');
    $lesson->note = $request->input('note');
    $lesson->is_unlocked = $request->input('is_unlocked');
    $lesson->save();

    // Handle media file updates (if needed)
    if ($request->hasFile('media_files')) {
        foreach ($request->file('media_files') as $file) {
            $mediaFile = new MediaFile();
            $mediaFile->lesson_id = $lesson->id;
            $mediaFile->type = 'image'; // Set the type based on the uploaded file type
            $mediaFile->file_name = $file->store('media', 'public');
            $mediaFile->save();
        }
    }

    return response()->json(['message' => 'Lesson updated successfully']);
}




public function getLessons(Request $request) {
    // Define the number of lessons to display per page
    $perPage = $request->input('per_page', 10); // Default to 10 lessons per page

    // Fetch all lessons from the database with pagination and eager loading
    $lessons = Lesson::with(['unit', 'mediaFiles'])
        ->paginate($perPage);

    return response()->json(['lessons' => $lessons], 200);
}


public function getAllLesson()
{
    // Fetch all units from the database
    $lessons = Lesson::all();

    // Return the units as a JSON response
    return response()->json(['lessons' => $lessons], 200);
}


public function deleteLesson(Lesson $lesson)
{
    try {
        // Check if the lesson exists
        if (!$lesson) {
            return response()->json(['message' => 'Lesson not found'], 404);
        }

        // Delete the associated media files first (assuming you have a MediaFile model)
        $lesson->mediaFiles()->delete();

        // Then, delete the lesson
        $lesson->delete();

        return response()->json(['message' => 'Lesson deleted successfully']);
    } catch (\Exception $e) {
        return response()->json(['message' => 'Failed to delete lesson'], 500);
    }
}



public function showWithMediaFiles(Lesson $lesson)
{
    // Eager load the 'mediaFiles' relationship to retrieve the associated media files
    $lesson->load('mediaFiles');

    return response()->json($lesson);
}




// Start Good From here :

// Fetching Lesson Details with Related Media Files:
public function showWithMediaFilesForLesson(Lesson $lesson)
{
    // Eager load the 'mediaFiles' relationship to retrieve associated media files
    $lesson->load('mediaFiles');

    return response()->json($lesson);
}


public function show(Lesson $lesson){
        // Eager load the 'mediaFiles' relationship to retrieve associated media files
        $lesson->load('mediaFiles');

        return response()->json($lesson);
}


public function completeLesson(Lesson $lesson, Request $request)
{
    $score = $request->input('score');

    // Check if the student achieved a high enough score
    if ($score >= config('Laravel.passing_score')) {
        $lesson->update(['is_completed' => true]);
        return response()->json(['message' => 'Lesson completed successfully']);
    }

    return response()->json(['message' => 'Score is not high enough to complete the lesson'], 403);
}


}
