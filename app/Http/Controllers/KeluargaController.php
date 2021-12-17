<?php

namespace App\Http\Controllers;

use App\Http\Resources\KeluargaResource;
use App\Models\Keluarga;
use Illuminate\Http\Request;

class KeluargaController extends Controller
{
    /**
     * Display a listing of the Keluarga resource.
     *
     * @return \Illuminate\Http\Response
     * 
     * @authenticated
     * @response scenario=success 
     * {
     *      "data": [
     *           {   
     *               "id": 1,
     *               "kepala_keluarga": {
     *                   "nama": "AHLUL",
     *                   "nik": "5201142005716996"
     *               },
     *               "alamat_lengkap": null,
     *               "objek_alamat": {
     *                   "id": 1,
     *                   "rt": "0",
     *                   "rw": "0",
     *                   "dusun": "MANGSIT",
     *                   "id_kepala": 0,
     *                   "lat": "",
     *                   "lng": "",
     *                   "zoom": 0,
     *                   "path": "",
     *                   "map_tipe": "",
     *                   "warna": null,
     *                   "urut": null,
     *                   "urut_cetak": null
     *               },
     *               "no_kk": "5201140104126994",
     *               "jalan_blok": null,
     *               "kode_pos": "83355",
     *               "status_kesejahteraan": "Keluarga Pra Sejahtera",
     *               "penghasilan": null,
     *               "status_kk": null,
     *               "status_pkh": null,
     *               "status_blt": null,
     *               "status_bansos": null,
     *               "desa": "5201142005",
     *               "menguasai": null
     *           }
     *      ],
     * }
     */
    public function index()
    {
        $keluarga = new Keluarga;

        $limit = request()->query('per_page', 50);

        if (request()->has('include[]') && request()->query('include[]') != null) {
            if (is_array(request()->query('include[]'))) {
                foreach (request()->query('include[]') as $include) {
                    $keluarga->with($include);
                }
            }
            else {
                $keluarga->with(request()->query('include[]'));
            }
        }

        if (request()->has('search')) {
            $search = request()->query('search');
            $keluarga = $keluarga->where('no_kk', 'like', '%' . $search . '%');
        }

        $keluarga = $keluarga->paginate($limit);

        return KeluargaResource::collection($keluarga);
    }

    /**
     * Show one of the Keluarga resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * 
     * @authenticated
     * @urlParam id integer required The ID of the keluarga. Example: 1
     * @response scenario=success
     * {
     *      "data": {
     *          "id": 1,
     *          "kepala_keluarga": {
     *              "nama": "AHLUL",
     *              "nik": "5201142005716996"
     *          },
     *          "alamat_lengkap": null,
     *          "objek_alamat": {
     *              "id": 1,
     *              "rt": "0",
     *              "rw": "0",
     *              "dusun": "MANGSIT",
     *              "id_kepala": 0,
     *              "lat": "",
     *              "lng": "",
     *              "zoom": 0,
     *              "path": "",
     *              "map_tipe": "",
     *              "warna": null,
     *              "urut": null,
     *              "urut_cetak": null
     *          },
     *          "no_kk": "5201140104126994",
     *          "jalan_blok": null,
     *          "kode_pos": "83355",
     *          "status_kesejahteraan": "Keluarga Pra Sejahtera",
     *          "penghasilan": null,
     *          "status_kk": null,
     *          "status_pkh": null,
     *          "status_blt": null,
     *          "status_bansos": null,
     *          "desa": "5201142005",
     *          "menguasai": null
     *      }
     *  }
     */
    public function show($id)
    {
        return new KeluargaResource(Keluarga::findOrFail($id));
    }
}
