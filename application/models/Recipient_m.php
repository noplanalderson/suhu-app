<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Recipient_m extends CI_Model {

	public function getRecipients()
	{
		$this->db->order_by('email_address', 'asc');
		return $this->db->get('tb_email_notifier')->result();
	}

	public function getRecipientByHash($hash)
	{
		$this->db->where('md5(sha1(email_id))', verify($hash));
		return $this->db->get('tb_email_notifier')->row_array();
	}

	public function addRecipient($recipient)
	{
		return $this->db->insert('tb_email_notifier', $recipient) ? true : false;
	}

	public function editRecipient($recipient, $hash)
	{
		$this->db->where('md5(sha1(email_id))', verify($hash));
		return $this->db->update('tb_email_notifier', $recipient) ? true : false;
	}

	public function deleteRecipient($hash)
	{
		$this->db->where('md5(sha1(email_id))', verify($hash));
		return $this->db->delete('tb_email_notifier');
	}
}

/* End of file recipient_m.php */
/* Location: ./application/models/recipient_m.php */