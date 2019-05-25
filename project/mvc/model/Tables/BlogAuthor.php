<?php namespace project\mvc\model\Tables;


use Illuminate\Database\Eloquent\Model;

/**
 * Class BlogAuthor
 *
 * @author  Gabriel Lucernas Pascual <gabriel@taragala.com>
 */
class BlogAuthor extends Model
{

    /**
     * The table associated with the model.
     *
     * @var string
     */
    public $table = 'blog_author';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    public $guarded = ['id'];
}