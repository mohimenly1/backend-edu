<?php

namespace App\Http\Controllers;

use App\Models\Unit;
use Illuminate\Http\Request;

class UnitController extends Controller
{
    

    public function storeUnit(Request $request)
    {
        // Validate the request data
        $request->validate([
            'user_id' => 'required|exists:users,id', // Check if the user with the given ID exists
            'name' => 'required|string',
            'description' => 'required|string',
          //  'audio_data' => 'required|string',
          'file' => 'required|image|max:2048',

        ]);
    
        // Handle file upload (image)
        $file = $request->file('file');
        $imagePath = $file->store('unit_images', 'public');
    
        // Create a new unit record
        $unit = new Unit();
        $unit->user_id = $request->input('user_id');
        $unit->name = $request->input('name');
        $unit->description = $request->input('description');
        $unit->image = $imagePath; // Save the image path in the database
        $unit->save();
    
        return response()->json(['message' => 'Unit created successfully'], 201);
    }


    public function getAllUnit(Request $request){
        // Define the number of units to display per page
        $perPage = $request->input('per_page', 3); // Default to 3 units per page
    
        // Fetch all units from the database with pagination
        $units = Unit::paginate($perPage);
    
        // Return the paginated units as JSON response
        return response()->json(['units' => $units], 200);
    }


    public function getAllUnits()
{
    // Fetch all units from the database
    $units = Unit::all();

    // Return the units as a JSON response
    return response()->json(['units' => $units], 200);
}



    public function deleteUnit($id)
{
    // Find the unit by its ID
    $unit = Unit::find($id);

    if (!$unit) {
        return response()->json(['message' => 'Unit not found'], 404);
    }

    // Delete the unit
    $unit->delete();

    return response()->json(['message' => 'Unit deleted successfully'], 200);
}

// Start good from here
public function index()
{
    $units = Unit::all();

    return response()->json($units);
}

public function lessons(Unit $unit)
{
    $lessons = $unit->lessons;

    return response()->json($lessons);
}
    
}
