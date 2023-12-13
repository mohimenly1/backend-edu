<?php

use App\Http\Controllers\AdministratorController;
use App\Http\Controllers\Auth\AdminAuthController;
use App\Http\Controllers\LessonController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\SchoolController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\StudentUnitLessonMediaFileController;
use App\Http\Controllers\UnitController;
use App\Http\Controllers\WelcomeController;
use App\Http\Middleware\LessonCompletionCheck;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// Student Registration by Administrator
Route::post('/admin/register-student', [StudentController::class,'registerStudent']);

// Student Authentication by Administrator
Route::post('/admin/login-student', [AdminAuthController::class,'loginStudent']);


Route::post('/admin/login-administrator', [AdminAuthController::class,'loginAdministrator']);

Route::post('/admin/administrators', [AdministratorController::class,'create']);


Route::post('/add-unit', [UnitController::class,'storeUnit']);
Route::get('/get-unit', [UnitController::class,'getAllUnit']);
Route::get('/get-all-unit', [UnitController::class,'getAllUnits']);
Route::delete('/delete-unit/{id}', [UnitController::class, 'deleteUnit']);

Route::post('/store-lesson', [LessonController::class, 'storeLesson']);
Route::post('/add-lesson-with-media',[LessonController::class, 'storeLesson']);
// Route::put('/edit-lesson-with-media/{lesson}',[LessonController::class, 'updateLesson']);
Route::post('/edit-lesson-with-media/{lesson}',[LessonController::class, 'update']);
Route::get('/get-lessons', [LessonController::class, 'getLessons']);
Route::get('/get-all-lessons', [LessonController::class, 'getAllLesson']);
Route::delete('/delete-lessons/{lesson}', [LessonController::class, 'deleteLesson']);

// routes/api.php
Route::get('/all-schools', [SchoolController::class, 'getAllSchools']);
Route::post('/add-schools', [SchoolController::class, 'createSchool']);
Route::get('/get-schools', [SchoolController::class, 'getPaginatedSchools']);
Route::delete('/delete-schools/{id}', [SchoolController::class, 'deleteSchool']);
Route::get('/get-all-students', [StudentController::class, 'getAllStudents']);
Route::delete('/admin/delete-student/{id}', [StudentController::class, 'deleteStudent']);



Route::post('/inset/data/student/study',[StudentUnitLessonMediaFileController::class,'createUnitLessonToStudent']);
Route::get('get-lessons-by-unit',[StudentUnitLessonMediaFileController::class,'getLessonsByUnit']);
Route::get('/get-all-students/study',[StudentController::class,'getAllStudent']);


Route::get('/get-units-and-lessons-for-student/{user_id}/{unit_id}', [StudentUnitLessonMediaFileController::class, 'getUnitsAndLessonsForStudent']);


Route::post('/add-Question',[QuestionController::class,'store']);

Route::get('/get-question-answers',[QuestionController::class,'getQuestionsWithAnswers'])->middleware([LessonCompletionCheck::class])->name('lesson');
Route::post('/edit-question/{id}',[QuestionController::class,'update']);

Route::get('/questions/lesson/{lessonId}', [QuestionController::class, 'getQuestionsWithAnswersByLesson']);
Route::get('/get-lesson-with-its-media/{lesson}', [LessonController::class, 'showWithMediaFiles']);


Route::get('/units',[UnitController::class,'index']);


// Fetching Lessons for a Specific Unit:

Route::get('/units/{unit}/lessons',[UnitController::class,'lessons']);

// Fetching Lesson Details with Related Media Files:

Route::get('/lessons/{lesson}', [LessonController::class,'showWithMediaFilesForLesson'])->middleware([LessonCompletionCheck::class])->name('lesson');

Route::get('/lesson-details/{lessonId}', [LessonController::class, 'show']);


Route::post('/lessons/{lesson}/complete', [LessonController::class, 'completeLesson']);



