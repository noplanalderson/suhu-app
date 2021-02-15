<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account_m extends CI_Model {

	public function getUserData()
	{
		$this->db->select('user_id, user_name, user_realname, user_email, user_picture');
		$this->db->where('user_id', $this->session->userdata('uid'));
		return $this->db->get('tb_user')->row();
	}	

	public function submitAccount($account)
	{
		$pwd = passwordHash($account['user_password'], 
			[
				'memory_cost' => 2048, 
				'time_cost' => 4, 
				'threads' => 3
			]
		);

		$account = array(
			'user_name' => $account['user_name'],
			'user_password' => $pwd,
			'user_realname' => $account['user_realname'],
			'user_email' => $account['user_email'],
			'user_picture' => $account['user_picture']
		);

		$this->db->where('user_id', $this->session->userdata('uid'));
		return $this->db->update('tb_user', $account) ? true : false;
	}
}

/* End of file account_m.php */
/* Location: ./application/models/account_m.php */