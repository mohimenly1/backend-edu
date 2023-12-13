<?php

namespace App\Http\Controllers;

use App\Models\School;
use Illuminate\Http\Request;

class SchoolController extends Controller
{
    public function createSchool(Request $request){
        // Validate the request data
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        // Create a new school
        $school = School::create([
            'name' => $request->input('name'),
        ]);

        // Return a response indicating success
        return response()->json([
            'message' => 'School created successfully',
            'school' => $school,
        ], 201);
    }


    public function getPaginatedSchools(Request $request) {
        $perPage = $request->input('per_page', 10); // Number of records per page, default is 10
        $schools = School::paginate($perPage);
    
        return response()->json(['schools' => $schools], 200);
    }


    public function getAllSchools() {
        $schools = School::all();
    
        return response()->json(['schools' => $schools], 200);
    }
    


    public function deleteSchool($id) {
        $school = School::find($id);
    
        if (!$school) {
            return response()->json(['message' => 'School not found'], 404);
        }
    
        $school->delete();
    
        return response()->json(['message' => 'School deleted successfully'], 200);
    }
    
}
