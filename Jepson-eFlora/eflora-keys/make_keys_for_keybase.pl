use strict;
#use warnings;
use autodie; # Automatically handles "die if file not found"

my $found1 = 0;
my $found2 = 0;
my $found3 = 0;
my $found4 = 0;
my $UNS_GE = 0;
my $UNS_SP = 0;
my $keyCode = 999999999999;

my $uploadDate = "2026OCT";
my ($next_key_number);


# 1. Open Output Files with Lexical Filehandles
my $FAM_file = 'keybase/keybase_keys_families.txt';
my $GEN_file  = 'keybase/keybase_keys_genera.txt';
my $SPE_file = 'keybase/keybase_keys_species.txt';
my $INF_file = 'keybase/keybase_keys_infrataxa.txt';
my $FGR_file  = 'keybase/keybase_keys_family_groups.txt';
my $GGR_file  = 'keybase/keybase_keys_genus_groups.txt';
my $KGR_file  = 'keybase/keybase_keys_key_to_groups.txt';

my $OUT_file  = 'output/keybase-keys-names-list-'.$uploadDate.'.txt';

open(my $FAM_FH, '>:utf8', $FAM_file) || die;
open(my $GEN_FH,  '>:utf8', $GEN_file) || die;
open(my $SPE_FH, '>:utf8', $SPE_file) || die;
open(my $INF_FH, '>:utf8', $INF_file) || die;
open(my $FGR_FH,  '>:utf8', $FGR_file) || die;
open(my $GGR_FH,  '>:utf8', $GGR_file) || die;
open(my $KGR_FH,  '>:utf8', $KGR_file) || die;

open(my $OUT_FH,  '>:utf8', $OUT_file) || die;

#open ($FAM, ">keybase/keybase_keys_families.txt");
#open ($GEN, ">keybase/keybase_keys_genera.txt");
#open ($SPE, ">keybase/keybase_keys_species.txt");
#open ($FGR, ">keybase/keybase_keys_family_groups.txt");
#open ($GGR, ">keybase/keybase_keys_genus_groups.txt");
#open ($KGR, ">keybase/keybase_keys_key_to_groups.txt");
#open ($UNA, ">keybase/keybase_keys_unabridged.txt");

# 2. Read the Input File
my $treatments = "input/eflora_keys_for_keybase.txt";
my @paragraphs;

{
    # localizing $/ protects the rest of your script from this custom separator
    local $/ = '##########END OF KEY';
    
    open(my $IN_FH, '<:utf8', $treatments);
    @paragraphs = <$IN_FH>;
    # File closes automatically when $IN_FH goes out of scope
}

# 3. Iterate Reverse through the Array
# Using a counter alongside the element for clarity
my $total_elements = $#paragraphs;

#READ THE ARRAY BOTTOM TO TOP
foreach my $i (reverse(0 .. $total_elements)) {
    my $current_key = $paragraphs[$i];
    my $key_index   = $i; # This replaces $key_number=$i

	++$found4;
    # Clean up the trailing separator from each paragraph if needed
    $current_key =~ s/##########END OF KEY$//;

    # ... Proceed with processing $current_key ...

#Salix	9887
#Key to Vegetative Plants
##########END OF KEY
#Salix	9887
#Salix is an anomaly
#three species keys, vegetative, pistillate, and staminate
#no gey to groups
#due to the titles, the species keys are parsing as group keys
#fix these first
#RECOGNIZE KEY TO FAMILY GROUPS PARAGRAPH
    # Check for the Group header in the named variable
    if ($current_key =~ m/^(Salix)\t[0-9]+\nKey to Vegetative Plants/m) {
		next;
		#skip this as it is not parsing correctly
		print $OUT_file "Species of ".$1.": Key to Vegetative Plants\n";

	}
#RECOGNIZE FAMILY GROUP KEY PARAGRAPHS
    elsif ($current_key =~ m/^Key to Staminate Plants\n(Salix)\t[0-9]+\n/m){
		++$found1;
		my $name = $1;
		my $auth = $2;
		my $rev = $3;
		my $date = $4;
		my $group = "Staminate Plants";
		print "$group\n";

		my $title = "Key to Staminate Plants";
		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$GEN_FH} "Species of $name\nTI:$title\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH "Species of ".$name.": ".$title."\n";

	}
	elsif($current_key =~ m/^Key to Pistillate Plants\n(Salix)\t[0-9]+\n/m){
#Key to Pistillate Plants
#Salix	9887	Bruce G. Baldwin, Scientific Editor	TJM2 Hardcover, 2nd Edition	2012

		++$found1;
		my $name = $1;
		my $auth = $2;
		my $rev = $3;
		my $date = $4;
		my $group = "Pistillate Plants";
		print "$group\n";
		my $title = "Key to Pistillate Plants";

		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$GEN_FH} "Species of $name\nTI:$title\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH "Species of ".$name.": ".$title."\n";

	}
	elsif($current_key =~ m/^(Salix)\t[0-9]+\n/m){
		++$found1;
		my $name = $1;
		my $auth = $2;
		my $rev = $3;
		my $date = $4;
		my $group = "Vegetative Plants";
		print "$group\n";
		my $title = "Key to Vegetative Plants";
		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$GEN_FH} "Species of $name\nTI:$title\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH "Species of ".$name.": ".$title."\n";

	}
#The following two group keys have to be combined
#keybase can only handle 1 key to groups per taxonomic unit
#Key to Groups Based Primarily on Flowering Material
#Key to Groups Based on Fruiting Material
#KEeybase is incompatible to having more than one group key 
#independant of the groups.  this has to be combined in the ketbase file to the following:
#Key to Groups
#Brassicaceae	70
#1. Specimens with mostly flowering material
#2. Hairs simple or 0
#3. Cauline leaves 0 or at least some basally lobed to clasping 	Group 1	VERBATIM NAME:Group 1
#3' Cauline leaves always present, not basally lobed or clasping 	Group 2	VERBATIM NAME:Group 2
#2' At least some hairs branched
#4. Ovary, young fruit linear 	Group 3	VERBATIM NAME:Group 3
#4' Ovary, young fruit variously shaped, not linear 	Group 4	VERBATIM NAME:Group 4
#1' Specimens with mostly fruiting material
#5. Fruit silicle
#6. Hairs simple or 0 	Group 5	VERBATIM NAME:Group 5
#6' At least some hairs branched 	Group 6	VERBATIM NAME:Group 6
#5' Fruit silique
#7. At least some hairs branched 	Group 7	VERBATIM NAME:Group 7
#7' Hairs simple or 0 	Group 8	VERBATIM NAME:Group 8
#RECOGNIZE NORMAL KEY TO GROUPS PARAGRAPHS
	elsif($current_key =~ m/^Key to (Groups Based Primarily on Flowering.+)\n(Brassicaceae)\t70/m){
		++$found1;
		my $group = $1;
		my $name = $2;
		my $auth = $3;
		my $rev = $4;
		my $date = $5;
		print "$group\n";
		my $title = "Key to Groups of Genera of Brassicaceae: specimens with mostly flowering material or mostly fruiting material combined";

		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$KGR_FH} "Groups of $name\nTI:$title\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH "Groups of Genera of ".$name.": ".$group."\n";

	}
#RECOGNIZE NORMAL KEY TO GROUPS PARAGRAPHS
	elsif($current_key =~ m/^(Key to .+)\n([A-Z][a-z-]+)\t[0-9]+\n/m){
		++$found1;
		my $group = $1;
		my $name = $2;
		my $auth = $3;
		my $rev = $4;
		my $date = $5;
		print "$group\n";

		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$KGR_FH} "Groups of $name\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH "Groups of ".$name.": ".$group."\n";

	}
#RECOGNIZE FAMILY GROUP KEY PARAGRAPHS
	elsif($current_key =~ m/^(Group .+)\n([A-Z][a-z-]+aceae)\t[0-9]+\n/m){
		++$found1;
		my $group = $1;
		my $name = $2;
		my $auth = $3;
		my $rev = $4;
		my $date = $5;
		print "$group\n";

		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$FGR_FH} "$name $group\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH $name." ".$group."\n";

	}
#RECOGNIZE GROUP KEY PARAGRAPHS
	elsif($current_key =~ m/^(Group .+)\n([A-Z][a-z-]+)\t[0-9]+\t[0-9]+\n/m){
		++$found1;
		my $group = $1;
		my $name = $2;
		my $auth = $3;
		my $rev = $4;
		my $date = $5;
		print "$group\n";

		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$GGR_FH} "$name $group\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH $name." ".$group."\n";

	}
#RECOGNIZE FAMILY PARAGRAPHS
	elsif($current_key =~ m/^([A-Z][a-z]+aceae)\t[0-9]+\n/m){
		++$found1;
		my $family=$1;
		my $auth = $2;
		my $rev = $3;
		my $date = $4;
		print "$family\n";
		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$FAM_FH} "Genera of $family\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH "Genera of ".$family."\n";

	}
#RECOGNIZE UNABRIDGED GENUS PARAGRAPHS
	elsif($current_key =~ m/^\t\d+\nUNABRIDGED KEY/m){
		++$UNS_GE;
		next;
	}
#RECOGNIZE UNABRIDGED SPECIES PARAGRAPHS
	elsif($current_key =~ m/^\t\d+\nUNABRIDGED KEY/m){
		++$UNS_SP;
		next;
	}
#RECOGNIZE GENUS PARAGRAPHS
	elsif($current_key =~ m/^([A-Z][a-z-]+)\t[0-9]+\n/m){
		++$found1;
		my $name = $1;
		my $auth = $2;
		my $rev = $3;
		my $date = $4;
		print "$name\n";
		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print {$SPE_FH} "Species of $name\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
		print $OUT_FH "Species of ".$name."\n";

	}
#RECOGNIZE SPECIES PARAGRAPHS
	elsif($current_key =~ m/^([A-Z][a-z-]+ [a-z-]+)\t[0-9]+\n/m){
		++$found1;
		my $name = $1;
		my $auth = $2;
		my $rev = $3;
		my $date = $4;
		#print "$name\n";
		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			if ($modified_key =~ m/ var. [a-z-]+/){
				print $OUT_FH "Varieties of ".$name."\n";
				print {$INF_FH} "Varieties of $name\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";

			}
			elsif ($modified_key =~ m/ subsp. [a-z-]+/){
				print $OUT_FH "Subspecies of ".$name."\n";
				print {$INF_FH} "Subspecies of $name\nAU:$auth\nRV:$rev\nDT:$date", $modified_key, "\n##########END OF KEY\n";
			} else {
				print $OUT_FH "BABDBADBABD-->".$name."\n";
				print "BABDBADBABD-->$name\n";
			}

			
	} else {
		
		if ($current_key !~ m/^ *$/){
			++$found3;
			print "BAD KEYS-->".$current_key."\n\n";
		}
	}

}


close ($FAM_FH);
close ($GEN_FH);
close ($SPE_FH);
close ($INF_FH);
close ($FGR_FH);
close ($GGR_FH);
close ($KGR_FH);

print <<EOP;
Keybase Family Group files
Keys Unconverted: $found3

Found UNABRIDGED GENUS KEYS: $UNS_GE
Found UNABRIDGED SPECIES KEYS: $UNS_SP

TOTAL KEYS: $found1

TOTAL LINES: $found4

EOP


sub mod_key {
	my $key =shift;
	my @key_lines =split(/\n/,$key);
	foreach my $j (0 .. $#key_lines){

		
#RECOGNIZE LINES WITH TARGETS
		if($key_lines[$j] =~m/\t(.+)\tVERBATIM NAME:.+/){
			my $target=$1;
			$key_lines[$j] =~s/\tVERBATIM NAME:.+$//mg;
			$key_lines[$j] =~s/^(\d+[A-Za-z]?)[.'] (.+)/$1\t$2/mg;
		}
		else{
#ASSUME THAT THE LINE FOLLOWING A LINE WITHOUT A TARGET IS THE SUCCESSOR, #USE ITS NUMBER AS THE TARGET
			($next_key_number=$key_lines[$j+1]) =~s/^(\d+[A-Za-z]?)[.'] .+/$1/mg;
			$key_lines[$j] =~s/^(\d+[A-Za-z]?)[.'] (.+)/$1\t$2\t$next_key_number/mg;
		}
	}


return join("\n",sort {$a <=> $b}(@key_lines));
}



#Lexical Filehandle (my $fh): The old IN is a global symbol. If another part of your script uses IN, they will conflict. $fh is scoped only to this block.
#Three-Argument Open: open($fh, '<:utf8', $path) is much safer. It prevents accidental file overwriting if the filename starts with >.
#Encoding (:utf8): Botanical data often contains special characters (like × for hybrids). Specifying the encoding prevents character corruption.
#Removed the split bug: In your original code, split(/$_/) was essentially trying to split a string using itself as the delimiter, which usually results in an empty list. I replaced it with the actual line content ($line or $_).
#Whitespace Protection: Added a check (next unless /\S/) and a trim. Text files often have trailing spaces or empty lines at the end that can create "ghost" entries in your %FOUND hash.
#autodie: Using use autodie; at the top of your script means you don't have to write || die "..." after every open or close statement.



#Localizing the Record Separator (local $/): By putting the file reading inside a block { ... } and using local, you change the separator only for that specific file read. As soon as the block ends, Perl restores $/ to the standard newline \n.
#Lexical Filehandles (my $FKGR_FH): The old style (FKGR) creates global symbols. Lexical filehandles are much safer and automatically close when the variable goes out of scope, preventing memory leaks.
#UTF-8 Encoding: Adding :utf8 to the open statement is essential for taxonomic data, as it ensures characters like the hybrid symbol (×) or accented names (e.g., Née) are read and written correctly.
#Explicit Loop Variable: Using foreach my $i (...) and assigning $paragraphs[$i] to a named variable like $current_key is much easier to read and debug than relying on the default variable $_.
#Separator Removal: When you change $/, the separator is included at the end of every element in the array. I added a line ($current_key =~ s/separator$//;) to strip that off so you have clean data to work with inside the loop.


