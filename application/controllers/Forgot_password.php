<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Forgot_password extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();
		$this->access_control->is_login();

		$this->_partial = array(
			'head',
			'body',
			'script'
		);

		$this->js = array(
			'script.min',
			'process',
			'layout-settings'
		);

		$this->_script = 'forgot_js';

		$this->load->model('forgot_m');
	}

	public function index()
	{
		$this->_module 	= 'account/forgot_view';
		$this->_data 	= array(
			'title' 	=> $this->app->app_title_alt . ' - Forgot Password',
		);

		$this->load_view();
	}

	public function submit()
	{
		$post = $this->input->post(null, TRUE);
			
		$form_rules = [
	        ['field' => 'user_email',
	         'label' => 'User Email',
	         'rules' => 'trim|required|valid_email',
	         'errors'=> array('required' => '{field} required', 
	                    'valid_email' => '{field} must a valid email address')
	        ]
	    ];

		$this->form_validation->set_rules($form_rules);

		if ($this->form_validation->run() == TRUE)
		{
			if($this->forgot_m->checkEmail($post['user_email']) == 1)
			{
				$token = base64url_encode(hash_hmac('sha3-256', random_char(16,true), openssl_random_pseudo_bytes(16)));

				$this->forgot_m->updateToken($post['user_email'],$token);

				$from = $this->config->item('smtp_user');
				$this->load->library('email');
				
				$this->email->from($from, 'SIMONSTER');
				$this->email->to($post['user_email']);
				
				$this->email->subject('FORGOT AND RESET PASSSWORD');
				$this->email->message("Dear ".$post['user_email'].", you you have accessed the forgot password service. Please click on the link below to reset your password.\n\n".base_url('activation/'.$token));
				
				if(!$this->email->send())
				{
					$status = 0;
					$msg = $this->email->print_debugger();
				}
				else
				{
					$status = 1;
					$msg = 'Password Reset Link was Sent to Your Email.';
				}
			}
			else
			{
				$status = 0;
				$msg = 'Email not Registered';
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

/* End of file forgot_password.php */
/* Location: ./application/controllers/forgot_password.php */