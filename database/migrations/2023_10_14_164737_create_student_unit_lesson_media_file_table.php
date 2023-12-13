<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_unit_lesson_media_file', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('student_id');
            $table->unsignedBigInteger('unit_id');
            $table->unsignedBigInteger('lesson_id');
            $table->unsignedBigInteger('media_file_id');
            // You can add any additional fields here as needed

            $table->foreign('student_id')->references('id')->on('students');
            $table->foreign('unit_id')->references('id')->on('units');
            $table->foreign('lesson_id')->references('id')->on('lessons');
            $table->foreign('media_file_id')->references('id')->on('media_files');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('student_unit_lesson_media_file');
    }
};
