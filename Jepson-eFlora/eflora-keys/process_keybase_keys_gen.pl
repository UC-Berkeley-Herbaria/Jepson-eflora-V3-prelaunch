#use strict;
#use warnings;
use File::Copy;

#open (FAM, ">keybase/keybase_keys_families_processed.txt");
open (GEN, ">keybase/keybase_keys_genera_processed.txt");
#open (SPE, ">keybase/keybase_keys_species_processed.txt");
#open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
#open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
#open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");

$/="\n\n";
#OPEN THE RAW FILE
$treatments="keybase/keybase_keys_genera.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@all_pars=(<IN>);


#my @found2=grep(/\t[A-Z][a-z-]+ [a-z-]+\n/g,@all_pars);
#second line is key title

	foreach $j (0 .. $#all_pars){		

	#print "Before: $all_pars[$j]\n";

#make additional specific line changes, these are genera with only a single species
#$all_pars[$j] =~ s/\tAgropyron\n/\tAgropyron {Agropyron cristatum subsp. pectinatum}\n/;

#Species of Aphyllon corrections
#the terminals end with species then subtaxon lines, 
#without separate keys for the subtaxa within the treatment
#this causes errors and incompatibilities within Keybase
		$all_pars[$j] =~ s/; calyx lobes narrowly triangular; host <i>Galium<\/i>\tAphyllon epigalium\n/; calyx lobes narrowly triangular; host <i>Galium<\/i>; <i>Aphyllon epigalium<\/i>\t5\n/;
		$all_pars[$j] =~ s/;18 mm, lips 3&ndash;5 mm; on <i>Garrya<\/i>\tAphyllon validum\n/;18 mm, lips 3&ndash;5 mm; on <i>Garrya<\/i>; <i>Aphyllon validum<\/i>\t10\n/;
		$all_pars[$j] =~ s/;14 mm .see also <i>Aphyllon corymbosum<\/i> for plants of SNH, GB.\tAphyllon californicum\n/;14 mm (see also <i>Aphyllon corymbosum<\/i> for plants of SNH, GB); <i>Aphyllon californicum<\/i>\t16\n/;
		$all_pars[$j] =~ s/; mature flower upper corolla lobes slightly recurved at tip, rounded or obtuse\tAphyllon parishii\n/; mature flower upper corolla lobes slightly recurved at tip, rounded or obtuse; <i>Aphyllon parishii<\/i>\t15\n/;


	}









print GEN join("\n",@all_pars);
	#print "After: $all_pars[$j]\n";


close(IN);
close(GEN);


local $/ = '';
open( my $file, "<", "keybase/keybase_keys_genera_processed.txt" );
open( my $output, ">", "pre-match" ) or die $!;
while ( my $line = <$file> ) {


    if ( $line =~ m/(Species of Salix Pistillate)/g ) {
		my $output_name = $1;
		$output_name =~ s/ /_/g;
		$line =~ s/^Species of Salix Pistillate//g;
		$line =~ s/^\n//g; #remove blank lines and beginning and end
		$line =~ s/\n$//g;

print "$output_name\n";

		close($output);
		open( $output, ">", $output_name . ".txt" ) or die $!;
	}
	elsif ( $line =~ m/(Species of Salix Vegetative)/g ) {
		my $output_name = $1;
		$output_name =~ s/ /_/g;
		$line =~ s/^Species of Salix Vegetative//g;
		$line =~ s/^\n//g; #remove blank lines and beginning and end
		$line =~ s/\n$//g;

print "$output_name\n";

		close($output);
		open( $output, ">", $output_name . ".txt" ) or die $!;
	}
	elsif ( $line =~ m/(Species of Salix Staminate)/g ) {
		my $output_name = $1;
		$output_name =~ s/ /_/g;
		$line =~ s/^Species of Salix Staminate//g;
		$line =~ s/^\n//g; #remove blank lines and beginning and end
		$line =~ s/\n$//g;

print "$output_name\n";

		close($output);
		open( $output, ">", $output_name . ".txt" ) or die $!;
    }
    elsif ( $line =~ m/Species of [A-Z][a-z-]+/g ) {
        my ($output_name) = ( $line =~ m/^(\w+ of \w+)/ );
        $output_name =~ s/ /_/g;
        $line =~ s/^(\w+ of \w+)//g;
        $line =~ s/^\n//g; #remove blank lines and beginning and end
        $line =~ s/\n$//g;

print "$output_name\n";

        close($output);
        open( $output, ">", $output_name . ".txt" ) or die $!;
    }
    


    print {$output} $line;
	++$found1;

}


print <<EOP;
Keybase "Species of" Genus files
 TOTAL LINES: $found1

EOP