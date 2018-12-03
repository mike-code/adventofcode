<?php

ini_set('memory_limit', -1);

function bbb($i)
{
    $str = '3113322113';

    while($i-- > 0)
    {
        $current = '';
        $result = '';
        $counter = 0;

        foreach(str_split($str) as $char)
        {
            if($char != $current)
            {
                if(!empty($current))
                    $result .= "{$counter}{$current}";

                $counter = 0;
                $current = $char;
            }

            $counter++;
        }

        $str = $result . "{$counter}{$current}";
    }

    return $str;
}

echo strlen(bbb(40)), PHP_EOL;
echo strlen(bbb(50)), PHP_EOL;
