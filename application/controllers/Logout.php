<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();
	}
	
	public function index()
	{
		$this->load->model('login_m');
		$this->cache->memcached->clean();
		
		$session = array('uid', 'gid', 'time');
		$this->session->unset_userdata($session);
		redirect('login');
	}

}

/* End of file logout.php */
/* Location: ./application/controllers/logout.php */