<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Detect User Agent
 *
 * Function Description
 *
 * @access	public
 * @param	type	name
 * @return	type	
 */
 
if (! function_exists('ua'))
{
	function ua()
	{
		$CI =& get_instance();
		$CI->load->library('user_agent');

		if ($CI->agent->is_browser())
		{
		        $agent = $CI->agent->browser().' '.$CI->agent->version();
		}
		elseif ($CI->agent->is_robot())
		{
		        $agent = $CI->agent->robot();
		}
		elseif ($CI->agent->is_mobile())
		{
		        $agent = $CI->agent->mobile();
		}
		else
		{
		        $agent = 'Unidentified User Agent';
		}

		return $agent . ' ' .$CI->agent->platform(); // Platform info (Windows, Linux, Mac, etc.)
	}
}

function get_geoip($ip)
{
   $ip = get_real_ip();
   $res = @file_get_contents('https://geo.ipify.org/api/v1?apiKey=at_he6hEP2ikBwmopu9xWjth6j1zL7Nk&ipAddress='.$ip);
   $res = json_decode($res, true);

   	return array(
      	'kota' => empty($res['location']['city']) ? 'localhost' : $res['location']['city'], 
      	'provinsi' => empty($res['location']['region']) ? 'localhost' : $res['location']['region'], 
      	'negara' => empty($res['location']['country']) ? 'localhost' : $res['location']['country'],
      	'isp' => empty($res['as']['name']) ? 'localhost' : $res['as']['name']
   );
}

function get_real_ip()
{
   if(!empty($_SERVER['HTTP_CLIENT_IP']))
   {
      $ip = $_SERVER['HTTP_CLIENT_IP'];
   }
   elseif ( ! empty($_SERVER['HTTP_X_FORWARDED_FOR']))
   {
      $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
   }
   else
   {
      $ip = $_SERVER['REMOTE_ADDR'];
   }
   
   return $ip;
}