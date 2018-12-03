<?php

$result = 0;
$f = explode("\n", file_get_contents('data/6.txt'));
$theArray = array_fill(0, 1000, array_fill(0, 1000, false));

foreach ($f as $row)
{
    if(preg_match('/^([a-z ]+?) (\d+?),(\d+?) through (\d+?),(\d+?)$/', $row, $match))
    {
        $command = $match[1];
        $x1      = $match[2];
        $x2      = $match[4];
        $y1      = $match[3];
        $y2      = $match[5];

        for($x = $x1; $x <= $x2; $x++)
            for($y = $y1; $y <= $y2; $y++)
                switch ($command)
                {
                    case 'toggle':
                        $theArray[$x][$y] = !$theArray[$x][$y];
                        break;
                    
                    case 'turn off':
                        $theArray[$x][$y] = false;
                        break;

                    case 'turn on':
                        $theArray[$x][$y] = true;
                        break;

                    default:
                        die('ouch');
                }
    }
    else
        die('ughh');
}

foreach ($theArray as $x)
    foreach ($x as $y)
        if($y)
            $result++;

echo $result, PHP_EOL;
