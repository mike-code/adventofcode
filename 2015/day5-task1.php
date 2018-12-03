<?php

$f = file_get_contents('data/5.txt');
$nice = 0;

foreach (explode("\n", $f) as $s) 
    if(!preg_match('/(ab|cd|pq|xy)/', $s))
        if(preg_match('/([a-z])\1/', $s))
            if(strlen(preg_replace('/[^aeiou]/', '', $s)) >= 3)
                $nice++;

echo $nice, PHP_EOL;