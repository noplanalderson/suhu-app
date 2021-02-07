<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function button($button = [], $label = TRUE, $mode = 'a', $attr = NULL)
{
	if(!empty($button))
	{
		if($label)
		{
			return '<'.$mode.' '.$attr.'><i class="'.$button->menu_icon.'"></i> '.$button->menu_label.'</'.$mode.'>';
		}
		else
		{
			return '<'.$mode.' '.$attr.'><i class="'.$button->menu_icon.'"></i></'.$mode.'>';
		}
	}
}