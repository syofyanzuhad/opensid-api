<?php

namespace App\Http\Controllers;

use App\Http\Resources\PendudukCollection;
use App\Http\Resources\PendudukResource;
use App\Models\Penduduk;

class PendudukController extends Controller
{
    public function index()
    {
        return new PendudukCollection(Penduduk::all());
    }

    public function show($id)
    {
        return new PendudukResource(Penduduk::with('agama')->findOrFail($id));
    }
}
