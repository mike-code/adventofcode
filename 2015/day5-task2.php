<?php

$f = file_get_contents('data/5.txt');
$nice = 0;

foreach (explode("\n", $f) as $s) 
    if(preg_match('/([a-z]{2}).*?\1/', $s))
        if(preg_match('/([a-z]{1})[a-z]{1}\1/', $s))
            $nice++;

echo $nice, PHP_EOL;