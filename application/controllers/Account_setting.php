<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account_setting extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();
		$this->access_control->check_login();

		$this->load->model('account_m');

		$this->_partial = array(
			'head',
			'header',
			'rightbar',
			'leftbar',
			'body',
			'script'
		);

		$this->_script = 'account_js';

		$this->js = array(
			'script.min',
			'process',
			'layout-settings'
		);
	}

	public function index()
	{
		$this->_module 	= 'account/account';
		$this->_data 	= array(
			'title' 	=> $this->app->app_title_alt . ' - Account Setting',
			'account'	=> $this->account_m->getUserData(),
		);

		$this->load_view();
	}

	private function _accountRules()
	{
		$rules = array(
			array(
				'field' => 'user_name',
				'label' => 'Username',
				'rules' => 'trim|required|regex_match[/^[a-zA-Z0-9_]+$/]|min_length[3]|max_length[80]',
				'errors'=> array(
					'required' => '{field} required.',
					'regex_match' => 'Allowed characters for {field} are [a-zA-Z0-9_].',
					'min_length' => 'Minimum character for {field} is {param} characters.',
					'max_length' => 'Maximum character for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'user_password',
				'label' => 'Password',
				'rules' => 'required|regex_match[/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.* )(?=.*[^a-zA-Z0-9]).{8,32}$/]',
				'errors'=> array(
					'required' => '{field} required.',
					'regex_match' => '{field} must contain Uppercase, Lowercase, Numeric, and Symbol min. 8 characters.'
				)
			),
			array(
				'field' => 'user_password_repeat',
				'label' => 'Repeat Password',
				'rules' => 'required|matches[user_password]',
				'errors'=> array(
					'required' => '{field} required.',
					'matches' => '{field} not match.' 
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
				'rules' => 'required|valid_email|max_length[100]',
				'errors'=> array(
					'required' => '{field} required.',
					'valid_email' => '{field} must a valid email address.',
					'max_length' => 'Maximum character for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'old_picture',
				'label' => 'Old Picture',
				'rules' => 'regex_match[/^[a-zA-Z0-9.\/\-_+]+$/]'
			)
		);

		return $rules;
	}

	public function submit()
	{
		$post = $this->input->post(null, TRUE);

		$this->form_validation->set_rules($this->_accountRules());

		if ($this->form_validation->run() == TRUE)
		{
			// Get Image's filename without extension
			$filename = pathinfo($_FILES['user_picture']['name'], PATHINFO_FILENAME);

			// Remove another character except alphanumeric, space, dash, and underscore in filename
			$filename = preg_replace("/[^a-zA-Z0-9 \-_]+/i", '', $filename);

			// Remove space in filename
			$filename = str_replace(' ', '-', $filename);

			$config = array(
				'form_name' => 'user_picture', // Form upload's name
				'upload_path' => FCPATH . '_/images/users', // Upload Directory. Default : ./uploads
				'allowed_types' => 'png|jpg|jpeg|webp', // Allowed Extension
				'max_size' => '5128', // Maximun image size. Default : 5120
				'detect_mime' => TRUE, // Detect image mime. TRUE|FALSE
				'file_ext_tolower' => TRUE, // Force extension to lower. TRUE|FALSE
				'overwrite' => TRUE, // Overwrite file. TRUE|FALSE
				'enable_salt' => TRUE, // Enable salt for image's filename. TRUE|FALSE
				'file_name' => $filename, // New Image's Filename
				'extension' => 'webp', // New Imaage's Extension. Default : webp
				'quality' => '100%', // New Image's Quality. Default : 95%
				'maintain_ratio' => TRUE, // Maintain image's dimension ratio. TRUE|FALSE
				'width' => 500, // New Image's width. Default : 800px
				'height' => 500, // New Image's Height. Default : 600px
				'cleared_path' => FCPATH . '_/images/users/'.$post['uid']
			);

			// Load Library
			$this->load->library('secure_upload');

			// Send library configuration
			$this->secure_upload->initialize($config);

			// Run Library
			if($this->secure_upload->doUpload())
			{
				// Get Image(s) Data
				$picture = $this->secure_upload->data();
				$user_picture = $post['uid'].'/'.$picture['file_name'];
			}
			else
			{
				$status = 0;
				$msg = $this->secure_upload->show_errors();
				$user_picture = $post['old_picture'];
			}

			$accountData = array_merge($post, array('user_picture' => $user_picture));

			if($this->account_m->submitAccount($accountData)){
				$status = 1;
				$msg = 'Account Setting Success.<br/>'.$this->secure_upload->show_errors();
			}
			else{
				$status = 0;
				$msg = 'Account Seetting Failed.<br/>'.$this->secure_upload->show_errors();
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
}

/* End of file account_setting.php */
/* Location: ./application/controllers/account_setting.php */