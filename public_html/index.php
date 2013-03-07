<?php
// MySQL
$mysqli = new mysqli('localhost', 'root', 'root');

$mysql_running = true;
if (mysqli_connect_errno()) {
    $mysql_running = false;
} else {
	$mysql_version = $mysqli->server_version;
}

$mysqli->close();

// Memcached
$m = new Memcached();
$memcached_running = false;
if ($m->addServer('localhost', 11211)) {
	$memcached_running = true;
	$memcached_version = $m->getVersion();
	$memcached_version = current($memcached_version);
}
?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Vagrant LAMP stack</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet" />
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
	<style type="text/css">
	html, body {
		height: 100%;
	}
	#wrap {
		min-height: 100%;
		height: auto !important;
		height: 100%;
		margin: 0 auto -60px;
	}
	#push, #footer {
		height: 60px;
	}
	#footer {
		background-color: #f5f5f5;
	}
	@media (max-width: 767px) {
		#footer {
			margin-left: -20px;
			margin-right: -20px;
			padding-left: 20px;
			padding-right: 20px;
		}
	}
	.container {
		width: auto;
		max-width: 680px;
	}
	.container .credit {
		margin: 20px 0;
	}
	.page-header i {
		float: left;
		margin-top: -5px;
		margin-right: 12px;
	}
	table td:first-child {
		width: 300px;
	}
    </style>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<div class="page-header">
				<i class="icon-lightbulb icon-4x"></i>
				<h1>It works!</h1>
			</div>
			<p class="lead">The Virtual Machine is up and running, yay! Here's some additional information you might need.</p>

			<h3>Installed software</h3>
			<table class="table table-striped">
				<tr>
					<td>PHP Version</td>
					<td><?php echo phpversion(); ?></td>
				</tr>

				<tr>
					<td>MySQL running</td>
					<td><i class="icon-<?php echo ($mysql_running ? 'ok' : 'remove'); ?>"></i></td>
				</tr>

				<tr>
					<td>MySQL version</td>
					<td><?php echo ($mysql_running ? $mysql_version : 'N/A'); ?></td>
				</tr>

				<tr>
					<td>Memcached running</td>
					<td><i class="icon-<?php echo ($memcached_running ? 'ok' : 'remove'); ?>"></i></td>
				</tr>

				<tr>
					<td>Memcached version</td>
					<td><?php echo ($memcached_version ? $memcached_version : 'N/A'); ?></td>
				</tr>
			</table>

			<h3>PHP Modules</h3>
			<table class="table table-striped">
				<tr>
					<td>MySQL</td>
					<td><i class="icon-<?php echo (class_exists('mysqli') ? 'ok' : 'remove'); ?>"></i></td>
				</tr>

				<tr>
					<td>CURL</td>
					<td><i class="icon-<?php echo (function_exists('curl_init') ? 'ok' : 'remove'); ?>"></i></td>
				</tr>

				<tr>
					<td>mcrypt</td>
					<td><i class="icon-<?php echo (function_exists('mcrypt_encrypt') ? 'ok' : 'remove'); ?>"></i></td>
				</tr>

				<tr>
					<td>memcached</td>
					<td><i class="icon-<?php echo (class_exists('Memcached') ? 'ok' : 'remove'); ?>"></i></td>
				</tr>

				<tr>
					<td>gd</td>
					<td><i class="icon-<?php echo (function_exists('imagecreate') ? 'ok' : 'remove'); ?>"></i></td>
				</tr>
			</table>

			<h3>MySQL credentials</h3>
			<table class="table table-striped">
				<tr>
					<td>Hostname</td>
					<td>localhost</td>
				</tr>

				<tr>
					<td>Username</td>
					<td>root</td>
				</tr>

				<tr>
					<td>Password</td>
					<td>root</td>
				</tr>

				<tr>
					<td colspan="2"><em>Note: External access is enabled! Just use <strong><?php echo $_SERVER['SERVER_ADDR'] ?></strong> as host.</em></td>
				</tr>
			</table>
		</div>

		<div id="push"></div>
	</div>

	<div id="footer">
		<div class="container">
			<p class="muted credit"><a href="https://github.com/MiniCodeMonkey/Vagrant-LAMP-Stack" target="_blank">Vagrant LAMP Stack</a> by <a href="https://github.com/MiniCodeMonkey" traget="_blank">Code Monkey</a>.</p>
		</div>
	</div>
</body>
</html>
