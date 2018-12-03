<?php

$data = json_decode(file_get_contents('data/12.txt'), true);
$numbers = 0;

array_walk_recursive($data, function($val, $_) use (&$numbers)
{
	if(is_numeric($val)) $numbers += $val;
});

echo "{$numbers}", PHP_EOL;