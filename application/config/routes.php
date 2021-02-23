<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'login';
$route['dummy'] = 'dashboard/get_dummy';
$route['get-temp/(:any)'] = 'dashboard/get_temp/$1';
$route['get-real-temp/(:any)'] = 'dashboard/get_real_temp/$1';
$route['error/(:num)'] = 'page_error/index/$1';
$route['get-logs'] = 'dashboard/getLogs';
$route['get-logs/(:any)/(:any)'] = 'dashboard/getLogs/$1/$2';
$route['sensor-management'] = 'sensor_management/index';
$route['add-sensor'] = 'sensor_management/add_sensor';
$route['edit-sensor'] = 'sensor_management/edit_sensor';
$route['get-sensor'] = 'sensor_management/get_sensor';
$route['delete-sensor'] = 'sensor_management/delete_sensor'; 
$route['sensor/(:any)'] = 'sensor_data/index/$1';
$route['sensor-data/(:any)'] = 'sensor_data/getData/$1';
$route['sensor-data/(:any)/(:any)/(:any)'] = 'sensor_data/getData/$1/$2/$3';
$route['get-recipient'] = 'notification_recipient/get_recipient';
$route['add-recipient'] = 'notification_recipient/add_recipient';
$route['edit-recipient'] = 'notification_recipient/edit_recipient';
$route['delete-recipient'] = 'notification_recipient/delete_recipient';
$route['add-user'] = 'user_management/add_user';
$route['edit-user'] = 'user_management/edit_user';
$route['get-user'] = 'user_management/get_user';
$route['delete-user'] = 'user_management/delete_user';
$route['activation/(:any)'] = 'login/activation/$1';
$route['add-access'] = 'access_management/add_access';
$route['edit-access'] = 'access_management/edit_access';
$route['get-access'] = 'access_management/get_access';
$route['delete-access'] = 'access_management/delete_access';
$route['go'] = 'login/go';
$route['404_override'] = 'page_error/index';
$route['translate_uri_dashes'] = TRUE;
