#!/usr/bin/perl
#Magdalena Żabińska, Informatyka Stosowana I rok, grupa lab. 14
#Wydział Inżynierii Metali i Informatyki Przemysłowej
#Automaty komórkowe dwuwymiarowe. 

#sasiedztwo Moore'a
@plansza=([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
@plansza2=([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
$szerokosc_planszy=15;
$krok=0; $wykonuj=0;
print "Podaj ilość zalążków: \n";
chomp ($zarodek=<STDIN>);												#Wygenerowanie ziarna
system clear;
&pokaz_plansze();										#Pokazanie czystej planszy
print "\nKrok numer: ";
print $krok;
&czekaj();		
$krok++;
&zalazek();

while($wykonuj==0)
{	
	&pokaz_plansze();								
	print "\n";
	&sasiedzi_Moore();								#Ustalenie położenia sąsiadów
	print "\nKrok numer: ";
	print $krok;
	$krok++;
	&kopiuj();												#skopiowanie tablic
	print "\n";
	&czekaj();
}

#####FUNKCJE
sub pokaz_plansze
{
	for($i=0; $i<15; $i++)
	{
		for($j=0; $j<15; $j++)
		{
			if($plansza[$i][$j]==1)
			{
				print "\e[1;36m*\e[0m";
			}
			elsif($plansza[$i][$j]==2)
			{
				print "\e[1;34m*\e[0m";
			}
			elsif($plansza[$i][$j]==3)
			{
				print "\e[1;37m*\e[0m";
			}
			else
			{
				print ".";
			}
		}
		print "\n";
	}
	print "\n";
}
sub czekaj
{
	print "\n\nNaciśnij 'n' aby zobaczyć następny krok.";
	print "\nNaciśnij 'w', aby wyjść z programu.";
	$czeka=0;
	until($czeka eq n || $czeka eq w)
	{
		chomp ($czeka=<STDIN>);
	}
	if($czeka eq n)
	{
		system clear;
	}
	if($czeka eq w)
	{
		$wykonuj=1;
	}
}
sub zalazek
{
	do
	{
		$zalazek_x=rand($szerokosc_planszy);
		$zalazek_y=rand($szerokosc_planszy);
		$plansza[$zalazek_x][$zalazek_y]=1;
		$plansza2[$zalazek_x][$zalazek_y]=1;					#ustalenie losowego zalążka
		$zarodek--;
	} while($zarodek);
}
sub sasiedzi_Moore
{
	$kolor=1+$krok%3;
	for($i=0; $i<15; $i++)
	{
		for($j=0; $j<15; $j++)
		{		
			if(($plansza[$i][$j]==1 || $plansza[$i][$j]==2 || $plansza[$i][$j]==3) && $plansza[$i+1][$j]==0)		#i+1,j
			{
				$plansza2[$i+1][$j]=$kolor;
			}
			if(($plansza[$i][$j]==1 || $plansza[$i][$j]==2 || $plansza[$i][$j]==3) && $plansza[$i-1][$j]==0)		#i-1,j
			{
				$plansza2[$i-1][$j]=$kolor;
			}
			if(($plansza[$i][$j]==1 || $plansza[$i][$j]==2 || $plansza[$i][$j]==3) && $plansza[$i][$j-1]==0)		#i,j-1
			{
				$plansza2[$i][$j-1]=$kolor;
			}
			if(($plansza[$i][$j]==1 || $plansza[$i][$j]==2 || $plansza[$i][$j]==3) && $plansza[$i][$j+1]==0)		#i,j+1
			{
				$plansza2[$i][$j+1]=$kolor;
			}
			if(($plansza[$i][$j]==1 || $plansza[$i][$j]==2 || $plansza[$i][$j]==3) && $plansza[$i+1][$j+1]==0)		#i+1,j+1
			{
				$plansza2[$i+1][$j+1]=$kolor;
			}
			if(($plansza[$i][$j]==1 || $plansza[$i][$j]==2 || $plansza[$i][$j]==3) && $plansza[$i-1][$j+1]==0)		#i-1,j+1
			{
				$plansza2[$i-1][$j+1]=$kolor;
			}
			if(($plansza[$i][$j]==1 || $plansza[$i][$j]==2 || $plansza[$i][$j]==3) && $plansza[$i+1][$j-1]==0)		#i+1,j-1
			{
				$plansza2[$i+1][$j-1]=$kolor;
			}
			if(($plansza[$i][$j]==1 || $plansza[$i][$j]==2 || $plansza[$i][$j]==3) && $plansza[$i-1][$j-1]==0)		#i-1,j-1
			{
				$plansza2[$i-1][$j-1]=$kolor;
			}
			if(($plansza[14][0]==1 || $plansza[14][0]==2 || $plansza[14][0]==3) && $plansza[0][0]==0)
			{
				$plansza2[0][0]=$kolor;
			}
			if(($plansza[14][0]==1 || $plansza[14][0]==2 || $plansza[14][0]==3) && $plansza[0][14]==0)
			{
				$plansza2[0][14]=$kolor;
			}
			if(($plansza[14][$j]==1 || $plansza[14][$j]==2 || $plansza[14][$j]==3) && $plansza[0][$j]==0)
			{
				$plansza2[0][$j]=$kolor;
			}			
			if(($plansza[14][14]==1 || $plansza[14][14]==2 || $plansza[14][14]==3) && ($plansza[14][0]==0 || $plansza[0][14]==0))
			{
				$plansza2[14][0]=$kolor;
				$plansza2[0][14]=$kolor;
			}
			if(($plansza[$i][14]==1 || $plansza[$i][14]==2 || $plansza[$i][14]==3) && $plansza[$i-1][0]==0)
			{
				$plansza2[$i-1][0]=$kolor;
			}
			if(($plansza[$i][14]==1 || $plansza[$i][14]==2 || $plansza[$i][14]==3) && $plansza[$i][0]==0)
			{
				$plansza2[$i][0]=$kolor;
			}
			if(($plansza[$i][14]==1 || $plansza[$i][14]==2 || $plansza[$i][14]==3)&& $plansza[$i+1][0]==0)
			{
				$plansza2[$i+1][0]=$kolor;
			}
			if(($plansza[14][$j]==1 || $plansza[14][$j]==2 || $plansza[14][$j]==3 )&& $plansza[0][$j-1]==0)
			{
				$plansza2[0][$j-1]=$kolor;
			}
			if(($plansza[14][$j]==1 || $plansza[14][$j]==2 || $plansza[14][$j]==3) && $plansza[0][$j]==0)
			{
				$plansza2[0][$j]=$kolor;
			}
			if(($plansza[14][$j]==1 || $plansza[14][$j]==2 || $plansza[14][$j]==3) && $plansza[0][$j+1]==0)
			{
				$plansza2[0][$j+1]=$kolor;
			}
		}
	}
}
sub kopiuj
{
	for($i=0;$i<15;$i++)
	{
		for($j=0; $j<15; $j++)
		{
			$plansza[$i][$j]=$plansza2[$i][$j];
		}
	}
}