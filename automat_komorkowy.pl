#!/usr/bin/perl
#Magdalena Żabińska, Informatyka Stosowana I rok, grupa lab. 14
#Wydział Inżynierii Metali i Informatyki Przemysłowej
#Automaty komórkowe jednowymiarowe. 

sub numer
{
	print "Podaj numer reguły od 0 do 255.";
	print "\n";
	chomp ($regula=<STDIN>);
	@tablica=(0, 0, 0, 0, 0, 0, 0, 0);
	@temp=(0, 0, 0, 0, 0, 0, 0, 0);
	for ($i=0; $i<8; $i++)
	{
		if ($regula%2==1)
		{
			$tablica[$i]=1;
			$temp[$i]=1;	
		}
		$regula=$regula/2;
	}
	for($i=0; $i<8; $i++)
	{
		$a=$tablica[$i];
		$tablica[$i]=$temp[7-$i];
		$temp[7-$i]=$a;
	}
	for($i=0; $i<8; $i++)
	{
		print $tablica[$i];
	}

	print "\n";
}
&numer();
sub jak_wyswietlic
{
	if($tablica[0]==1) #111
		{
			for($n=1; $n<7; $n++)
			{
				if($tablica1[7]==1 && $tablica1[0]==1 && $tablica1[1]==1)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==1 && $tablica1[$n]==1 && $tablica1[$n+1]==1)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[6]==1 && $tablica1[7]==1 && $tablica1[0]==1)
					{
						$tablica2[7]=1;
					}
			}
		}

	if($tablica[1]==1) #110
		{
			for($n=1; $n<7; $n++)
			{
				if($tablica1[7]==1 && $tablica1[0]==1 && $tablica1[1]==0)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==1 && $tablica1[$n]==1 && $tablica1[$n+1]==0)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[6]==1 && $tablica1[7]==1 && $tablica1[0]==0)
					{
						$tablica2[7]=1;
					}
			}
		}

	if($tablica[2]==1) #101
		{
			for($n=1; $n<7; $n++)
			{
				if($tablica1[7]==1 && $tablica1[0]==0 && $tablica1[1]==1)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==1 && $tablica1[$n]==0 && $tablica1[$n+1]==1)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[6]==1 && $tablica1[7]==0 && $tablica1[0]==1)
					{
						$tablica2[7]=1;
					}
			}
		}

	if($tablica[3]==1) #100
		{
			for($n=1; $n<7; $n++)
			{
				if($tablica1[7]==1 && $tablica1[0]==0 && $tablica1[1]==0)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==1 && $tablica1[$n]==0 && $tablica1[$n+1]==0)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[6]==1 && $tablica1[7]==0 && $tablica1[0]==0)
					{
						$tablica2[7]=1;
					}
			}
		}

	if($tablica[4]==1) #011
		{
			for($n=1; $n<7; $n++)
			{
				if($tablica1[7]==0 && $tablica1[0]==1 && $tablica1[1]==1)
				{
					$tablica2[0]=1;
				}
				if($tablica1[$n-1]==0 && $tablica1[$n]==1 && $tablica1[$n+1]==1)
				{
					$tablica2[$n]=1;
				}
				if($tablica1[6]==0 && $tablica1[7]==1 && $tablica1[0]==1)
				{
					$tablica2[7]=1;
				}
			}
		}

	if($tablica[5]==1) #010
		{
			for($n=1; $n<7; $n++)
			{
				if($tablica1[7]==0 && $tablica1[0]==1 && $tablica1[1]==0)
				{
					$tablica2[0]=1;
				}
				if($tablica1[$n-1]==0 && $tablica1[$n]==1 && $tablica1[$n+1]==0)
				{
					$tablica2[$n]=1;
				}
				if($tablica1[6]==0 && $tablica1[7]==1 && $tablica1[0]==0)
				{
					$tablica2[7]=1;
				}
			}
		}

	if($tablica[6]==1) #001
		{
			for($n=1; $n<7; $n++)
			{
				if($tablica1[7]==0 && $tablica1[0]==0 && $tablica1[1]==1)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==0 && $tablica1[$n]==0 && $tablica1[$n+1]==1)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[6]==0 && $tablica1[7]==0 && $tablica1[0]==1)
					{
						$tablica2[7]=1;
					}
			}
		}

	if($tablica[7]==1) #000
		{
		for($n=1; $n<7; $n++)
			{
				if($tablica1[7]==0 && $tablica1[0]==0 && $tablica1[1]==0)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==0 && $tablica1[$n]==0 && $tablica1[$n+1]==0)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[6]==0 && $tablica1[7]==0 && $tablica1[0]==0)
					{
						$tablica2[7]=1;
					}
			}
		}
}

sub wyswietl_nowa
{
	for($j=0; $j<8; $j++)
	{
		print $tablica2[$j];
	}
}

sub nowa_linia
{
	for ($m = 0; $m < 8; $m++)			#Zamiana drugiej tablicy w pierwszą, wyzerowanie nowej tablicy
	{
		$tablica1[$m] = $tablica2[$m];
		$tablica2[$m] = '.';
	}
}

@tablica1 = ('.', '.', 1, '.', '.', '.', '.', '.');
@tablica2 = ('.', '.', '.', '.', '.', '.', '.', '.');
for ($i = 0; $i < 8; $i++) 			#wyświetlenie zalążka
	{
		print $tablica1[$i];
	}
	print "\n";

$licznik=8;
while($licznik)
{
	&jak_wyswietlic();
	&wyswietl_nowa();
	&nowa_linia();
	$licznik--;
}
