<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class KeluargaSejahtera extends Model
{
    use HasFactory;

    protected $table = 'tweb_keluarga_sejahtera';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id', 'nama'
    ];
}
