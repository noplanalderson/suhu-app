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
		$this->login_m->delete_cookie();
		$this->cache->memcached->clean();
		
		$session = array('uid', 'gid', 'time');
		$this->session->unset_userdata($session);
		delete_cookie('ingat_aku');
		redirect('login');
	}

}

/* End of file logout.php */
/* Location: ./application/controllers/logout.php */