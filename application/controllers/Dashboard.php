<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();
		$this->access_control->check_login();
		$this->access_control->check_role();

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
}
