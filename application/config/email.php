<?php defined('BASEPATH') OR exit('No direct script access allowed');

$config = array(
    'protocol' => '', // 'mail', 'sendmail', or 'smtp'
    'smtp_host' => '', 
<<<<<<< HEAD
    'smtp_port' => 587,
=======
    'smtp_port' => '',
>>>>>>> c8887c460213dbaabde5c08c6eb2caec6475fd6e
    'smtp_user' => '',
    'smtp_pass' => '',
    'smtp_crypto' => 'tls', //can be 'ssl' or 'tls' for example
    'mailtype' => 'text/plan', //plaintext 'text' mails or 'html'
    'smtp_timeout' => '4', //in seconds
    'charset' => 'utf-8',
    'wordwrap' => TRUE
);