<?php

switch($argv[2]) {
	case "cpu":
		$file = 'cpumem_util.log';
		$script = 'cpu_running.sh';
		$column = 2;
	break;
	case "memory":
		$file = 'cpumem_util.log';
		$script = 'cpu_running.sh';
		$column = 3;
	break;
}

//echo "Running $argv[0] ...\n";

$parent_dir = $argv[1];
if (substr($parent_dir, -1) != '/') $parent_dir = $parent_dir . '/';
$servers = scandir($parent_dir);

$stats = array();

function NextEarliestTime($time, $server, $stats) {
	
	for ($i = $time; $i <= $stats[$server]['MAX']; $i++)
		if (isset($stats[$server]['DATA'][$i]))
			return $i;
	return -1;
}


$max_min_time = 0;
foreach ($servers as $server) {
	if (in_array($server, array('.', '..'))) continue;
	$file_path = $parent_dir . $server . '/' . $file;
	if (!file_exists($file_path)) continue;
	
	$temp = shell_exec('./' . $script . ' ' . $file_path . ' | awk \'{ printf $1 "\t" $' . $column . ' "\n" }\'');
	$temp = explode("\n", $temp);
	foreach ($temp as $line) {
		$tokens = explode("\t", $line);
		if (isset($tokens[0]) && isset($tokens[1])) {
			$stats[$server]['DATA'][intval($tokens[0])] = floatval($tokens[1]);
			$stats[$server]['MAX'] = intval($tokens[0]);
			if (!isset($stats[$server]['MIN'])) {
				$stats[$server]['MIN'] = intval($tokens[0]);
				if ($stats[$server]['MIN'] > $max_min_time) $max_min_time = $stats[$server]['MIN'];
			}
		}
	}
}

$min_time = $max_min_time;
while (true) {
	
	$min = 9223372036854775807;
	$max = 0;
	$values = array();
	foreach (array_keys($stats) as $server) {
		$temp = NextEarliestTime($min_time, $server, $stats);
		if ($temp < $min) $min = $temp;
		if ($temp > $max) $max = $temp;
		if ($temp > 0) $values[$server] = $stats[$server]['DATA'][$temp];
	}

	if ($min < 0) break;
	$min_time = $max + 1;

	echo $min; // TIME

	$sum = 0;
	foreach (array_keys($values) as $server) {
		$sum = $sum + $values[$server];
		//echo "\t" . $values[$server];
	}

	echo "\t" . (floatval($sum) / sizeof($values)) . "\n";
}	
?>
