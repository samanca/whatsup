<?php
$root_dir = $argv[1];
if (substr($root_dir, -1) != '/') $root_dir .= '/';
$files = scandir($root_dir);

$stats = array();
foreach ($files as $file) {
	if (in_array($file, array('.', '..'))) continue;
	if (substr($file, strlen($file) - 4) == '.err') continue;
	$content = file_get_contents($root_dir . $file);
	$lines = explode("\n", $content);
	
	$succ = 0;
	$fail = 0;

	$time = $lines[sizeof($lines) - 4];
	if (strpos($time, "\t") !== FALSE) {
		$time = 0;
	}
	else {
		$temp = explode("\t", $lines[sizeof($lines) - 2]);
		$temp = explode(' - ', $temp[1]);
		$total = intval(substr($temp[1], 7));
		$fail = intval(substr($temp[0], 10));
		$succ = $total - $fail;
		$time = substr($time, 12);
		$time = substr($time, 0, strpos($time, 'ms'));
	}
	$caption = substr($file, 0, strpos($file, ".log"));
	echo "$caption\t";
	echo "$fail\t";
	echo "$succ\t";
	echo "$time\n";
	$stats[$file] = array(
		'succ' => $succ,
		'fail' => $fail,
		'time' => $time,
	);
}

$count = 0;
$succ = 0;
$fail = 0;
$time = 0;
$cfail = 0;
foreach($stats as $row) {
	if ($row['time'] > 0) {
		$count++;
		$succ += $row['succ'];
		$fail += $row['fail'];
		$time += $row['time'];
	}
	else {
		$cfail++;
	}	
}

echo "M/sec\t" . ($succ / floatval($time) * 1000) . "\n";
echo "Total\t" . ($succ + $fail) . "\n";
echo "Failure Rate\t" . (floatval($fail) / ($succ + $fail)) . "\n";
echo "Client Failures\t" . $cfail . "\n";
?>
