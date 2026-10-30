#Groups_of_Juncus
#Groups_of_Carex
#Groups_of_Salix_Staminate_Plants
#Groups_of_Salix_Pistillate_Plants
#Groups_of_Eriogonum
#Groups_of_Penstemon
#Groups_of_Phacelia
#Groups_of_Fabaceae
#Groups_of_Brassicaceae_Fruit
#Groups_of_Brassicaceae_Flower
#Groups_of_Asteraceae


#add a new loop down here for every file created here
#group names need to have the key name added for keybase compatibility
open (OUT, ">keybase/output/keys/Groups_of_Juncus_processed.txt");

my $found4;

open(IN, "Groups_of_Juncus.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Juncus Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found4;
}
close(IN);
close(OUT);

print <<EOP;
Converted Juncus Keybase Group Names
 TOTAL LINES: $found4

EOP


open (OUT, ">keybase/output/keys/Groups_of_Carex_processed.txt");

my $found4;

open(IN, "Groups_of_Carex.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Carex Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found4;
}
close(IN);
close(OUT);

print <<EOP;
Converted Carex Keybase Group Names
 TOTAL LINES: $found4

EOP

open (OUT, ">keybase/output/keys/Carex_Group_11_processed.txt");
#Carex group 11 key is a key to groups 11A -11H
my $found4;

open(IN, "keybase/output/keys/Carex_Group_11.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Carex Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found4;
}
close(IN);
close(OUT);

print <<EOP;
Converted Carex Group 11 Names
 TOTAL LINES: $found4

EOP


open (OUT, ">keybase/output/keys/Groups_of_Salix_processed.txt");
open (BRA, ">keybase/output/keys/Groups_of_Brassicaceae_processed.txt");


print OUT <<EOP;
1	Specimens with immature reproductive structures or entirely vegetative	Species of Salix Vegetative
1	Specimens with mature reproductive structures	2
2	Specimens with staminate flowers	Species of Salix Staminate
2	Specimens with pistillate flowers	Species of Salix Pistillate
EOP

close(OUT);

print BRA <<EOP;
1	Key to Groups Based Primarily on Flowering Material	2
1	Key to Groups Based on Fruiting Material	5
2	Hairs simple or 0	3
2	At least some hairs branched	4
3	Cauline leaves 0 or at least some basally lobed to clasping	Brassicaceae Group 1
3	Cauline leaves always present, not basally lobed or clasping	Brassicaceae Group 2
4	Ovary, young fruit linear	Brassicaceae Group 3
4	Ovary, young fruit variously shaped, not linear	Brassicaceae Group 4
5	Fruit silicle	6
5	Fruit silique	7
6	Hairs simple or 0	Brassicaceae Group 5
6	At least some hairs branched	Brassicaceae Group 6
7	At least some hairs branched	Brassicaceae Group 7
7	Hairs simple or 0	Brassicaceae Group 8
EOP

close(BRA);


print <<EOP;
Converted Salix Keybase Group Names
 TOTAL LINES: 4

EOP

print <<EOP;
Converted Brassicaceae Keybase Group Names
 TOTAL LINES: 14

EOP



open (OUT, ">keybase/output/keys/Groups_of_Eriogonum_processed.txt");

my $found4;

open(IN, "Groups_of_Eriogonum.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Eriogonum Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found4;
}
close(IN);
close(OUT);

print <<EOP;
Converted Eriogonum Keybase Group Names
 TOTAL LINES: $found4

EOP

open (OUT, ">keybase/output/keys/Groups_of_Penstemon_processed.txt");

my $found4;

open(IN, "Groups_of_Penstemon.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Penstemon Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found4;
}
close(IN);
close(OUT);

print <<EOP;
Converted Penstemon Keybase Group Names
 TOTAL LINES: $found4

EOP


open (OUT, ">keybase/output/keys/Groups_of_Phacelia_processed.txt");

my $found4;

open(IN, "Groups_of_Phacelia.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Phacelia Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found4;
}
close(IN);
close(OUT);

print <<EOP;
Converted Phacelia Keybase Group Names
 TOTAL LINES: $found4

EOP


open (OUT, ">keybase/output/keys/Groups_of_Fabaceae_processed.txt");

my $found4;

open(IN, "Groups_of_Fabaceae.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Fabaceae Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found4;
}
close(IN);
close(OUT);

print <<EOP;
Converted Fabaceae Keybase Group Names
 TOTAL LINES: $found4

EOP



open (OUT, ">keybase/output/keys/Groups_of_Asteraceae_processed.txt");

my $found4;

open(IN, "Groups_of_Asteraceae.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Asteraceae Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found4;
}
close(IN);

print <<EOP;
Converted Asteraceae Keybase Group Names
 TOTAL LINES: $found4

EOP

open (OUT, ">keybase/output/keys/Groups_of_Trifolium_processed.txt");

my $found5;

open(IN, "Groups_of_Trifolium.txt") || die;
while(<IN>){
chomp;

#print $_;

	($s,$t,$u)=split(/\t/);
	$u =~ s/Group /Trifolium Group /g;
	
	print OUT $s."\t".$t."\t".$u."\n";
	++$found5;
}
close(IN);

print <<EOP;
Converted Trifolium Keybase Group Names
 TOTAL LINES: $found5

EOP