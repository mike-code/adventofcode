<?php
require_once './lib/libpermute.php';

preg_match_all('/([A-Za-z]+) .+ (gain|lose) ([0-9]+) .+ to ([A-Za-z]+)/', file_get_contents('data/13.txt'), $data);

function D($names)
{
    global $data;
    $distances = array_fill_keys($names, array_fill_keys($names, 0));
    $possible  = [];

    for($x = 0; $x < count($data[0]); $x++)
    {
        $distances[$data[1][$x]][$data[4][$x]] += $data[2][$x] === 'gain' ? +$data[3][$x] : -$data[3][$x];
        $distances[$data[4][$x]][$data[1][$x]] += $data[2][$x] === 'gain' ? +$data[3][$x] : -$data[3][$x];
    }

    foreach(permutations($names) as $result)
    {
        $d = 0;

        for($i = 0; $i < count($result); )
        {
            $d +=  $result[++$i] ? $distances[$result[$i - 1]][$result[$i]] : $distances[$result[$i - 1]][$result[0]];
        }

        $possible[] = $d;
    }

    return $possible;
}

$names = array_values(array_unique($data[1]));
echo max(D($names)), PHP_EOL;
$names[] = 'satan';
echo max(D($names)), PHP_EOL;
