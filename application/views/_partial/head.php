<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title><?= $title ?></title>

	<!-- Site favicon -->
	<?= show_image('onelove-icon-180x180.png', 'icon', 'rel="apple-touch-icon" sizes="180x180"') ?>

	<?= show_image('onelove-icon-32x32.png', 'icon', 'rel="icon" type="image/png" sizes="32x32"') ?>

	<?= show_image('onelove-icon-16x16.png', 'icon', 'rel="icon" type="image/png" sizes="16x16"') ?>
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<?= css('google-fonts') ?>

	<!-- CSS -->
	<?= css('core') ?>

	<?= css('style') ?>
	
	<?= css('icon-font.min') ?>
	
	<?php $this->_CI->load_css() ?>
	
	<?php $this->_CI->load_css_plugin() ?>

	<style>
		hr.styled {
			border: 0;
			height: 1px;
			background: #333;
			background-image: -webkit-linear-gradient(left, #ccc, #333, #ccc);
			background-image: -moz-linear-gradient(left, #ccc, #333, #ccc);
			background-image: -ms-linear-gradient(left, #ccc, #333, #ccc);
			background-image: -o-linear-gradient(left, #ccc, #333, #ccc);
		}
	</style>
</head>
<body>