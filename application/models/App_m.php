<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App_m extends CI_Model {

	public function getMainMenu()
	{
		$this->db->select('a.menu_id, a.menu_label, a.menu_link, a.menu_icon');
		$this->db->join('tb_roles b', 'a.menu_id = b.menu_id', 'inner');
		$this->db->where('a.menu_location', 'mainmenu');
		$this->db->where('b.type_id', $this->session->userdata('gid'));
		$this->db->order_by('a.menu_id', 'asc');
		return $this->db->get('tb_menu a')->result_array();
	}

	public function getSubMenu($parent_id)
	{
		$this->db->select('a.menu_label, a.menu_link, a.menu_icon');
		$this->db->join('tb_roles b', 'a.menu_id = b.menu_id', 'inner');
		$this->db->where('a.menu_location', 'submenu');
		$this->db->where('a.menu_parent', $parent_id);
		$this->db->where('b.type_id', $this->session->userdata('gid'));
		$this->db->order_by('a.menu_id', 'asc');
		return $this->db->get('tb_menu a')->result_array();
	}

	public function getContentMenu($link)
	{
		$this->db->select('a.menu_label, a.menu_link, a.menu_icon');
		$this->db->join('tb_roles b', 'a.menu_id = b.menu_id', 'inner');
		$this->db->where('a.menu_location', 'content');
		$this->db->where('b.type_id', $this->session->userdata('gid'));
		$this->db->where('a.menu_link', $link);
		$this->db->order_by('a.menu_id', 'asc');
		return $this->db->get('tb_menu a')->row();
	}

	public function checkRole($menu, $gid)
	{
		$this->db->select('a.role_id');
		$this->db->join('tb_menu b', 'a.menu_id = b.menu_id', 'inner');
		$this->db->where('a.type_id', $gid);
		$this->db->where('b.menu_link', $menu);
		return $this->db->get('tb_roles a')->num_rows();
	}

	public function getUserProfile()
	{
		$this->db->select("a.user_name, a.user_picture, a.user_realname, FROM_UNIXTIME(b.login_date) AS last_login, INET6_NTOA(b.last_ip) AS last_ip, c.type_name");
		$this->db->join('tb_login_data b', 'a.user_id = b.user_id', 'left');
		$this->db->join('tb_user_type c', 'a.type_id = c.type_id', 'inner');
		$this->db->where('a.user_id', $this->session->userdata('uid'));
		$this->db->order_by('b.login_date', 'desc');
		return $this->db->get('tb_user a', 1,1)->row();
	}

	public function updateLastActivity()
	{
		$data = array(
			'date_login' => $this->session->userdata('time'),
			'last_ip' => inet_pton(get_real_ip()),
			'cookie_expire' => NULL,
			'cookie_value' => NULL
		);

		$this->db->where('user_id', $this->session->userdata('uid'));
		$this->db->update('tb_user', $data);
	}

	public function getAppSetting()
	{
		return $this->db->get('tb_app_setting', 1)->row();
	}
}

/* End of file Site_m.php */
/* Location: ./application/models/Site_m.php */