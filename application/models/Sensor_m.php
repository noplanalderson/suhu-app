<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sensor_m extends CI_Model {

	public function getSensors()
	{
		$this->db->select('thermo_hash, installation_date, thermo_url, thermo_location, cron_schedule, is_active');
		$this->db->order_by('installation_date', 'asc');
		return $this->db->get('tb_thermometer')->result();
	}

	public function getSensorByHash($hash)
	{
		$this->db->where('thermo_hash', $hash);
		$sensor = $this->db->get('tb_thermometer')->row_array();

		$cron = explode(' ', $sensor['cron_schedule']);
		return array_merge($sensor, array(
			'minute' => $cron[0],
			'hour' => $cron[1],
			'date' => $cron[2],
			'month' => $cron[3],
			'day_of_week' => $cron[4]
		));
	}

	public function addSensor($sensor)
	{
		return $this->db->insert('tb_thermometer', $sensor) ? true : false;
	}

	public function editSensor($sensor, $hash)
	{
		$this->db->where('thermo_hash', $hash);
		return $this->db->update('tb_thermometer', $sensor) ? true : false;
	}

	public function deleteSensor($hash)
	{
		$this->db->where('thermo_hash', $hash);
		return $this->db->delete('tb_thermometer') ? true : false;
	}
}

/* End of file sensor_m.php */
/* Location: ./application/models/sensor_m.php */