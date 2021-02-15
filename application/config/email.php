<?php defined('BASEPATH') OR exit('No direct script access allowed');

$config = array(
    'protocol' => 'smtp', // 'mail', 'sendmail', or 'smtp'
    'smtp_host' => 'zmsmtp.tangerangkota.go.id', 
    'smtp_port' => 587,
    'smtp_user' => 'govcsirt@tangerangkota.go.id',
    'smtp_pass' => 'tangerangayo2020!@#',
    'smtp_crypto' => 'tls', //can be 'ssl' or 'tls' for example
    'mailtype' => 'text/plan', //plaintext 'text' mails or 'html'
    'smtp_timeout' => '4', //in seconds
    'charset' => 'utf-8',
    'wordwrap' => TRUE
);