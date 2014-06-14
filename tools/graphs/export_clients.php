<?php
$root_dir = $argv[1];
if (substr($root_dir, -1) != '/') $root_dir .= '/';
$files = scandir($root_dir);

foreach ($files as $file) {
    if (in_array($file, array('.', '..'))) continue;
    if (substr($file, strlen($file) - 4) != '.log') continue;
    $data = file_get_contents($root_dir . $file);
    $lines = explode("\n", $data);

    $time_stat = $lines[sizeof($lines) - 4];
    $success_rate = $lines[sizeof($lines) - 2];

    //$time_stat = explode("\t", $time_stat)[1];
    $success_rate = explode("\t", $success_rate)[1];


    $success = 0;
    $failure = 0;
    $time_taken = 0;


    if (strpos($time_stat, ""))

    echo "$failure\t$success\t$time_taken\n";
}
?>
