<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function encrypt($string)
{
	/**
	 * 
	 * Ini adalah Method untuk mengenkripsi string data atau pun file dan direktori
	 * 
	 * @param $string akan dienkripsi terlebih dahulu dengan md5(sha256())
	 *
	 * Lalu dipecah menjadi beberapa blok dan diacak
	 *
	 * @return $blok[i]
	 * 
	*/
	$hash  = md5($string);
	$blok1 = substr($hash, 0,8);
	$blok2 = substr($hash, 8,8);
	$blok3 = substr($hash, 16,4);
	$blok4 = substr($hash, 20,4);
	$blok5 = substr($hash, 24,8);

	return base64url_encode($blok2.'-'.$blok4.'-'.$blok5.'-'.$blok3.'-'.$blok1);
}

function verify($string)
{
	/**
	 *
	 * @param $string adalah parameter yang akan dikembalikan nilainya
	 * ke enkripsi md5()
	 *
	 * Sebelum dikembalikan, validasi terlebih dahulu 
	 * string dan panjang karakter dari $string
	 *
	 * Karakter yang diizinkan hanya huruf,angka (0-9), dan dash (-)
	 * dengan panjang karakter 36
	 * 
	 * Jika validasi cocok, maka akan mengembalikan nilai $hash
	 * Jika tidak, maka kembalikan nilai false
	 *
	*/
	$string = preg_replace("/[^a-z0-9\-]/", "", base64url_decode($string));
	if(strlen($string) == 36)
	{
		$hash = explode("-", $string);
		$hash = $hash[4].$hash[0].$hash[3].$hash[1].$hash[2];
		return $hash;
	}
	else
	{
		return false;
	}
}

function random_char($length = 16, $symbol = false)
{
    $chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if($symbol) {
    	$chars .= '~!@#$%^&*()-_+?{}[]<|>?,.';
    }
    return substr(str_shuffle(str_repeat($chars, ceil($length/strlen($chars)) )), 0, $length);
}

/**
 * Encode data to Base64URL
 * @param string $data
 * @return boolean|string
 */
function base64url_encode($data)
{
  // First of all you should encode $data to Base64 string
  $b64 = base64_encode($data);

  // Make sure you get a valid result, otherwise, return FALSE, as the base64_encode() function do
  if ($b64 === false) {
    return false;
  }

  // Convert Base64 to Base64URL by replacing “+” with “-” and “/” with “_”
  $url = strtr($b64, '+/', '-_');

  // Remove padding character from the end of line and return the Base64URL result
  return rtrim($url, '=');
}

/**
 * Decode data from Base64URL
 * @param string $data
 * @param boolean $strict
 * @return boolean|string
 */
function base64url_decode($data, $strict = false)
{
  // Convert Base64URL to Base64 by replacing “-” with “+” and “_” with “/”
  $b64 = strtr($data, '-_', '+/');

  // Decode Base64 string and return the original data
  return base64_decode($b64, $strict);
}