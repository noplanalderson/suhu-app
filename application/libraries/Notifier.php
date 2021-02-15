<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notifier
{
	public $temp_msg = '';

	public $hum_msg = '';

	public $dew_msg = '';

	protected $_CI;

	public function __construct($config = array())
	{
		foreach ($config as $key => $value) {
			$this->$key = $value;
		}

		$this->_CI = get_instance();
		$this->_CI->load->library('email');
		$this->_CI->load->model('dashboard_m');
	}

	public function msgLists()
	{
		return '<ul>
			<li>'.$this->temp_msg.'</li>
			<li>'.$this->hum_msg.'</li>
			<li>'.$this->dew_msg.'</li>
		</ul>';
	}

	public function sendLogToEmail()
	{
		$from = $this->_CI->config->item('smtp_user');

		$list = $this->_CI->dashboard_m->getEmails();

		if(!empty($list))
		{
			foreach ($list as $name => $address)
			{
			    $this->_CI->email->clear();

			    $this->_CI->email->to($address);
			    $this->_CI->email->set_newline("\r\n");
			    $this->_CI->email->from($from);
			    $this->_CI->email->subject('SIMONSTER ALERT');
			    $this->_CI->email->message($this->msgLists());
			    $this->_CI->email->set_mailtype('html');
			    $this->_CI->email->send();
			}
		}
	}
}