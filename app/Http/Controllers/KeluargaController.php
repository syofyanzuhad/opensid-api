<?php

namespace App\Http\Controllers;

use App\Http\Resources\KeluargaCollection;
use App\Http\Resources\KeluargaResource;
use App\Models\Keluarga;
use Illuminate\Http\Request;

class KeluargaController extends Controller
{
    /**
     * Display a listing of the Keluarga resource.
     *
     * @authenticated
     * @return \Illuminate\Http\Response
     * @response scenario=success 
     * {
     *      "data": [
     *      {
     *          "id": 1,
     *          "kepala_keluarga": {
     *              "nama": "AHLUL",
     *              "nik": "5201142005716996"
     *          },
     *          "alamat_lengkap": null,
     *          "no_kk": "5201140104126994",
     *          "jalan_blok": null,
     *           "kode_pos": null,
     *          "status_kesejahteraan": null,
     *          "penghasilan": null,
     *          "status_kk": null,
     *          "status_pkh": null,
     *          "status_blt": null,
     *          "status_bansos": null,
     *          "desa": null,
     *          "menguasai": null
     *      },
     * }
     */
    public function index()
    {
        return new KeluargaCollection(Keluarga::all());
    }

    /**
     * Show one of the Keluarga resource.
     *
     * @authenticated
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * 
     * @response scenario=success
     * {
     *      "data": {
     *          "id": 1,
     *          "kepala_keluarga": {
     *              "nama": "AHLUL",
     *               "nik": "5201142005716996"
     *          },
     *          "alamat_lengkap": null,
     *          "no_kk": "5201140104126994",
     *          "jalan_blok": null,
     *          "kode_pos": null,
     *          "status_kesejahteraan": null,
     *          "penghasilan": null,
     *          "status_kk": null,
     *          "status_pkh": null,
     *          "status_blt": null,
     *          "status_bansos": null,
     *          "desa": null,
     *          "menguasai": null
     *      }
     *  }
     */
    public function show($id)
    {
        return new KeluargaResource(Keluarga::findOrFail($id));
    }
}
