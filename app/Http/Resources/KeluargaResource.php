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
            "objek_alamat" => $this->cluster ?? [],
            "no_kk" => $this->no_kk,
            "jalan_blok" => $this->name,
            "kode_pos" => $this->desa->kode_pos ?? null,
            "status_kesejahteraan" => $this->keluargaSejahtera->nama ?? null,
            "penghasilan" => $this->penghasilan,
            "status_kk" => $this->status_kk,
            "status_pkh" => $this->status_pkh,
            "status_blt" => $this->status_blt,
            "status_bansos" => $this->status_bansos,
            "desa" => $this->desa->kode_desa ?? null,
            "menguasai" => $this->menguasai,
            "anggota" => PendudukResource::collection($this->whenLoaded('anggota')),
            // "tgl_daftar" => $this->tgl_daftar,
            // "kelas_sosial" => $this->kelas_sosial,
            // "tgl_cetak_kk" => $this->tgl_cetak_kk,
            // "id_cluster" => $this->id_cluster,
        ];
    }
}
