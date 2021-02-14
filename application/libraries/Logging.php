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
		$this->_CI->load->model('dashboard_m');
	}

	/**
	 * Initialize preferences
	 *
	 * @param	array	$config
	 * @param	bool	$reset
	 * @return	Secure_upload
	 */
	public function initialize(array $config = array())
	{
		foreach ($config as $key => $value) {
			$this->$key = $value;
		}
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

		$status = 'NORMAL';
		
		$color = 'text-success';

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
		
		return $this->messages($status, $color);
	}

	private function messages($status, $color)
	{
		$msg = "<p class='".$color."'><b>[".$status."]</b> ".$this->item." at ".$this->location." (".$this->value.$this->unit.")</p>";

		if($status == 'WARNING' || $status == 'CRITICAL')
		{
			$this->_CI->dashboard_m->insertLog(['timestamp' => $this->timestamp, 'message' => $msg]);
		}

		return $msg;
	}
}