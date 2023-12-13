<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Models\User;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    public function registerStudent(Request $request) {
        // Validate the request data
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'school_id' => 'required',
            'address' => 'required',
            'class' => 'required',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:2048', // Add image validation rules
            'note' => 'required',
            'phone' => 'required',
        ]);
    
        // Create a user record with the 'student' role
        $user = new User();
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = bcrypt($request->input('password'));
        $user->role = 'student';
        $user->save();
    
        // Create a new student record associated with the user
        $student = new Student();
        $student->user_id = $user->id;
        $student->school_id = $request->input('school_id');
        $student->name = $request->input('name');
        $student->address = $request->input('address');
        $student->class = $request->input('class');
        $student->phone = $request->input('phone');
        
        // Process the uploaded image
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = $image->store('student_images', 'public');
            $student->image = $imageName;
        }
    
        $student->note = $request->input('note');
        $student->save();
    
        // Generate a token for authentication
        $token = $user->createToken('Student')->accessToken;
    
        return response()->json(['token' => $token], 201);
    }
    
    


    public function getAllStudents(Request $request) {
        // Define the number of students to display per page
        $perPage = $request->input('per_page', 10); // Default to 10 students per page
    
        // Fetch all students from the database with pagination
        $students = Student::with('school')->paginate($perPage);
    
        // Return the paginated students as a JSON response
        return response()->json(['students' => $students], 200);
    }


    public function getAllStudent()
    {
        // Fetch all units from the database
        $student = Student::all();
    
        // Return the units as a JSON response
        return response()->json(['student' => $student], 200);
    }


    public function deleteStudent($id) {
        $student = Student::find($id);
    
        if (!$student) {
            return response()->json(['message' => 'Student not found'], 404);
        }
    
        // Delete the student's image file, if it exists
        if ($student->image) {
            $imagePath = storage_path('app/public/' . $student->image);
    
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
        }
    
        $student->delete();
    
        return response()->json(['message' => 'Student deleted successfully'], 200);
    }
}
