<?php

namespace App\Http\Middleware;

use App\Models\Lesson;
use Closure;
use Illuminate\Http\Request;

class LessonCompletionCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle($request, Closure $next)
    {
        $lesson = $request->route('lesson');
        $user = $request->user(); // Assuming you're using authentication
    
        if (!$lesson) {
            return response()->json(['error' => 'Lesson not found.'], 404);
        }
    
        if (!$lesson->is_unlocked && !$lesson->is_completed) {
            return response()->json(['error' => 'Complete the current lesson first.'], 202);
        }
    
        // Find the next lesson
        $nextLesson = Lesson::where('unit_id', $lesson->unit_id)
            ->where('id', '>', $lesson->id)
            ->orderBy('id', 'asc')
            ->first();
    
        // Check if there is a next lesson
        if ($nextLesson) {
            // Unlock the next lesson
            $nextLesson->update(['is_unlocked' => true]);
        }
    
        // Now you can continue with the request
        return $next($request);
    }
    
    
    
    
    
    
}
