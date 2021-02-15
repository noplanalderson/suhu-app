<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notification_recipient extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();
		$this->access_control->check_login();
		$this->access_control->check_role();

		$this->load->model('recipient_m');

		$this->_partial = array(
			'head',
			'header',
			'rightbar',
			'leftbar',
			'body',
			'script'
		);

		$this->_script = 'recipients_js';
		
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
		$this->_module 	= 'recipient/recipient_lists';
		$this->_data 	= array(
			'title' 	=> $this->app->app_title_alt . ' - Notification Recipient',
			'recipients'=> $this->recipient_m->getRecipients(),
			'btn_add'	=> $this->app_m->getContentMenu('add-recipient'),
			'btn_edit'	=> $this->app_m->getContentMenu('edit-recipient'),
			'btn_delete'=> $this->app_m->getContentMenu('delete-recipient')
		);

		$this->load_view();
	}

	public function get_recipient()
	{
		$post = $this->input->post(null, TRUE);
		
		if( ! isset($post['id'])) :
			return false;
		else :
			$token 	= array('token' => $this->security->get_csrf_hash());
			$data 	= $this->recipient_m->getRecipientByHash($post['id']);
			$array 	= array_merge($token, $data);
			echo json_encode($array);
		endif;
	}

	private function _emailRules()
	{
		$rules = array(
			array(
				'field' => 'email_id',
				'label' => 'Email ID',
				'rules' => 'regex_match[/^[a-zA-Z0-9\-_+]+$/]',
				'errors'=> array(
                    'regex_match' => '{field} not valid.'
                )
			),
			array(
				'field' => 'email_address',
				'label' => 'Email Address',
				'rules' => 'valid_email|required',
				'errors'=> array(
                    'valid_email' => '{field} not valid.',
                    'required' => '{field} required.'
                )
			)
		);
		return $rules;
	}
	
	public function add_recipient()
	{
		$post = $this->input->post(null, TRUE);
		$this->form_validation->set_rules($this->_emailRules());
		
		if ($this->form_validation->run() == TRUE) 
		{
			$recipient = array(
				'email_address' => $post['email_address']
			);

			if($this->recipient_m->addRecipient($recipient) == true)
			{
				$status = 1;
				$msg = 'Recipient Added.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Add Recipient.';
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

	public function edit_recipient()
	{
		$post = $this->input->post(null, TRUE);
		$this->form_validation->set_rules($this->_emailRules());
		
		if ($this->form_validation->run() == TRUE) 
		{
			$recipient = array(
				'email_address' => $post['email_address']
			);

			if($this->recipient_m->editRecipient($recipient, $post['email_id']) == true)
			{
				$status = 1;
				$msg = 'Recipient Edited.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Edit Recipient.';
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

	public function delete_recipient()
	{
		$post = $this->input->post(null, TRUE);
		
		if( ! isset($post['id']))
		{
			$status = 0;
			$msg = 'Choose Recipient to Delete';
		}
		else
		{
			if($this->recipient_m->deleteRecipient($post['id']))
			{
				$status = 1;
				$msg = 'Recipient Deleted.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Delete Recipient.';
			}
		}

		$token 	= $this->security->get_csrf_hash();
		$result = array('result' => $status, 'msg' => $msg, 'token' => $token);
		echo json_encode($result);
	}
}

/* End of file notification_recipient.php */
/* Location: ./application/controllers/notification_recipient.php */