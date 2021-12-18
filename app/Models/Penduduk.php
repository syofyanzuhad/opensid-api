<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penduduk extends Model
{
    use HasFactory;

    protected $table = 'tweb_penduduk';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nama', 'nik', 'id_kk', 'kk_level', 'id_rtm', 'rtm_level', 'sex', 'tempatlahir', 'tanggallahir', 'agama_id', 'pendidikan_kk_id', 'pendidikan_sedang_id', 'pekerjaan_id', 'status_kawin', 'warganegara_id', 'dokumen_pasport', 'dokumen_kitas', 'ayah_nik', 'ibu_nik', 'nama_ayah', 'nama_ibu', 'foto', 'golongan_darah_id', 'id_cluster', 'status', 'alamat_sebelumnya', 'alamat_sekarang', 'status_dasar', 'hamil', 'cacat_id', 'sakit_menahun_id', 'akta_lahir', 'akta_perkawinan', 'tanggalperkawinan', 'akta_perkawinan', 'tanggalperkawinan', 'akta_perceraian', 'tanggalperceraian', 'cara_kb_id', 'telepon', 'tanggal', 'no_kk_sebelumnya', 'ktp_el', 'status_rekam', 'waktu_lahir', 'tempat_dilahirkan', 'jenis_kelahiran', 'kelahiran_anak_ke', 'penolong_kelahiran', 'berat_lahir', 'panjang_lahir', 'tag_id_card', 'created_at', 'updated_at', 'updated_by', 'id_asuransi', 'no_asuransi', 'email'
    ];

    public function keluarga()
    {
        return $this->hasMany(Keluarga::class, 'nik_kepala', 'id_kk');
    }

    public function agama() {
        return $this->belongsTo('App\Models\Agama', 'agama_id');
    }

    public function jenisKelamin() {
        return $this->belongsTo('App\Models\Sex', 'sex');
    }

    public function statusKawin() {
        return $this->belongsTo('App\Models\StatusKawin', 'status_kawin');
    }

    public function pekerjaan() {
        return $this->belongsTo('App\Models\Pekerjaan', 'pekerjaan_id');
    }

    public function kewarganegaraan() {
        return $this->belongsTo('App\Models\Kewarganegaraan', 'warganegara_id');
    }

    public function golonganDarah() {
        return $this->belongsTo('App\Models\GolonganDarah', 'golongan_darah_id');
    }

    public function cacat() {
        return $this->belongsTo('App\Models\Cacat', 'cacat_id');
    }

    public function pendidikanKk() {
        return $this->belongsTo('App\Models\PendidikanKartuKeluarga', 'pendidikan_kk_id');
    }
}
