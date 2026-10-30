#use strict;
#use warnings;
use File::Copy;

#open (FAM, ">keybase/keybase_keys_families_processed.txt");
#open (GEN, ">keybase/keybase_keys_genera_processed.txt");
open (SPE, ">keybase/keybase_keys_species_processed.txt");
#open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
#open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
#open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");

$/="\n\n";
#OPEN THE RAW FILE
$treatments="keybase/keybase_keys_species.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@all_pars=(<IN>);


#my @found2=grep(/\t[A-Z][a-z-]+ [a-z-]+\n/g,@all_pars);

	foreach $j (0 .. $#all_pars){		


		}


#second line is key title

	#print "Before: $all_pars[$j]\n";

#make additional specific line changes, these are genera with only a single species
#species of Aphyllon key compatibility fixes
#$all_pars[$j] =~ s/\tAgropyron\n/\tAgropyron {Agropyron cristatum subsp. pectinatum}\n/;



print SPE join("\n",@all_pars);
	#print "After: $all_pars[$j]\n";


close(IN);
close(SPE);


local $/ = '';
open( my $file, "<", "keybase/keybase_keys_species_processed.txt" );
open( my $output, ">", "keybase/pre-match" ) or die $!;
while ( my $line = <$file> ) {




    #	Langloisia setosissima subsp. punctata
    if ($line =~ m/\t([A-Z][a-z][a-z-]+ +[a-z][a-z][a-z-]+) +subsp\. +[a-z][a-z][a-z-]+\n/g){
        my $output_name = "Subspecies_of_".$1;
        #unlike others, the name of the depends on the rank and the rank is not included in the key title
        #have to find a terminal and extract that for the title
        #at this point the first terminal genus-species name should be the name of the key
        #and there should not be any mixed var. subsp. keys., except maybe Rosa?
        $output_name =~ s/ /_/g;
        $line =~ s/^(\w+ \w+)//g;
        $line =~ s/^\n//g; #remove blank lines and beginning and end
        $line =~ s/\n$//g;

print "$output_name\n";
++$found4;
        close($output);
        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
    }
    #	Tiarella trifoliata var. trifoliata
	elsif ($line =~ m/\t([A-Z][a-z][a-z-]+ +[a-z][a-z][a-z-]+) +var\. +[a-z][a-z][a-z-]+\n/g){
        my $output_name = "Varieties_of_".$1;
        #unlike others, the name of the depends on the rank and the rank is not included in the key title
        #have to find a terminal and extract that for the title
        #at this point the first terminal genus-species name should be the name of the key
        #and there should not be any mixed var. subsp. keys., except maybe Rosa?
        $output_name =~ s/ /_/g;
        $line =~ s/^(\w+ \w+)//g;
        $line =~ s/^\n//g; #remove blank lines and beginning and end
        $line =~ s/\n$//g;

print "$output_name\n";
++$found5;
        close($output);
        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
    }
    elsif ( $line =~ m/^([A-Z][a-z-]+.+)\n/g ) {
        my $output_name = $1;
        $output_name =~ s/ /_/g;
        $line =~ s/^(\w+ \w+)//g;
        $line =~ s/^\n//g; #remove blank lines and beginning and end
        $line =~ s/\n$//g;

print "$output_name\n";
++$found2;
        close($output);
        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
    }
    
    print {$output} $line;
	++$found1;

}


print <<EOP;
Keybase "Species of" files-->$found3
Keybase "Subspecies of" files-->$found4
Keybase "Varieties of" files-->$found5

Unprocessed Keybase Species key files-->$found2

 TOTAL LINES: $found1

EOP