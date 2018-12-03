<?php

$input = explode("\n", file_get_contents('data/7.txt'));
$values = [];

while(!isset($values['a']))
{
    foreach($input as $s)
    {
        if(preg_match('/([0-9a-z]*?)[ ]{0,1}([A-Z]*?)[ ]{0,1}([a-z0-9]+?) -> ([a-z]+)$/', $s, $matches))
        {
            $leftmost  = $matches[1];
            $command   = $matches[2];
            $rightmost = $matches[3];
            $output    = $matches[4];

            $leftmost  = $values[$leftmost]  ?? (is_numeric($leftmost)  ? (int) $leftmost  : null);
            $rightmost = $values[$rightmost] ?? (is_numeric($rightmost) ? (int) $rightmost : null);

            if($rightmost === null)
                continue;

            switch ($command)
            {
                case '':
                {
                    $values[$output] = $rightmost;
                        
                    break;
                }
                case 'NOT':
                {
                    $values[$output] = ~$rightmost;

                    break;
                }
                default:
                {
                    if($leftmost === null)
                       continue;

                    switch ($command)
                    {
                        case 'AND':
                        {
                            $values[$output] = $leftmost & $rightmost;

                            break;
                        }
                        case 'OR':
                        {
                            $values[$output] = $leftmost | $rightmost;

                            break;
                        }
                        case 'LSHIFT':
                        {
                            $values[$output] = $leftmost << $rightmost;

                            break;
                        }
                        case 'RSHIFT':
                        {
                            $values[$output] = $leftmost >> $rightmost;

                            break;
                        }
                        default:
                            die('InvalidOP');
                    }
                }  
            }

            if(isset($values[$output]))
                $values[$output] = $values[$output] < 0 ? 65536 + $values[$output] : $values[$output];
        }
    }
}

echo $values['a'], PHP_EOL;
