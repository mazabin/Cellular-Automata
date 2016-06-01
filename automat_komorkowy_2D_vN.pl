#!/usr/bin/perl
#Magdalena Żabińska, Informatyka Stosowana I rok, grupa lab. 14
#Wydział Inżynierii Metali i Informatyki Przemysłowej
#Automaty komórkowe dwuwymiarowe. 

#sasiedztwo von Neumanna
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
print "\n\nNaciśnij 'n' aby zobaczyć następny krok.";
print "\nNaciśnij 'w', aby wyjść z programu.";
&czekaj();		
$krok++;
&zalazek();

while($wykonuj==0)
{	
	&pokaz_plansze();										#Pokaznie planszy z początkowym ziarnem
	print "\n";
	&sasiedzi_von_Neumann();								#Ustalenie położenia sąsiadów
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
			else
			{
				print $plansza[$i][$j];
			}
		}
		print "\n";
	}
	print "\n";
}
sub czekaj
{
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
sub sasiedzi_von_Neumann
{
	for($i=0; $i<15; $i++)
	{
		for($j=0; $j<15; $j++)
		{
		
			if($plansza[$i][$j]==1 && $plansza[$i+1][$j]==0)
			{
				$plansza2[$i+1][$j]=1;
			}
			if($plansza[$i][$j]==1 && $plansza[$i-1][$j]==0)
			{
				$plansza2[$i-1][$j]=1;
			}
			if($plansza[$i][$j]==1 && $plansza[$i][$j-1]==0)
			{
				$plansza2[$i][$j-1]=1;
			}
			if($plansza[$i][$j]==1 && $plansza[$i][$j+1]==0)
			{
				$plansza2[$i][$j+1]=1;
			}
			if($plansza[14][0]==1 && $plansza[0][0]==0)
			{
				$plansza2[0][0]=1;
			}
			if($plansza[14][$j]==1 && $plansza[0][$j]==0)
			{
				$plansza2[0][$j]=1;
			}			
			if($plansza[14][14]==1 && ($plansza[14][0]==0 || $plansza[0][14]==0))
			{
				$plansza2[14][0]=1;
				$plansza2[0][14]=1;
			}
			if($plansza[$i][14]==1 && $plansza[$i][0]==0)
			{
				$plansza2[$i][0]=1;
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