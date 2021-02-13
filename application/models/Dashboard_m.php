<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_m extends CI_Model {

	public function getLogs()
	{
		$this->db->select("DATE_FORMAT(FROM_UNIXTIME(timestamp), '%d %M %Y %H:%i:%s') AS datetime, message");
		$this->db->where("DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y%m') = ", date('Ym'));
		$this->db->order_by('datetime', 'desc');
		$data = $this->db->get('tb_logs')->result();

		return array("data" => $data);
	}

	public function getSensors()
	{
		$this->db->select('thermo_hash, thermo_url, thermo_location');
		$this->db->where('is_active', 'yes');
		return $this->db->get('tb_thermometer')->result();
	}

	public function getSensorUrl($hash)
	{
		$this->db->select('thermo_url');
		$this->db->where('thermo_hash', $hash);
		return $this->db->get('tb_thermometer')->row();
	}

	public function insertTemp($temp, $hash)
	{
		$temp = array(
			'thermo_hash' => $hash,
			// 'timestamp' => $temp->time,
			'timestamp' => time(),
			'temperature' => $temp->temperature,
			'humidity' => $temp->humidity,
			'dew_point' => $temp->dew_point
		);

		$this->db->insert('tb_room_temp', $temp);
	}

	public function insertLog($logs)
	{
		$this->db->insert('tb_logs', $logs);
	}

	public function getEmails()
	{
		$this->db->select('email_address');
		return $this->db->get('tb_email_notifier')->result_array();
	}
}

/* End of file dashboard_m.php */
/* Location: ./application/models/dashboard_m.php */