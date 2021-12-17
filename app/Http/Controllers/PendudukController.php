<?php

namespace App\Http\Controllers;

use App\Http\Resources\PendudukCollection;
use App\Http\Resources\PendudukResource;
use App\Models\Penduduk;

class PendudukController extends Controller
{
    /**
     * Display a listing of the Penduduk resource.
     *
     * @return \Illuminate\Http\Response
     * 
     * @authenticated
     * @response scenario=success
     * {
     *      "data": [
     *          {
     *              "id": 1,
     *              "created_at": "2019-05-28T15:45:28.000000Z",
     *              "updated_at": "2020-07-30T04:30:21.000000Z",
     *              "deleted_at": null,
     *              "nik": "5201142005716996",
     *              "chip_ektp": 0,
     *              "nama": "AHLUL",
     *              "tgl_lahir": "1970-05-20",
     *              "tempat_lahir": "MANGSIT",
     *              "jk": "LAKI-LAKI",
     *              "alamat_sekarang": "",
     *              "agama": "ISLAM",
     *              "pendidikan": "TAMAT SD / SEDERAJAT",
     *              "pekerjaan": "TUKANG BATU",
     *              "status_kawin": "KAWIN",
     *              "status_penduduk": null,
     *              "kewarganegaraan": "WNI",
     *              "anak_ke": 0,
     *              "golongan_darah": "TIDAK TAHU",
     *              "status_dalam_keluarga": null,
     *              "no_paspor": "",
     *              "suku": null,
     *              "potensi_diri": null,
     *              "no_hp": null,
     *              "nik_ayah": "",
     *              "nik_ibu": "",
     *              "nama_ayah": "ARFAH",
     *              "nama_ibu": "RAISAH",
     *              "tgl_exp_paspor": null,
     *              "akta_lahir": "",
     *              "akta_kawin": "",
     *              "tgl_kawin": null,
     *              "akta_cerai": "",
     *              "tgl_cerai": null,
     *              "kelainan_fisik": null,
     *              "cacat": null,
     *              "foto": "",
     *              "pass_field": null,
     *              "status_covid": null,
     *              "status_vaksin": null,
     *              "status_stunting": null,
     *              "created_by": 0,
     *              "updated_by": 1,
     *              "deleted_by": null
     *          },
     *      ],
     * }
     */
    public function index()
    {
        return new PendudukCollection(Penduduk::paginate()->get());
    }

    /**
     * Show one of the Penduduk resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * 
     * @authenticated
     * @urlParam id integer required The ID of the penduduk. Example: 1
     * @response scenario=success
     * {
     *      "data": {
     *          "id": 1,
     *          "created_at": "2019-05-28T15:45:28.000000Z",
     *          "updated_at": "2020-07-30T04:30:21.000000Z",
     *          "deleted_at": null,
     *          "nik": "5201142005716996",
     *          "chip_ektp": 0,
     *          "nama": "AHLUL",
     *          "tgl_lahir": "1970-05-20",
     *          "tempat_lahir": "MANGSIT",
     *          "jk": "LAKI-LAKI",
     *          "alamat_sekarang": "",
     *          "agama": "ISLAM",
     *          "pendidikan": "TAMAT SD / SEDERAJAT",
     *          "pekerjaan": "TUKANG BATU",
     *          "status_kawin": "KAWIN",
     *          "status_penduduk": null,
     *          "kewarganegaraan": "WNI",
     *          "anak_ke": 0,
     *          "golongan_darah": "TIDAK TAHU",
     *          "status_dalam_keluarga": null,
     *          "no_paspor": "",
     *          "suku": null,
     *          "potensi_diri": null,
     *          "no_hp": null,
     *          "nik_ayah": "",
     *          "nik_ibu": "",
     *          "nama_ayah": "ARFAH",
     *          "nama_ibu": "RAISAH",
     *          "tgl_exp_paspor": null,
     *          "akta_lahir": "",
     *          "akta_kawin": "",
     *          "tgl_kawin": null,
     *          "akta_cerai": "",
     *          "tgl_cerai": null,
     *          "kelainan_fisik": null,
     *          "cacat": null,
     *          "foto": "",
     *          "pass_field": null,
     *          "status_covid": null,
     *          "status_vaksin": null,
     *          "status_stunting": null,
     *          "created_by": 0,
     *          "updated_by": 1,
     *          "deleted_by": null
     *      }
     *  }
     */
    public function show($id)
    {
        return new PendudukResource(Penduduk::with('agama')->findOrFail($id));
    }
}
