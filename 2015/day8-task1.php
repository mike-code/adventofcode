<?php

$input = explode("\n", file_get_contents('data/8.txt'));
array_walk($input, function(&$in) { eval("\$new = {$in};"); $in = strlen($in) - strlen($new); });
echo array_reduce($input, function($carry, $v) { return $carry + $v; }, 0), PHP_EOL;