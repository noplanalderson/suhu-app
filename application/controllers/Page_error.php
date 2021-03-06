<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Page_error extends SIMONSTER_Core {

	public function __construct()
	{
		parent::__construct();

		$this->_partial = array(
			'head',
			'body',
			'script'
		);
	}

	public function index($error = NULL)
	{	
		$this->_module 	= 'error/error';
		$heading		= $error;

		switch ($error) {
			case '403':
				$this->output->set_status_header(403);
				
				$title 			= 'Access Denied';
				$message 		= 'You\'re not allowed to access this page. Get outta here!';
				break;
			
			case '405':
				$this->output->set_status_header(405);
				
				$title 			= 'Illegal Method';
				$message 		= 'You\' using illegal method to loggin into system.<br/>If you feel this a mistake, try to clear cookie or cache in your browser.';
				break;

			default:
				$this->output->set_status_header(404);

				$heading		= '404';
				$title 			= 'Page not Found';
				$message 		= 'Requested page not found or was removed.';
				break;
		}

		$this->_data 	= array(
			'title'	  => $title,
			'heading' => $heading,
			'message' => $message
		);

		$this->load_view();
	}
}
