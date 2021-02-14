<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sensor_data extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();

		$this->access_control->check_login();

		$this->js = array(
			'script.min',
			'process',
			'layout-settings'
		);

		$this->css_plugin = array(
			'datatables/css/dataTables.bootstrap4.min',
			'datatables/css/responsive.bootstrap4.min',
			'datatables/css/dataTables.buttons.min',
			'flag-icon/css/flag-icon.min',
		);

		$this->js_plugin = array(
			'datatables/js/jquery.dataTables.min',
			'datatables/js/dataTables.bootstrap4.min',
			'datatables/js/dataTables.responsive.min',
			'datatables/js/dataTables.buttons.min',
			'datatables/js/responsive.bootstrap4.min',
			'datatables/js/buttons.html5.min',
			'datatables/js/jszip.min',
			'datatables/js/pdfmake.min',
			'datatables/js/vfs_fonts',
			'highcharts/code/highcharts',
			'highcharts/code/highcharts-more',
			'highcharts/code/modules/exporting',
			'highcharts/code/modules/offline-exporting',
			'momentjs/moment.min',
			'momentjs/moment-timezone.min'
		);

		$this->load->model('sensor_data_m');
	}

	public function index($hash = NULL)
	{
		$this->access_control->check_role();

		$sensor = $this->sensor_data_m->getSensor($hash);
		if(empty($sensor)) redirect('error_page');

		$this->_module 	= 'sensor_data/data';
		$this->_script 	= 'sensor_data_js';
		$this->_data 	= array(
			'title' => 'Sensor Data - '.$sensor->thermo_location,
			'sensor' => $sensor,
		);

		$this->load_view();
	}

	public function getData($hash)
	{	
		$data = json_encode($this->sensor_data_m->getSensorData($hash), JSON_PRETTY_PRINT);

		$this->output->set_status_header(200)
					 ->set_content_type('application/json')
					 ->set_output($data);
	}

	public function graphData($hash)
	{	
		$data = json_encode($this->sensor_data_m->getGraphData($hash), JSON_PRETTY_PRINT);

		$this->output->set_status_header(200)
					 ->set_content_type('application/json')
					 ->set_output($data);
	}
}

/* End of file sensor_data.php */
/* Location: ./application/controllers/sensor_data.php */	