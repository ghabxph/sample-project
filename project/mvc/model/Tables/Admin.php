<?php namespace project\mvc\model\Tables;

use Illuminate\Database\Eloquent\Model;

/**
 * Admin Table
 *
 * @author Gabriel Lucernas Pascual <gabriel@taragala.com>
 */
class Admin extends Model
{

    /**
     * The table associated with the model.
     *
     * @var string
     */
    public $table = 'admin';

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

    /**
     * Last Admin
     *
     * @var array
     */
    private $lastAdmin;

    /**
     * Checks if username and/or password of user is valid
     *
     * @param String $username
     * @param String $password
     * @return bool
     */
    public function checkCredentials(string $username, string $password): bool
    {
        return self::getAdmin($username) !== [] && password_verify($password, $this->lastAdmin['password']);
    }

    /**
     * Returns the last admin
     *
     * @return array
     */
    public function getLastAdmin(): array
    {
        return $this->lastAdmin;
    }

    /**
     * Returns admin from username / email
     *
     * @param $username
     * @return self|null
     */
    private function getAdmin($username): ?self
    {
        $this->lastAdmin = self::where('username', $username)->orWhere('email', $username)->first();
        $this->lastAdmin = ($this->lastAdmin === null ? [] : $this->lastAdmin->toArray());
        return $this->lastAdmin;
    }
}
