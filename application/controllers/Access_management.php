<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Access_management extends SIMONSTER_Core {
	public function __construct()
	{
		parent::__construct();
		$this->access_control->check_login();
		$this->access_control->check_role();

		$this->load->model('access_m');

		$this->_partial = array(
			'head',
			'header',
			'rightbar',
			'leftbar',
			'body',
			'script'
		);

		$this->_script = 'access_js';
		
		$this->css_plugin = array(
			'datatables/css/dataTables.bootstrap4.min',
			'datatables/css/responsive.bootstrap4.min',
			'select2/dist/css/select2.min'
		);

		$this->js_plugin = array(
			'datatables/js/jquery.dataTables.min',
			'datatables/js/dataTables.bootstrap4.min',
			'datatables/js/dataTables.responsive.min',
			'datatables/js/responsive.bootstrap4.min',
			'select2/dist/js/select2.min'
		);

		$this->js = array(
			'script.min',
			'process',
			'layout-settings'
		);
	}

	public function index()
	{
		$this->_module 	= 'access/access_list';
		$this->_data 	= array(
			'title' 	=> $this->app->app_title_alt . ' - Access Management',
			'access'	=> $this->access_m->getAccess(),
			'menus'		=> $this->access_m->getMenus(),
			'btn_add'	=> $this->app_m->getContentMenu('add-access'),
			'btn_edit'	=> $this->app_m->getContentMenu('edit-access'),
			'btn_delete'=> $this->app_m->getContentMenu('delete-access')
		);

		$this->load_view();
	}

	public function get_access()
	{
		$post = $this->input->post(null, TRUE);
		
		if( ! isset($post['id'])) :
			return false;
		else :
			$token 	= array('token' => $this->security->get_csrf_hash());
			$data 	= $this->access_m->getAccessByHash($post['id']);
			$array 	= array_merge($token, $data);
			echo json_encode($array);
		endif;
	}

	public function add_access()
	{
		$post = $this->input->post(null, TRUE);

		$this->form_validation->set_rules('type_name', 'Access Type', 'trim|required|regex_match[/^[a-zA-Z ]+$/]|min_length[1]|max_length[100]|is_unique[tb_user_type.type_name]');
		$this->form_validation->set_rules('menu_id[]', 'Privileges', 'trim|required');

		if ($this->form_validation->run() == TRUE)
		{		
			if($this->access_m->addAccess($post)){
				$status = 1;
				$msg = 'Access Type Added.';
			}
			else{
				$status = 0;
				$msg = 'Failed to Add Access Type.';
			}
		}
		else
		{
			$status = 0;
			$msg = validation_errors();
		}
		
		$token = $this->security->get_csrf_hash();
		$result = array('result' => $status, 'msg' => $msg, 'token' => $token);
		echo json_encode($result);
	}

	public function edit_access()
	{
		$post = $this->input->post(null, TRUE);

		$this->form_validation->set_rules('type_name', 'Access Type', 'trim|required|regex_match[/^[a-zA-Z ]+$/]|min_length[1]|max_length[100]');
		$this->form_validation->set_rules('menu_id[]', 'Privileges', 'trim|required');

		if ($this->form_validation->run() == TRUE)
		{	
			if($this->access_m->checkAccess($post['type_name'], $post['type_id']) == 0)
			{	
				if($this->access_m->editAccess($post)){

					$status = 1;
					$msg = 'Access Type Edited.';
				}
				else
				{
					$status = 0;
					$msg = 'Failed to Edit Access Type.';
				}
			}
			else
			{
				$status = 0;
				$msg = 'Access Type Exist.';
			}
		}
		else
		{
			$status = 0;
			$msg = validation_errors();
		}
		
		$token = $this->security->get_csrf_hash();
		$result = array('result' => $status, 'msg' => $msg, 'token' => $token);
		echo json_encode($result);
	}

	public function delete_access()
	{
		$post = $this->input->post(null, TRUE);
		
		if( ! isset($post['id']))
		{
			$status = 0;
			$msg = 'Choose Access Type to Delete';
		}
		else
		{
			if($this->access_m->deleteAccess($post['id']))
			{
				$status = 1;
				$msg = 'Access Type Deleted.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Delete Access Type.';
			}
		}

		$token 	= $this->security->get_csrf_hash();
		$result = array('result' => $status, 'msg' => $msg, 'token' => $token);
		echo json_encode($result);
	}
}

/* End of file access_management.php */
/* Location: ./application/controllers/access_management.php */