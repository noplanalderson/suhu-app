<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title><?= $title ?></title>

	<!-- App favicon -->

	<?= show_image('sites/'.$this->app->app_icon, 'icon', 'rel="icon" type="image/png" sizes="16x16"') ?>
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<?= css('google-fonts') ?>

	<!-- CSS -->
	<?= css('core.min') ?>

	<?= css('style.min') ?>
	
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
		.dataTables_wrapper .dt-buttons {
		  float:none;  
		  text-align:center;
		}
	</style>
</head>
<body>