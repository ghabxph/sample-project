<?php namespace project\core\bl;

use project\mvc\model\Tables\Admin;

/**
 * Login
 *
 * @author Gabriel Lucernas Pascual <me@ghabxph.info>
 */
class Login
{

    /**
     * @var Admin
     */
    private $admin;

    /**
     * Login constructor.
     *
     * @param Admin $admin
     */
    public function __construct(Admin $admin)
    {
        $this->admin = $admin;
    }

    /**
     * Logs user in
     *
     * @param string $sUsername
     * @param string $sPassword
     * @return bool
     */
    public function login(string $sUsername, string $sPassword): bool
    {
        if ($this->admin->checkCredentials($sUsername, $sPassword)) {

        }
        return false;
    }
}
