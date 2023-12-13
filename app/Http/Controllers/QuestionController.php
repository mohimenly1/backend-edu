<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Question;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'lesson_id' => 'required|exists:lessons,id',
            'question' => 'required|string',
            'answers' => 'required|array',
            'correct_answer' => 'required|integer', // Use an integer to indicate the correct answer index
        ]);
    
        $question = Question::create([
            'lesson_id' => $validatedData['lesson_id'],
            'question' => $validatedData['question'],
        ]);
    
        foreach ($validatedData['answers'] as $index => $answerText) {
            $isCorrect = $index === $validatedData['correct_answer']; // Check if this answer is the correct one
            Answer::create([
                'question_id' => $question->id,
                'answer' => $answerText,
                'is_correct' => $isCorrect, // Indicates if this answer is correct
                'correct_answer' => $isCorrect, // Store the correct answer explicitly
            ]);
        }
    
        return response()->json(['message' => 'Question and answers created successfully', 'question' => $question], 201);
    }
    public function getQuestionsWithAnswers()
{
    $questions = Question::with('answers')->get();
    
    return response()->json(['questions' => $questions]);
}


public function getQuestionsWithAnswersByLesson($lessonId)
{
    // Retrieve questions with answers for a specific lesson
    $questions = Question::with('answers')->where('lesson_id', $lessonId)->get();

    return response()->json(['questions' => $questions]);
}



public function update(Request $request, $id)
{
    $validatedData = $request->validate([
        'lesson_id' => 'required|exists:lessons,id',
        'question' => 'required|string',
        'answers' => 'required|array',
        'correct_answer' => 'required|integer', // Use an integer to indicate the correct answer index
    ]);

    $question = Question::findOrFail($id);

    // Update the question attributes
    $question->lesson_id = $validatedData['lesson_id'];
    $question->question = $validatedData['question'];
    $question->save();

    // Delete existing answers associated with the question
    $question->answers()->delete();

    foreach ($validatedData['answers'] as $index => $answerText) {
        $isCorrect = $index === $validatedData['correct_answer'];
        Answer::create([
            'question_id' => $question->id,
            'answer' => $answerText,
            'is_correct' => $isCorrect,
            'correct_answer' => $isCorrect,
        ]);
    }

    return response()->json(['message' => 'Question and answers updated successfully', 'question' => $question], 200);
}





}
