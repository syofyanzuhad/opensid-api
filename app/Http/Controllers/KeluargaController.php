<?php

namespace App\Http\Controllers;

use App\Models\Keluarga;
use Illuminate\Http\Request;

class KeluargaController extends Controller
{
    public function index()
    {
        return Keluarga::all();
    }

    public function show($id)
    {
        return Keluarga::findOrFail($id);
    }
}
