<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Access_control
{
	public $uid = '';

	public $gid = '';

	public $default_page = 'dashboard';

	public $active_page = '';

	public $login_page = 'login';

	protected $_CI;

	/**
	 * Constructor
	 *
	 * @param	array	$config
	 * @return	void
	 */
	public function __construct($config = array())
	{
		empty($config) OR $this->initialize($config, FALSE);
		$this->_CI =& get_instance();
		
		$this->_CI->load->model('app_m');
		$this->_CI->load->model('login_m');

		log_message('info', 'Access Control Class Initialized');
	}

	// --------------------------------------------------------------------

	/**
	 * Initialize preferences
	 *
	 * @param	array	$config
	 * @param	bool	$reset
	 * @return	Secure_upload
	 */
	public function initialize(array $config = array(), $reset = TRUE)
	{
		$reflection = new ReflectionClass($this);

		if ($reset === TRUE)
		{
			$defaults = $reflection->getDefaultProperties();
			foreach (array_keys($defaults) as $key)
			{
				if ($key[0] === '_')
				{
					continue;
				}

				if (isset($config[$key]))
				{
					if ($reflection->hasMethod('set_'.$key))
					{
						$this->{'set_'.$key}($config[$key]);
					}
					else
					{
						$this->$key = $config[$key];
					}
				}
				else
				{
					$this->$key = $defaults[$key];
				}
			}
		}
		else
		{
			foreach ($config as $key => &$value)
			{
				if ($key[0] !== '_' && $reflection->hasProperty($key))
				{
					if ($reflection->hasMethod('set_'.$key))
					{
						$this->{'set_'.$key}($value);
					}
					else
					{
						$this->$key = $value;
					}
				}
			}
		}

		return $this;
	}

	// --------------------------------------------------------------------

	public function check_login()
	{
		if(empty($this->uid) && empty($this->gid))
		{
			redirect($this->login_page);
		}
	}

	public function is_login()
	{
		if(!empty($this->uid) && !empty($this->gid)) 
		{
			redirect($this->default_page);
		}
	}

	public function check_role()
	{
		$this->active_page = empty($this->active_page) ? $this->default_page : $this->active_page;

		$role = load_cache('role_data', 'app_m', 'checkRole', [$this->active_page, $this->gid], 3600);
		if(!empty($this->uid) && $role == 0) redirect('kesalahan/403');
	}
}