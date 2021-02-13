<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logging
{
	public $item = 'Temperature';

	public $value = 0;

	public $timestamp = '';

	public $location = '';

	public $unit = '';

	public $critical_range = array(
		'bottom' => 10,
		'top' => 90
	);

	public $warn_range = array(
		'bottom' => [11,20],
		'top' => [61,80]
	);

	protected $status;

	protected $color;

	protected $_CI;

	public function __construct($config = array())
	{
		empty($config) OR $this->initialize($config);
		$this->_CI = get_instance();

		$this->_CI->load->library('email');
		$this->_CI->load->model('dashboard_m');
	}

	/**
	 * Initialize preferences
	 *
	 * @param	array	$config
	 * @param	bool	$reset
	 * @return	Secure_upload
	 */
	public function initialize(array $config = array(), $reset = TRUE)
	{
		$reflection = new ReflectionClass($this);

		if ($reset === TRUE)
		{
			$defaults = $reflection->getDefaultProperties();
			foreach (array_keys($defaults) as $key)
			{
				if ($key[0] === '_')
				{
					continue;
				}

				if (isset($config[$key]))
				{
					if ($reflection->hasMethod('set_'.$key))
					{
						$this->{'set_'.$key}($config[$key]);
					}
					else
					{
						$this->$key = $config[$key];
					}
				}
				else
				{
					$this->$key = $defaults[$key];
				}
			}
		}
		else
		{
			foreach ($config as $key => &$value)
			{
				if ($key[0] !== '_' && $reflection->hasProperty($key))
				{
					if ($reflection->hasMethod('set_'.$key))
					{
						$this->{'set_'.$key}($value);
					}
					else
					{
						$this->$key = $value;
					}
				}
			}
		}

		return $this;
	}

	public function checkValue()
	{
		if(is_array($this->critical_range))
		{
			$cr_bottom 	= isset($this->critical_range['bottom']) ? $this->critical_range['bottom'] : 10;
			$cr_top 	= isset($this->critical_range['top']) ? $this->critical_range['top'] : 90;
			$this->critical_range = array('bottom' => $cr_bottom, 'top' => $cr_top);
		}
		else
		{
			$this->critical_range = array(
				'bottom' => 10,
				'top' => 90
			);
		}

		if(is_array($this->warn_range))
		{
			$wr_bottom 	= is_array($this->warn_range['bottom']) ? $this->warn_range['bottom'] : [11,20];
			$wr_top 	= is_array($this->warn_range['top']) ? $this->warn_range['top'] : [61,80];
			$this->warn_range = array('bottom' => $wr_bottom, 'top' => $wr_top);
		}
		else
		{
			$this->warn_range = array(
				'bottom' => [11,20],
				'top' => [61,80]
			);
		}

		$status = '';
		
		$color = '';

		if($this->value <= $this->critical_range['bottom'] || $this->value >= $this->critical_range['top'])
		{
			$status = 'CRITICAL';
			$color = 'text-danger';
		}

		if(($this->value >= $this->warn_range['bottom'][0] && $this->value <= $this->warn_range['bottom'][1]) || ($this->value >= $this->warn_range['top'][0] && $this->value <= $this->warn_range['top'][1]))
		{
			$status = 'WARNING';
			$color = 'text-warning';
		}

		return ['status' => $status, 'color' => $color];
	}

	public function messages($status, $color)
	{
		$msg = "<p class='".$color."'><b>[".$status."]</b> ".$this->item." at ".$this->location." (".$this->value.$this->unit.")</p>";

		if($status == 'CRITICAL' || $status == 'WARNING') {
			$this->_CI->dashboard_m->insertLog(['timestamp' => $this->timestamp, 'message' => $msg]);
		}

		return ['status' => $status, 'message' => $msg];
	}

	public function sendLogToEmail($logs = array())
	{
		$from = $this->_CI->config->item('smtp_user');

		$list = $this->_CI->dashboard_m->getEmails();

		for ($i = 0; $i < count($logs); $i++) {
			
			if($logs[$i]['status'] == 'CRITICAL' || $logs[$i]['status'] == 'WARNING')
			{
				foreach ($list as $name => $address)
				{
				    $this->_CI->email->clear();

				    $this->_CI->email->to($address);
				    $this->_CI->email->set_newline("\r\n");
				    $this->_CI->email->from($from);
				    $this->_CI->email->subject('SIMONSTER ALERT');
				    $this->_CI->email->message(implode('<br/>', $logs[$i]['message']));
				    $this->_CI->email->set_mailtype('html');
				    $this->_CI->email->send();
				}
			}
		}
	}
}