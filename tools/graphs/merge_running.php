<?php
function NextEarliestTime($time, $caption, $data) {
	
	for ($i = $time; $i <= $data[$caption]['MAX']; $i++)
		if (isset($data[$caption][$i]))
			return $i;
	return -1;
}


$parent_dir = $argv[1];
if (substr($parent_dir, -1) != '/') $parent_dir = $parent_dir . '/';
$files = scandir($parent_dir);

// SCAN
$data = array();
foreach ($files as $file) {
	if (in_array($file, array('.', '..'))) continue;
	//$temp = file_get_contents($parent_dir . $file);
	$temp = shell_exec('./relative_time.sh ' . $parent_dir . $file);

	$name_tokens = explode("_", $file);
	$caption = $name_tokens[0] . "-" . $name_tokens[1] . "-" . $name_tokens[3];

	$lines = explode("\n", $temp);
	$data[$caption]['MAX'] = 0;
	foreach ($lines as $line) {
		$tokens = explode("\t", $line);
		if (sizeof($tokens) != 2) continue;
		$time = intval($tokens[0]);
		$data[$caption][$time] = floatval($tokens[1]);		
		if ($data[$caption]['MAX'] < $time) $data[$caption]['MAX'] = $time;
	}
}

// PRINT HEADER
echo "Time";
foreach (array_keys($data) as $caption) {
	echo "\t" . $caption;
}
echo "\n";

// MERGE and PRINT
$cursor = 0;
while (true) {

	$max = -1;
	$min = 9223372036854775807;

	$keys = array();
	foreach (array_keys($data) as $caption) {
		$t = NextEarliestTime($cursor, $caption, $data);
		if ($t > $max) $max = $t;
		if ($t >= 0 && $t < $min) $min = $t;
		$keys[$caption] = $t < 0 ? $data[$caption]['MAX'] : $t;
	}

	if ($max == -1) break;
	$cursor = $max + 1;

	echo $min;
	foreach (array_keys($data) as $caption) {
		echo "\t" . $data[$caption][$keys[$caption]];
	}
	echo "\n";
}
?>
