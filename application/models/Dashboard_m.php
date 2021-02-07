<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_m extends CI_Model {

	public function getLogs()
	{
		$this->db->select("DATE_FORMAT(FROM_UNIXTIME(timestamp), '%d %M %Y %H:%i:%s') AS datetime, message");
		$this->db->where("DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y%m') = ", date('Ym'));
		$this->db->order_by('timestamp', 'desc');
		$data = $this->db->get('tb_logs', 0, 10)->result();

		return array("data" => $data);
	}

	public function getSensors()
	{
		$this->db->select('thermo_hash, thermo_url, thermo_location');
		$this->db->where('is_active', 'yes');
		return $this->db->get('tb_thermometer')->result();
	}
}

/* End of file dashboard_m.php */
/* Location: ./application/models/dashboard_m.php */