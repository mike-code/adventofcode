<?php

$data = json_decode(file_get_contents('data/12.txt'));
$numbers = 0;

function remove_reds(&$o)
{
	foreach($o as &$item)
	{
		if(is_object($o) and $item === 'red')
		{
			$o = null;
			break;
		}

		if(is_object($item) || is_array($item))
			remove_reds($item);
	}
}

remove_reds($data);

$data = json_decode(json_encode($data), true);

array_walk_recursive($data, function($val, $_) use (&$numbers)
{
	if(is_numeric($val)) $numbers += $val;
});

echo "{$numbers}", PHP_EOL;