<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Access_m extends CI_Model {

	public function getAccess()
	{
		return $this->db->get('tb_user_type')->result();
	}

	public function getMenus()
	{
		$this->db->select('menu_id, menu_label');
		$this->db->order_by('menu_label', 'asc');
		return $this->db->get('tb_menu')->result();
	}

	public function getPrivByID($type_id)
	{
		$this->db->select('a.menu_label');
		$this->db->join('tb_roles b', 'a.menu_id = b.menu_id', 'inner');
		$this->db->where('b.type_id', $type_id);
		$result = $this->db->get('tb_menu a');
		
		$data = $result->result_array();
		$count= $result->num_rows();

		if($count !== 0)
		{
			foreach ($data as $row) 
			{
				$priv[] = $row['menu_label'];
			}

			return implode(', ', $priv);
		}
	}

	private function _getPrivileges($id)
	{
		$this->db->select('menu_id');
		$this->db->where('md5(sha1(type_id))', $id);
		$result = $this->db->get('tb_roles');

		$data = $result->result_array();
		$count= $result->num_rows();

		if($count !== 0)
		{
			foreach ($data as $row) 
			{
				$priv[] = $row['menu_id'];
			}

			return implode(',', $priv);
		}
	}

	public function getAccessByHash($id)
	{
		$id 	= verify($id);
		$priv 	= array('priv' => $this->_getPrivileges($id));
		
		$this->db->where('md5(sha1(type_id))', $id);
		$user_type =  $this->db->get('tb_user_type')->row_array();

		return array_merge($user_type, $priv);
	}

	public function addAccess($access)
	{
		$insert = $this->db->insert('tb_user_type', array('type_name' => $access['type_name'])) ? true : false;
		if($insert)
		{
			$id = $this->_getAccessID('type_name', strtolower($access['type_name']));
			$loop = count($access['menu_id']);

			for ($i = 0; $i < $loop; $i++)
			{
				$this->_addPrivileges($id, $access['menu_id'][$i]);
			}

			return true;
		}
	}

	private function _addPrivileges($id, $priv)
	{
		$object = array('type_id' => $id, 'menu_id' => $priv);
		return $this->db->insert('tb_roles', $object) ? true : false;
	}

	private function _getAccessID($column, $value)
	{
		$this->db->select('type_id');
		$this->db->where($column, $value);
		$result = $this->db->get('tb_user_type', 1)->row();
		return $result->type_id;
	}

	public function checkAccess($type, $id)
	{
		$this->db->select('type_name');
		$this->db->where('type_name', $type);
		$this->db->where('md5(sha1(type_id)) !=', verify($id));
		return $this->db->get('tb_user_type')->num_rows();
	}

	public function editAccess($access)
	{
		$this->db->where('md5(sha1(type_id))', verify($access['type_id']));
		$delete = $this->db->delete('tb_roles') ? true : false;

		if($delete) {
			$this->db->where('md5(sha1(type_id))', verify($access['type_id']));
			$update = $this->db->update('tb_user_type', array('type_name' => $access['type_name']));
			if($update) {
				$id = $this->_getAccessID('md5(sha1(type_id))', verify($access['type_id']));
				$loop = count($access['menu_id']);

				for ($i = 0; $i < $loop; $i++)
				{
					$this->_addPrivileges($id, $access['menu_id'][$i]);
				}

				return true;
			}
		}
	}

	public function deleteAccess($hash)
	{
		$this->db->where('md5(sha1(type_id))', verify($hash));
		return $this->db->delete('tb_user_type') ? true : false;
	}
}

/* End of file access_m.php */
/* Location: ./application/models/access_m.php */