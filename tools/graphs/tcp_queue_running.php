<?php
$data = file_get_contents($argv[1]);
$lines = explode("\n", $data);

foreach ($lines as $line) {
    $tokens = explode(" ", $line);
    if (sizeof($tokens) != 9) continue;
    $date = $tokens[0];
    for ($i = 1; $i < 6; $i++)
        $date .= ' ' . $tokens[$i];
    $timestamp = strtotime($date);
    $value = intval($tokens[8]);
    echo "$timestamp\t$value\n";
}
?>
