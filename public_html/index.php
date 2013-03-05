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
    </style>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<div class="page-header">
				<i class="icon-lightbulb icon-4x"></i>
				<h1>It works!</h1>
			</div>
			<p class="lead">The Virtual Machine is up and running, yay! Here's some additional software info.</p>

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
