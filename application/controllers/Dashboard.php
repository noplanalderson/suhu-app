<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();

		$this->js = array(
			'script.min',
			'process',
			'layout-settings'
		);

		$this->css_plugin = array(
			'datatables/css/dataTables.bootstrap4.min',
			'datatables/css/responsive.bootstrap4.min',
			'flag-icon/css/flag-icon.min',
			'RGraph/demos/demos'
		);

		$this->js_plugin = array(
			'datatables/js/jquery.dataTables.min',
			'datatables/js/dataTables.bootstrap4.min',
			'datatables/js/dataTables.responsive.min',
			'datatables/js/responsive.bootstrap4.min',
			'RGraph/libraries/RGraph.common.core',
			'RGraph/libraries/RGraph.common.dynamic',
			'RGraph/libraries/RGraph.meter',
			'RGraph/demos/demos'
		);

		$this->load->library('user_agent');
		$this->load->model('dashboard_m');
	}

	public function index()
	{
		$this->access_control->check_login();
		$this->access_control->check_role();

		$this->_module 	= 'dashboard/dashboard';
		$this->_script 	= 'dashboard_custom_js';
		$this->_data 	= array(
			'title' => $this->app->app_title_alt . ' - Dashboard',
			'sensors' => $this->dashboard_m->getSensors()
		);

		$this->load_view();
	}

	public function getLogs()
	{
		$data = json_encode($this->dashboard_m->getLogs(), JSON_PRETTY_PRINT);

		$this->output->set_status_header(200)
					 ->set_content_type('application/json')
					 ->set_output($data);
	}

	public function get_dummy()
	{
		$temp = mt_rand(0*10, 100*10) / 10;
		$hum = mt_rand(0*10, 100*10) / 10;
		$dew = mt_rand(0*10, 100*10) / 10;
		echo json_encode(
			[
				'location' => 'Network Room', 
				'time' => time(), 
				'temperature' => $temp,
				'humidity' => $hum,
				'dew_point' => $dew
			]
		);
	}

	private function _logging($logs)
	{
		$this->load->library('logging');
		$this->logging->initialize($logs);
		$status = $this->logging->checkValue();
		return $this->logging->messages($status['status'], $status['color']);
	}

	public function get_temp($hash = NULL)
	{
		$sensor = $this->dashboard_m->getSensorUrl($hash);

		if(empty($sensor)) redirect('page_error');

		$ch = curl_init();
	    curl_setopt($ch, CURLOPT_HEADER, false);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($ch, CURLOPT_URL, $sensor->thermo_url);
	    $sensorData = curl_exec($ch);
	    curl_close($ch);

		$dataArray = json_decode($sensorData);
		$logs = [];

		$temp = array(
			'item' => 'Temperature',
			'value' => $dataArray->temperature,
			'timestamp' => time(),
			'unit' => '°C',
			'location' => $dataArray->location,
			'critical_range' => array(10,36),
			'warn_range' => array('bottom' => [11,17], 'top' => [27,34])
		);
		$logs[] = $this->_logging($temp);
	    
		$hum = array(
			'item' => 'Humidity',
			'value' => $dataArray->humidity,
			'timestamp' => time(),
			'unit' => '%',
			'location' => $dataArray->location,
			'critical_range' => array(29,71),
			'warn_range' => array('bottom' => [30,39], 'top' => [61,70])
		);
		$logs[] = $this->_logging($hum);

		$dew = array(
			'item' => 'Dew Point',
			'value' => round($dataArray->dew_point, 2),
			'timestamp' => time(),
			'unit' => '°C',
			'location' => $dataArray->location,
			'critical_range' => array(3,16.6),
			'warn_range' => array('bottom' => [4,5.4], 'top' => [16,15.5])
		);
		$logs[] = $this->_logging($dew);

		$this->logging->sendLogToEmail($logs);

	    $this->dashboard_m->insertTemp($dataArray, $hash);

	    return $this->output
			        ->set_content_type('application/json')
			        ->set_status_header(200)
			        ->set_output($sensorData);
	}
}
