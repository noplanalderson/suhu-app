<?php
/**
 * Cronjob Manager
 *
 * This library is used to retrieve the latest data from the temperature sensor 
 * periodically using the cron daemon.
 * 
 * The cron daemon is a service that runs on all Unix and Linux distributions. 
 * This service is specifically designed to execute an order at a specified time. 
 * This task, known as cronjobs, is a fundamental thing that every System Administrator must understand. 
 * Cronjobs are very useful for automating scripts so that they can be run at certain times.
 *
 * Crontab parameter
 * # m h dom mon dow command
 *
 * m - Minute (minutes) - 0 to 59
 * h - Hour (hour) - 0 to 23
 * dom - Day of Month (date) - 0 to 31
 * mon - Month (month) - 0 to 12
 * dow - Day of Week (number of days) - 0 to 7 (0 and 7 are days of the week)
 *
 * 
 * @package Suhu App
 * @author Nikola Malich, Muhammad Ridwan Na'im (@__debu_semesta)
 * @source https://code.tutsplus.com/tutorials/managing-cron-jobs-with-php--net-19428
 * 
 */
defined('BASEPATH') OR exit('No direct scrit access allowed');

class Cronjob
{
	public $path = FCPATH . 'scheduler/';

	public $handle = 'crontab.txt';

	public $scheduler = '1 * * * *';

	public $script_file = '';

	public $bin = '/bin/bash';

	public $cron_file;
	
	public $script;

	public function __construct(array $config = [])
	{
		if(!empty($config))
		{
			foreach ($config as $key => $value) {
				$this->$key = $value;
			}
		}
		$this->cron_file = "{$this->path}{$this->handle}";
	}

    public function exec()
	{
	    $argument_count = func_num_args();
	 
	    try
	    {
	        if ( ! $argument_count) throw new Exception("There is nothing to execute, no arguments specified.");
	 
	        $arguments = func_get_args();
	 
	        $command_string = ($argument_count > 1) ? implode(" && ", $arguments) : $arguments[0];
	 		
	 		exec($command_string);
	    }
	    catch (Exception $e)
	    {
	        $this->error_message($e->getMessage());
	    }
	 
	    return $this;
	}

	public function create_script()
	{
		if(!file_exists($this->path . $this->script_file)) $this->error_message('Script Required!');

		if(!preg_match("/^(((0|[1-5]?[0-9])|[\*]{1}) ((0|[1]?[1-9]|2[0-3])|[\*]{1}) ((1|[1-2]?[0-9]|3[0-1])|[\*]{1}) ((1|[1]?[0-2])|[\*]{1}) ([0-7]{1}|[\*]{1}))$/", $this->scheduler))
		{
			$this->scheduler = '0 * * * *';
		}

		$script_file 	= explode('.', $this->path . $this->script_file);
		$extension 		= end($script_file);

		switch ($extension) {
			case 'sh':
				$this->bin = '/bin/bash';
				break;
			
			case 'php':
				$this->bin = '/usr/bin/php';
				break;

			default:
				$this->error_message('Script Extension not Allowed!');
				break;
		}

		$this->script = $this->scheduler . ' ' . $this->bin . ' ' . $this->path . $this->script_file . ' >/dev/null 2>&1';
	}

	public function write_to_file($path = NULL, $handle = NULL)
	{
	    if ( ! $this->crontab_file_exists())
	    {   
	        $this->handle = (is_null($handle)) ? $this->handle : $handle;
	        $this->path   = (is_null($path))   ? $this->path   : $path;
	 
	        $this->cron_file = "{$this->path}{$this->handle}";
	 
	        $init_cron = "crontab -l > {$this->cron_file} && [ -f {$this->cron_file} ] || > {$this->cron_file}";
	 
	        $this->exec($init_cron);

	    }
	 
	    return $this;
	}

	public function remove_file()
	{
	    if ($this->crontab_file_exists()) $this->exec("rm {$this->cron_file}");
	 
	    return $this;
	}
 
	public function append_cronjob()
	{
	    // if (is_null($cron_jobs)) $this->error_message("Nothing to append!  Please specify a cron job or an array of cron jobs.");
	     
	    $append_cronfile = "echo '";        
	     
	    // $append_cronfile .= (is_array($cron_jobs)) ? implode("\n", $cron_jobs) : $cron_jobs;
	    $append_cronfile .= $this->script;
	     
	    $append_cronfile .= "'  >> {$this->cron_file}";
	     
	    $install_cron = "crontab {$this->cron_file}";
	 
	    $this->write_to_file()->exec($append_cronfile, $install_cron)->remove_file();
	     
	    return $this;
	}
 
	public function remove_cronjob($cron_jobs = NULL)
	{
	    if (is_null($cron_jobs)) $this->error_message("Nothing to remove!  Please specify a cron job or an array of cron jobs.");

	    $this->write_to_file();
	 
	    $cron_array = file($this->cron_file, FILE_IGNORE_NEW_LINES);
	     
	    if (empty($cron_array)) $this->error_message("Nothing to remove!  The cronTab is already empty.");
	     
	    $original_count = count($cron_array);
	     
	    if (is_array($cron_jobs))
	    {
	        foreach ($cron_jobs as $cron_regex) $cron_array = preg_grep($cron_regex, $cron_array, PREG_GREP_INVERT);
	    }
	    else
	    {
	        $cron_array = preg_grep($cron_jobs, $cron_array, PREG_GREP_INVERT);
	    }   
	     
	    return ($original_count === count($cron_array)) ? $this->remove_file() : $this->remove_crontab()->append_cronjob($cron_array);
	}

    public function check_cron($cron_jobs = NULL)
    {
        if (is_null($cron_jobs)) $this->error_message("Nothing to remove!  Please specify a cron job or an array of cron jobs.");

        $this->write_to_file();

        $cron_array = file($this->cron_file, FILE_IGNORE_NEW_LINES);
     
        if(!empty($cron_array)) {
            return true;
        }
    }

	public function remove_crontab()
	{
	    $this->exec("crontab -r")->remove_file();
	     
	    return $this;
	}
 
	private function crontab_file_exists()
	{
	    return file_exists($this->cron_file);
	}
 
	private function error_message($error)
	{
	    die("<pre style='color:#EE2711'>ERROR: {$error}</pre>");
	}
}