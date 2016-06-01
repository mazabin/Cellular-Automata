#!/usr/bin/perl
#Magdalena Żabińska, Informatyka Stosowana I rok, grupa lab. 46
#Wydział Inżynierii Metali i Informatyki Przemysłowej
#Automaty komórkowe jednowymiarowe. 

sub numer_reguly 						#wprowadzenie przez uzytkownika numeru reguly i dec2bin
{

	if(@ARGV!=0)
	{
		$regula=$ARGV[0];
	}
	else
	{

		print "Podaj numer reguły od 0 do 255.";
		print "\n";
		chomp ($regula=<STDIN>);
		until ($regula<=255 && $regula>=0)
		{
			print "Podales numer spoza zakresu! Podaj numer reguly od 0 do 255.\n";
			chomp ($regula=<STDIN>);
		}
	}
	until ($regula =~ m{^\d+$}o)
		{	
			print "Reguła musi być liczbą!\n";
			chomp($regula=<STDIN>);
		}
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
	print "Regula w binarnym to: \n";
	for($i=0; $i<8; $i++)
	{
		print $tablica[$i];
	}

	print "\n";
}

&numer_reguly();						#wywolanie pierwszej funkcji

sub jak_wyswietlic						#warunki życia i śmierci danej komórki
{
	if($tablica[0]==1) #111
		{
			for($n=1; $n<47; $n++)
			{
				if($tablica1[47]==1 && $tablica1[0]==1 && $tablica1[1]==1)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==1 && $tablica1[$n]==1 && $tablica1[$n+1]==1)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[46]==1 && $tablica1[47]==1 && $tablica1[0]==1)
					{
						$tablica2[47]=1;
					}
			}
		}

	if($tablica[1]==1) #110
		{
			for($n=1; $n<47; $n++)
			{
				if($tablica1[47]==1 && $tablica1[0]==1 && $tablica1[1]==0)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==1 && $tablica1[$n]==1 && $tablica1[$n+1]==0)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[46]==1 && $tablica1[47]==1 && $tablica1[0]==0)
					{
						$tablica2[47]=1;
					}
			}
		}

	if($tablica[2]==1) #101
		{
			for($n=1; $n<47; $n++)
			{
				if($tablica1[47]==1 && $tablica1[0]==0 && $tablica1[1]==1)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==1 && $tablica1[$n]==0 && $tablica1[$n+1]==1)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[46]==1 && $tablica1[47]==0 && $tablica1[0]==1)
					{
						$tablica2[47]=1;
					}
			}
		}

	if($tablica[3]==1) #100
		{
			for($n=1; $n<47; $n++)
			{
				if($tablica1[47]==1 && $tablica1[0]==0 && $tablica1[1]==0)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==1 && $tablica1[$n]==0 && $tablica1[$n+1]==0)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[46]==1 && $tablica1[47]==0 && $tablica1[0]==0)
					{
						$tablica2[47]=1;
					}
			}
		}

	if($tablica[4]==1) #011
		{
			for($n=1; $n<7; $n++)
			{
				if($tablica1[47]==0 && $tablica1[0]==1 && $tablica1[1]==1)
				{
					$tablica2[0]=1;
				}
				if($tablica1[$n-1]==0 && $tablica1[$n]==1 && $tablica1[$n+1]==1)
				{
					$tablica2[$n]=1;
				}
				if($tablica1[46]==0 && $tablica1[47]==1 && $tablica1[0]==1)
				{
					$tablica2[47]=1;
				}
			}
		}

	if($tablica[5]==1) #010
		{
			for($n=1; $n<47; $n++)
			{
				if($tablica1[47]==0 && $tablica1[0]==1 && $tablica1[1]==0)
				{
					$tablica2[0]=1;
				}
				if($tablica1[$n-1]==0 && $tablica1[$n]==1 && $tablica1[$n+1]==0)
				{
					$tablica2[$n]=1;
				}
				if($tablica1[46]==0 && $tablica1[47]==1 && $tablica1[0]==0)
				{
					$tablica2[47]=1;
				}
			}
		}

	if($tablica[6]==1) #001
		{
			for($n=1; $n<47; $n++)
			{
				if($tablica1[47]==0 && $tablica1[0]==0 && $tablica1[1]==1)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==0 && $tablica1[$n]==0 && $tablica1[$n+1]==1)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[46]==0 && $tablica1[47]==0 && $tablica1[0]==1)
					{
						$tablica2[47]=1;
					}
			}
		}

	if($tablica[7]==1) #000
		{
		for($n=1; $n<47; $n++)
			{
				if($tablica1[47]==0 && $tablica1[0]==0 && $tablica1[1]==0)
					{
						$tablica2[0]=1;
					}
				if($tablica1[$n-1]==0 && $tablica1[$n]==0 && $tablica1[$n+1]==0)
					{
						$tablica2[$n]=1;
					}
				if($tablica1[46]==0 && $tablica1[47]==0 && $tablica1[0]==0)
					{
						$tablica2[47]=1;
					}
			}
		}
}

sub wyswietl_nowa						#Wyswietlanie nastepnej linii automatu
{
	for($j=0; $j<48; $j++)
	{
		if($tablica2[$j] == 1)
		{
			print "\e[1;36m*\e[0m";
		}
		else
		{
			print '.';
		}
	}
}

sub nowa_linia							#Zamiana drugiej tablicy w pierwszą, wyzerowanie nowej tablicy
{
	for ($m = 0; $m < 48; $m++)			
	{
		$tablica1[$m] = $tablica2[$m];
		$tablica2[$m] = '.';
	}
}
										#Tablica1 - miejsce na zalążki automatu.
@tablica1 = ('.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.');
										#Tablica2 - żywe i martwe komórki na podstawie tablicy pierwszej.
@tablica2 = ('.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.');

$szerokosc=48;

print "\e[1;32mWprowadź ilość zalążków, które chcesz mieć.\e[0m \n";
chomp ($zalazek=<STDIN>);
do
{
	$losowa=rand($szerokosc);
	$tablica1[$losowa]=1;					#ustalenie losowego zalążka
	$zalazek--;
} while($zalazek);

print "\e[1;32mPodaj wysokość automatu.\e[0m \n";
chomp ($licznik=<STDIN>);

for ($i = 0; $i < 48; $i++) 			#wyświetlenie zalążka (tablicy1)
	{
		if($tablica1[$i] == 1)
		{
			print "\e[1;36m*\e[0m";
		}
		else
		{
			print '.';
		}
	}

print "\n";

while($licznik)
{
	&jak_wyswietlic();
	&wyswietl_nowa();
	&nowa_linia();
	print "\n";
	$licznik--;
}
