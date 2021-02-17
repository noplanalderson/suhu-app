<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Forgot_m extends CI_Model {

	public function checkEmail($email)
	{
		$this->db->select('user_email');
		$this->db->where('user_email', $email);
		return $this->db->get('tb_user')->num_rows();
	}

	public function updateToken($email, $token)
	{
		$this->db->where('user_email', $email);
		return $this->db->update('tb_user', ['user_token' => $token]) ? true : false;
	}

}

/* End of file forgot_m.php */
/* Location: ./application/models/forgot_m.php */