<?php defined('BASEPATH') OR exit('No direct script access allowed');

$config = array(
    'protocol' => 'smtp', // 'mail', 'sendmail', or 'smtp'
    'smtp_host' => '', 
    'smtp_port' => '',
    'smtp_user' => '',
    'smtp_pass' => '',
    'smtp_crypto' => 'tls', //can be 'ssl' or 'tls' for example
    'mailtype' => 'text/plan', //plaintext 'text' mails or 'html'
    'smtp_timeout' => '4', //in seconds
    'charset' => 'utf-8',
    'wordwrap' => TRUE
);