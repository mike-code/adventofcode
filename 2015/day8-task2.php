<?php

$input = explode("\n", file_get_contents('data/8.txt'));
array_walk($input, function(&$in) { $new = addslashes($in); $in = strlen($new) + 2 - strlen($in); });
echo array_reduce($input, function($carry, $v) { return $carry + $v; }, 0), PHP_EOL;