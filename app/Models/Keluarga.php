<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Keluarga extends Model
{
    use HasFactory;

    protected $table = 'tweb_keluarga';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id', 'nama'
    ];

    public function anggota() {
        return $this->hasMany(Penduduk::class, 'id_kk')->where('kk_level', '!=', 1);
    }

    public function penduduk()
    {
        return $this->hasOne('App\Models\Penduduk', 'id');
    }

    public function cluster()
    {
        return $this->hasOne('App\Models\ClusterDesa', 'id');
    }

    public function keluargaSejahtera()
    {
        return $this->hasOne('App\Models\KeluargaSejahtera', 'id');
    }

    public function getDesaAttribute()
    {
        return \App\Models\Desa::first();
    }
}
