<?php
/**
 * Load Caching
 *
 * Load caching if exist
 *
 * @access	public
 * @param	string	index
 * @return	mixed	
 */
 
if (! function_exists('load_cache'))
{
	function load_cache($index = '', $model = '', $method = '', $value = NULL, $expire = 3600)
	{
		$CI =& get_instance();
		$value = (is_null($value) || !is_array($value)) ? [$value] : $value;

		if($model !== 'site_m') {
			$CI->load->model($model);
		}

		if($CI->cache->memcached->get($index))
		{
			$object = $CI->cache->memcached->get($index);
		}
		else
		{
			$object = call_user_func_array([$CI->$model, $method], $value);
			$CI->cache->memcached->save($index, $object, $expire);
		}

		return $object;
	}
}