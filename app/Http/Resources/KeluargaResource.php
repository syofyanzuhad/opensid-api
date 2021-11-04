<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class KeluargaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'kepala_keluarga' => [
                'nama' => $this->penduduk->nama ?? null, 
                'nik' => $this->penduduk->nik ?? null,
            ],
            "alamat_lengkap" => $this->alamat,
            "no_kk" => $this->no_kk,
            "jalan_blok" => $this->name,
            "kode_pos" => $this->name,
            "status_kesejahteraan" => $this->name,
            "penghasilan" => $this->name,
            "status_kk" => $this->name,
            "status_pkh" => $this->name,
            "status_blt" => $this->name,
            "status_bansos" => $this->name,
            "desa" => $this->name,
            "menguasai" => $this->name,
            // "tgl_daftar" => $this->tgl_daftar,
            // "kelas_sosial" => $this->kelas_sosial,
            // "tgl_cetak_kk" => $this->tgl_cetak_kk,
            // "id_cluster" => $this->id_cluster,
        ];
    }
}
