<?php

function call($in)
{
	return c1($in) and c2($in) and c3($in);
}

function c1($in)
{
	for($t = 0; $t <= 5; $t++)
		if(ord($in[$t]) === ord($in[$t + 1]) - 1 and ord($in[$t]) === ord($in[$t + 2]) - 2)
			return true;
	
	return false;
}

function c2($in)
{
	return !preg_match('/[iol]/', $in);
}

function c3($in)
{
	return preg_match('/([a-z])\1[a-z]*([a-z])\2/', $in);
};

function cnext($s)
{
	$sarr = str_split($s);
	for($t = count($sarr) - 1; $t >= 0; $t--)
	{
		$i = ord($sarr[$t]) + 1;
		if($i > 122)
		{
			$i = 97;
			$sarr[$t] = chr($i);
			continue;
		}
		else
		{
			$sarr[$t] = chr($i);
			break;
		}
	}

	return implode('', $sarr);
}

$in = "hxbxwxba";

while(!call($in))
	$in = cnext($in);

echo $in, PHP_EOL;

$in = cnext($in);

while(!call($in))
	$in = cnext($in);

echo $in, PHP_EOL;