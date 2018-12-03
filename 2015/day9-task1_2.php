<?php

function permutations(array $elements)
{
    if (count($elements) <= 1)
    {
        yield $elements;
    }
    else
    {
        foreach (permutations(array_slice($elements, 1)) as $permutation)
        {
            foreach (range(0, count($elements) - 1) as $i)
            {
                yield array_merge(
                    array_slice($permutation, 0, $i),
                    [$elements[0]],
                    array_slice($permutation, $i)
                );
            }
        }
    }
}

preg_match_all('/(\w+) to (\w+) = (\d+)/', file_get_contents('data/9.txt'), $matches);
$found = count($matches[0]);
$from  = $matches[1];
$to    = $matches[2];
$dist  = $matches[3];

for($i = 0; $i < $found; $i++)
{
    if(!$destinations[$from[$i]])
        $destinations[$from[$i]] = [];

    if(!$destinations[$to[$i]])
        $destinations[$to[$i]] = [];

    $destinations[$from[$i]][$to[$i]] = $dist[$i];
    $destinations[$to[$i]][$from[$i]] = $dist[$i];
}

$possible_routes = [];

foreach(permutations(array_keys($destinations)) as $result)
{
    $d = 0;

    for($i = 0; $i < count($result); )
    {
        $d +=  $result[++$i] ? $destinations[$result[$i - 1]][$result[$i]] : 0;
    }

    $possible_routes[implode(' -> ', $result)] = $d;
}

echo max($possible_routes), PHP_EOL;
echo min($possible_routes), PHP_EOL;