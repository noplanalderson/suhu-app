<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sensor_management extends SIMONSTER_Core 
{
	public function __construct()
	{
		parent::__construct();
		$this->access_control->check_login();
		// $this->access_control->check_role();

		$this->load->model('sensor_m');

		$this->_partial = array(
			'head',
			'header',
			'rightbar',
			'leftbar',
			'body',
			'script'
		);

		$this->_script = 'sensorjs';
		
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
		$this->_module 	= 'sensor/sensor_list';
		$this->_data 	= array(
			'title' 	=> $this->app->app_title_alt . ' - Sensor Management',
			'sensors'	=> $this->sensor_m->getSensors(),
			'btn_add'	=> $this->app_m->getContentMenu('add-sensor'),
			'btn_edit'	=> $this->app_m->getContentMenu('edit-sensor'),
			'btn_delete'=> $this->app_m->getContentMenu('delete-sensor')
		);

		$this->load_view();
	}

	public function get_sensor()
	{
		$post = $this->input->post(null, TRUE);
		
		if( ! isset($post['id'])) :
			return false;
		else :
			$token 	= array('token' => $this->security->get_csrf_hash());
			$data 	= $this->sensor_m->getSensorByHash($post['id']);
			$array 	= array_merge($token, $data);
			echo json_encode($array);
		endif;
	}

	private function _sensorRules()
	{
		$rules = array(
			array(
				'field' => 'thermo_hash',
				'label' => 'Sensor Hash',
				'rules' => 'regex_match[/^[a-zA-Z0-9\-_+]+$/]',
				'errors'=> array(
                    'regex_match' => '{field} not valid.'
                )
			),
			array(
				'field' => 'thermo_url',
		        'label' => 'Sensor URL',
		        'rules' => 'valid_url|required|is_unique[tb_thermometer.thermo_hash]',
		        'errors'=> array('required' => '{field} required',
                    'valid_url' => '{field} must a valid URL.',
                    'is_unique' => '{field} exist.'
                )
			),
			array(
				'field' => 'thermo_location',
		        'label' => 'Sensor Location',
		        'rules' => 'regex_match[/[a-zA-Z0-9 \-_]+$/]|required',
		        'errors'=> array(
		        	'required' => '{field} required',
                    'regex_match' => 'Permit Character(s) for {field} are [a-zA-Z0-9 \-_].'
                )
			)
		);
		return $rules;
	}

	public function add_sensor()
	{
		$post = $this->input->post(null, TRUE);
		$this->form_validation->set_rules($this->_sensorRules());
		
		if ($this->form_validation->run() == TRUE) 
		{
			$thermo_hash = base64url_encode(hash_hmac('sha3-256', random_string(16), openssl_random_pseudo_bytes(16)));

			$script_path	= FCPATH . 'scheduler/';
			$scheduler		= 'scheduler-' . $thermo_hash . '.sh';
			$script_file	= fopen($script_path . $scheduler, "w") or die("Unable to open file!");
			$command 		= "#!/bin/bash\n/usr/bin/curl -k '".base_url('get-suhu/'.$thermo_hash)."'";
			
			fwrite($script_file, $command);
			fclose($script_file);

			chmod($script_path . $scheduler, 0655);

			$sensor = array(
				'thermo_hash' => $thermo_hash,
				'installation_date' => strtotime(date('Ymd')),
				'thermo_url' => $post['thermo_url'],
				'thermo_location' => $post['thermo_location'],
				'is_active' => $post['is_active']
			);

			if($this->sensor_m->addSensor($sensor))
			{
				if($post['is_active'] == 'yes')
				{					
					$config = array(
						'path' => $script_path,
						'handle' => 'crontab.txt',
						'scheduler' => '1 * * * *',
						'script_file' => $scheduler,
					);
					$this->load->library('cronjob', $config);
					$this->cronjob->create_script();
					$this->cronjob->append_cronjob();
				}

				$status = 1;
				$msg = 'Sensor Added.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Add Sensor.';
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

	public function edit_sensor()
	{
		$post = $this->input->post(null, TRUE);
		$this->form_validation->set_rules($this->_sensorRules());
		
		if ($this->form_validation->run() == TRUE) 
		{
			$sensor = array(
				'thermo_url' => $post['thermo_url'],
				'thermo_location' => $post['thermo_location'],
				'is_active' => $post['is_active']
			);

			if($this->sensor_m->editSensor($sensor, $post['thermo_hash']))
			{
				$script_path = FCPATH . 'scheduler/';
				$scheduler = 'scheduler-' . $post['thermo_hash'] . '.sh';

				$cron_regex = ltrim(FCPATH . 'scheduler/' . $scheduler, '/');
				$cron_regex = str_replace('/', '\/', $cron_regex);
				$cron_regex = '/'.str_replace('.', '\.', $cron_regex).'/';

				$config = array(
					'path' => $script_path,
					'handle' => 'crontab.txt',
					'scheduler' => '1 * * * *',
					'script_file' => $scheduler,
				);
				$this->load->library('cronjob', $config);

				if($this->cronjob->check_cron($cron_regex) == true) {
					$this->cronjob->remove_cronjob($cron_regex);
				}

				if($post['is_active'] == 'yes')
				{
					$this->cronjob->create_script();
					$this->cronjob->append_cronjob();
				}

				$status = 1;
				$msg = 'Sensor Edited.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Edit Sensor.';
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

	public function delete_sensor()
	{
		$post = $this->input->post(null, TRUE);
		
		if( ! isset($post['id']))
		{
			$status = 0;
			$msg = 'Choose Sensor to Delete';
		}
		else
		{
			if($this->sensor_m->deleteSensor($post['id']))
			{
				$taskname = FCPATH . 'scheduler/scheduler-' . $post['id'] . '.sh';

				$taskname = ltrim($taskname, '/');
				$taskname = str_replace('/', '\/', $taskname);
				$cron_regex = '/'.str_replace('.', '\.', $taskname).'/';
				
				$this->load->library('cronjob');

				if($this->cronjob->check_cron($cron_regex) == true) {
					$this->cronjob->remove_cronjob($cron_regex);
				}
				
				$status = 1;
				$msg = 'Sensor Deleted.';
			}
			else
			{
				$status = 0;
				$msg = 'Failed to Delete Sensor.';
			}
		}

		$token 	= $this->security->get_csrf_hash();
		$result = array('result' => $status, 'msg' => $msg, 'token' => $token);
		echo json_encode($result);
	}

	public function test()
	{
		$config = array(
			'path' => FCPATH . 'scheduler/',
			'handle' => 'cronTab.txt',
			'scheduler' => '1 * * * *',
			'script_file' => 'scheduler-1.sh',
		);
		$this->load->library('cronjob', $config);
		$this->cronjob->create_script();
		$this->cronjob->append_cronjob();
	}

	public function testdua()
	{
		$taskname = FCPATH . 'scheduler/scheduler-1.sh';
		$cron_jobs = ltrim($taskname, '/');
		$cron_jobs = str_replace('/', '\/', $cron_jobs);
		$cron_jobs = '/'.str_replace('.', '\.', $cron_jobs).'/';

		$config = array(
			'path' => FCPATH . 'scheduler/',
			'handle' => 'crontab.txt',
			'scheduler' => '1 * * * *',
			'script_file' => 'scheduler-1.sh',
		);
		$this->load->library('cronjob', $config);
		// if($this->cronjob->check_cron($cron_jobs) == true) {
			$this->cronjob->remove_cronjob($cron_jobs);
		// }
		// else
		// {
		// 	echo 'gagal';
		// }
	}
}
/* End of file sensor_management.php */
/* Location: ./application/controllers/sensor_management.php */