<?php

namespace App\Http\Controllers;

use CaoJiayuan\LaravelApi\FileSystem\Traits\UploadHelper;
use Illuminate\Http\Request;

class FileController extends Controller
{
    use UploadHelper;

    public function upload(Request $request)
    {
       return $this->uploadFile($request, date('Y-m-d'));
    }
}
