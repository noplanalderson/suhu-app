<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App_settings extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();
		$this->access_control->check_login();
		$this->access_control->check_role();

		$this->load->model('app_m');

		$this->_partial = array(
			'head',
			'header',
			'rightbar',
			'leftbar',
			'body',
			'script'
		);

		$this->_script = 'settings_js';

		$this->js = array(
			'script.min',
			'process',
			'layout-settings'
		);
	}

	public function index()
	{
		$this->_module 	= 'setting/settings';
		$this->_data 	= array(
			'title' 	=> $this->app->app_title_alt . ' - Account Setting',
			'setting'	=> $this->app_m->getAppSetting()
		);

		$this->load_view();
	}

	private function uploadImages($form_name, $width, $height)
	{
		// Get Image's filename without extension
		$filename = pathinfo($_FILES[$form_name]['name'], PATHINFO_FILENAME);

		// Remove another character except alphanumeric, space, dash, and underscore in filename
		$filename = preg_replace("/[^a-zA-Z0-9 \-_]+/i", '', $filename);

		// Remove space in filename
		$filename = str_replace(' ', '-', $filename);

		$config = array(
			'form_name' => $form_name, // Form upload's name
			'upload_path' => FCPATH . '_/images/sites', // Upload Directory. Default : ./uploads
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
			'width' => $width, // New Image's width. Default : 800px
			'height' => $height, // New Image's Height. Default : 600px
			'cleared_path' => FCPATH . '_/images/sites/'.$form_name
		);

		// Load Library
		$this->load->library('secure_upload');

		// Send library configuration
		$this->secure_upload->initialize($config);

		// Run Library
		if($this->secure_upload->doUpload())
		{
			// Get Image(s) Data
			$image = $this->secure_upload->data();
			$image = $form_name . '/' . $image['file_name'];
		}
		else
		{
			$image = $_POST['old_'.$form_name];
		}

		return array('image' => $image, 'msg_error' => $this->secure_upload->show_errors());
	}


	private function _settingRules()
	{
		$rules = array(
			array(
				'field' => 'app_title',
				'label' => 'Application Title',
				'rules' => "required|alpha_numeric_spaces|max_length[100]",
				'errors'=> array(
					'required' => '{field} required.',
					'alpha_numeric_spaces' => 'Allowed character for {field} are a-zA-Z0-9 and space.',
					'max_length' => 'Maximum length for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'app_title_alt',
				'label' => 'Application Title (alt)',
				'rules' => "required|alpha_numeric_spaces|max_length[50]",
				'errors'=> array(
					'required' => '{field} required.',
					'alpha_numeric_spaces' => 'Allowed character for {field} are a-zA-Z0-9 and space.',
					'max_length' => 'Maximum length for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'fetch_data_time',
				'label' => 'Fetch Data Time',
				'rules' => "required|integer|max_length[11]",
				'errors'=> array(
					'required' => '{field} required.',
					'integer' => '{field} must integer.',
					'max_length' => 'Maximum length for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'footer_text',
				'label' => 'Application Title (alt)',
				'rules' => "required|regex_match[/^[a-zA-Z0-9 .\-]+$/]|max_length[255]",
				'errors'=> array(
					'required' => '{field} required.',
					'alpha_numeric_spaces' => 'Allowed character for {field} are a-zA-Z0-9, dash, dot, and space.',
					'max_length' => 'Maximum length for {field} is {param} characters.'
				)
			),
			array(
				'field' => 'old_app_icon',
				'label' => 'Old Icon',
				'rules' => 'regex_match[/^[a-zA-Z0-9.\/\-_+]+$/]'
			),
			array(
				'field' => 'old_app_logo_dark',
				'label' => 'Old Logo Dark',
				'rules' => 'regex_match[/^[a-zA-Z0-9.\/\-_+]+$/]'
			),
			array(
				'field' => 'old_app_logo_light',
				'label' => 'Old Logo Light',
				'rules' => 'regex_match[/^[a-zA-Z0-9.\/\-_+]+$/]'
			)
		);

		return $rules;
	}

	public function submit()
	{
		$post = $this->input->post(null, TRUE);

		$this->form_validation->set_rules($this->_settingRules());

		if ($this->form_validation->run() == TRUE)
		{
			$icon = $this->uploadImages('app_icon', 800, 800);
			$logo_dark = $this->uploadImages('app_logo_dark', 300, 54);
			$logo_light = $this->uploadImages('app_logo_light', 300, 54);

			$settingData = array(
				'app_title' => ucwords($post['app_title']),
				'app_title_alt' => strtoupper($post['app_title_alt']),
				'fetch_data_time' => $post['fetch_data_time'] * 1000,
				'footer_text' => $post['footer_text'],
				'company_name' => strtoupper($post['company_name']),
				'app_icon' => $icon['image'],
				'app_logo_dark' => $logo_dark['image'],
				'app_logo_light' => $logo_light['image']
			);

			if($this->app_m->updateSettings($settingData))
			{
				$this->cache->memcached->clean();
				
				$status = 1;
				$msg = 'Application Setting Updated.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Update Application Setting.';
			}

			$msg = implode('', array(
				$msg, $icon['msg_error'], 
				$logo_dark['msg_error'], 
				$logo_light['msg_error']
			));
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

/* End of file app_setting.php */
/* Location: ./application/controllers/app_setting.php */