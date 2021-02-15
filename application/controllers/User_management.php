<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_management extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();
		$this->access_control->check_login();
		$this->access_control->check_role();

		$this->load->model('user_m');

		$this->_partial = array(
			'head',
			'header',
			'rightbar',
			'leftbar',
			'body',
			'script'
		);

		$this->_script = 'user_js';
		
		$this->css_plugin = array(
			'datatables/css/dataTables.bootstrap4.min',
			'datatables/css/responsive.bootstrap4.min'
		);

		$this->js_plugin = array(
			'datatables/js/jquery.dataTables.min',
			'datatables/js/dataTables.bootstrap4.min',
			'datatables/js/dataTables.responsive.min',
			'datatables/js/responsive.bootstrap4.min'
		);

		$this->js = array(
			'script.min',
			'process',
			'layout-settings'
		);
	}

	public function index()
	{
		$this->_module 	= 'user/user_lists';
		$this->_data 	= array(
			'title' 	=> $this->app->app_title_alt . ' - User Management',
			'users'		=> $this->user_m->getUsers(),
			'types' 	=> $this->user_m->getUserTypes(),
			'btn_add'	=> $this->app_m->getContentMenu('add-user'),
			'btn_edit'	=> $this->app_m->getContentMenu('edit-user'),
			'btn_delete'=> $this->app_m->getContentMenu('delete-user')
		);

		$this->load_view();
	}

	public function get_user()
	{
		$post = $this->input->post(null, TRUE);
		
		if( ! isset($post['id'])) :
			return false;
		else :
			$token 	= array('token' => $this->security->get_csrf_hash());
			$data 	= $this->user_m->getUserByHash($post['id']);
			$array 	= array_merge($token, $data);
			echo json_encode($array);
		endif;
	}

	private function _userRules()
	{
		$rules = array(
			array(
				'field' => 'user_name',
				'label' => 'Username',
				'rules' => 'trim|required|regex_match[/^[a-zA-Z0-9_]+$/]|min_length[3]|max_length[80]|is_unique[tb_user.user_name]',
				'errors'=> array(
					'required' => '{field} required.',
					'regex_match' => 'Allowed characters for {field} are [a-zA-Z0-9_].',
					'min_length' => 'Minimum character for {field} is {param} characters.',
					'max_length' => 'Maximum character for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'user_realname',
				'label' => 'Full Name',
				'rules' => "required|alpha_numeric_spaces|max_length[200]",
				'errors'=> array(
					'required' => '{field} required.',
					'alpha_numeric_spaces' => 'Allowed character for {field} are a-zA-Z0-9 and space.',
					'max_length' => 'Maximum length for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'user_email',
				'label' => 'Email',
				'rules' => 'required|valid_email|max_length[100]|is_unique[tb_user.user_email]',
				'errors'=> array(
					'required' => '{field} required.',
					'valid_email' => '{field} must a valid email address.',
					'max_length' => 'Maximum character for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'type_id',
				'label' => 'User Type',
				'rules' => 'required|integer',
				'errors'=> array(
					'required' => '{field} required.',
					'integer' => '{field} must integer.'
				)
			),
			array(
				'field' => 'is_active',
				'label' => 'User Status',
				'rules' => 'required|regex_match[/^(Y|N)$/]',
				'errors'=> array(
					'required' => '{field} required.',
					'regex_match' => '{field} option only Y or N.'
				)
			)
		);

		return $rules;
	}
	
	public function add_user()
	{
		$post = $this->input->post(null, TRUE);
		$this->form_validation->set_rules($this->_userRules());
		
		if ($this->form_validation->run() == TRUE) 
		{
			$user = array(
				'user_name' => strtolower($post['user_name']),
				'user_realname' => ucwords($post['user_realname']),
				'user_email' => strtolower($post['user_email']),
				'user_password' => '', 
				'type_id' => $post['type_id'],
				'user_token' => base64url_encode(hash_hmac('sha3-256', random_char(16,true), openssl_random_pseudo_bytes(16))),
				'is_active' => 'N',
				'user_picture' => 'default.png'
			);

			if($this->user_m->addUser($user) == true)
			{
				$from = $this->config->item('smtp_user');
				$this->load->library('email');
				
				$this->email->from($from, 'SIMONSTER');
				$this->email->to($user['user_email']);
				
				$this->email->subject('SIMONSTER - Account Activation');
				$this->email->message("Click link below to activating your SIMONSTER APP user account\n\n" . base_url('activation/'.$user['user_token']));
				
				$this->email->send();
				
				$status = 1;
				$msg = 'User Added.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Add User.';
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

	// public function edit_recipient()
	// {
	// 	$post = $this->input->post(null, TRUE);
	// 	$this->form_validation->set_rules($this->_emailRules());
		
	// 	if ($this->form_validation->run() == TRUE) 
	// 	{
	// 		$recipient = array(
	// 			'email_address' => $post['email_address']
	// 		);

	// 		if($this->recipient_m->editRecipient($recipient, $post['email_id']) == true)
	// 		{
	// 			$status = 1;
	// 			$msg = 'Recipient Edited.';
	// 		}
	// 		else
	// 		{
	// 			$status = 0;
	// 			$msg = 'Failed to Edit Recipient.';
	// 		}
	// 	}
	// 	else
	// 	{
	// 		$status = 0;
	// 		$msg = validation_errors();
	// 	}
		
	// 	$token = $this->security->get_csrf_hash();
	// 	$result = array('result' => $status, 'msg' => $msg, 'token' => $token);
	// 	echo json_encode($result);
	// }

	// public function delete_user()
	// {
	// 	$post = $this->input->post(null, TRUE);
		
	// 	if( ! isset($post['id']))
	// 	{
	// 		$status = 0;
	// 		$msg = 'Choose User to Delete';
	// 	}
	// 	else
	// 	{
	// 		if($this->recipient_m->deleteRecipient($post['id']))
	// 		{
	// 			$status = 1;
	// 			$msg = 'User Deleted.';
	// 		}
	// 		else
	// 		{
	// 			$status = 0;
	// 			$msg = 'Failed to Delete User.';
	// 		}
	// 	}

	// 	$token 	= $this->security->get_csrf_hash();
	// 	$result = array('result' => $status, 'msg' => $msg, 'token' => $token);
	// 	echo json_encode($result);
	// }
}

/* End of file user_management.php */
/* Location: ./application/controllers/user_management.php */