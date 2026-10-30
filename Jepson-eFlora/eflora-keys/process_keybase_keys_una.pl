
#open (FAM, ">keybase/keybase_keys_families_processed.txt");
#open (GEN, ">keybase/keybase_keys_genera_processed.txt");
#open (SPE, ">keybase/keybase_keys_species_processed.txt");
#open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
#open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");

$/="\n\n";
#OPEN THE RAW FILE
$treatments="keybase/keybase_keys_unabridged.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@all_pars=(<IN>);


my @found2=grep(/\t[A-Z][a-z-]+ [a-z-]+\n/g,@all_pars);

	foreach $j (0 .. $#all_pars){		

++$found1;




}



	print UNA join("\n",@all_pars);


close(IN);
close(UNA);


print <<EOP;
Names converted: $found2
Subtaxa converted: $found3
Grass Names converted: $found4
 TOTAL LINES: $found1

EOP

local $/ = '';
open( my $file, "<", "keybase/keybase_keys_unabridged_processed.txt" );
open( my $output, ">", "keybase/pre-match" ) or die $!;

my $found1;
my $found2;
my $found3;
my $found4;

while ( my $line = <$file> ) {



    if ( $line =~ m/(Species of [A-Z][a-z][a-z]+)/g ) {
        my $output_name = $1;
        $output_name =~ s/ /_/g;
        $line =~ s/^Species of .+\n//g;
        $line =~ s/^\n//g; #remove blank lines and beginning and end
        $line =~ s/\n$//g;

print "$output_name\n";
++$found1;
        close($output);
        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
    }
    #	Astragalus nuttallianus var. imperfectus
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
++$found1;
        close($output);
        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
    }
    elsif ($line =~ m/([A-Za-z].*)/g) {
        my $output_name = $1;
        $output_name =~ s/ /_/g;
        $line =~ s/^\n//g; #remove blank lines and beginning and end
        $line =~ s/\n$//g;

print "$output_name\n";
++$found3;
        close($output);
        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
    }

    print {$output} $line;
	++$found4;

}


print <<EOP;
Keybase Unabridged files
Keys converted: $found1

Keys unconverted: $found3

 TOTAL LINES: $found4

EOP
