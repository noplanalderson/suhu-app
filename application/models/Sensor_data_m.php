<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sensor_data_m extends CI_Model {

	public function getSensor($hash)
	{
		$this->db->select('thermo_location, thermo_hash, thermo_url');
		$this->db->where('thermo_hash', $hash);
		return $this->db->get('tb_thermometer')->row();
	}	

	public function getSensorData($hash)
	{
		$this->db->select(
			"DATE_FORMAT(FROM_UNIXTIME(timestamp), '%d %M %Y %H:%i:%s') AS datetime,
			temperature, humidity, dew_point
		");
		$this->db->where('thermo_hash', $hash);
		// $this->db->order_by('datetime', 'asc');
		$data = $this->db->get('tb_room_temp')->result();

		return array("data" => $data);
	}

	public function getGraphData($hash)
	{
		$this->db->select('timestamp, temperature');
		$this->db->where('thermo_hash', $hash);
		$this->db->where("DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y%m') = ", date('Ym'));
		$this->db->order_by('timestamp', 'asc');
		$data = $this->db->get('tb_room_temp')->result();

		$graphData = [];

		foreach ($data as $key => $value) {
			$graphData[] = array(intval($value->timestamp.'000'), (int)$value->temperature);
		}

		return $graphData;
	}
}

/* End of file sensor_m.php */
/* Location: ./application/models/sensor_data_m.php */