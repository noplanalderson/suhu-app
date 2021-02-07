<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_m extends CI_Model {

	public function verify($user_name)
	{
		$this->db->select('user_id, type_id, user_password');
		$this->db->where('is_active', 'Y');
		$this->db->group_start();
		$this->db->where('user_name', $user_name);
		$this->db->or_where('user_email', $user_name);
		$this->db->group_end();
		return $this->db->get('tb_user');
	}

	public function insert_login_data($cookie_value = NULL, $cookie_exp = NULL)
	{
		$this->db->insert('tb_login_data', 
			array(
				'user_id' => $this->session->userdata('uid'),
				'login_date' => $this->session->userdata('time'),
				'cookie_value' => $cookie_value, 
				'cookie_expire' => $cookie_exp,
				'last_ip' => inet_pton(get_real_ip()),
				'user_agent' => ua()
			)
		);
	}

	public function check_cookie()
	{
		$this->db->select('a.user_id, b.type_id');
		$this->db->join('tb_user b', 'a.user_id = b.user_id', 'inner');
		$this->db->where('a.cookie_value', get_cookie('ingat_aku'));
		$this->db->where('a.cookie_expire > ', strtotime(date('Ymdhis')));
		$this->db->where('user_agent', ua());
		$this->db->where('last_ip', inet_pton(get_real_ip()));
		return $this->db->get('tb_login_data a')->row();
	}

	public function delete_cookie()
	{
		$this->db->where('cookie_value', get_cookie('ingat_aku'));
		$this->db->where('user_id', $this->session->userdata('uid'));
		$this->db->where('last_ip', inet_pton(get_real_ip()));
		$this->db->where('user_agent', ua());
		$this->db->update('tb_login_data', ['cookie_value' => NULL, 'cookie_expire' => NULL]);
	}
}

/* End of file Login_m.php */
/* Location: ./application/models/Login_m.php */