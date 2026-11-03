
use strict;
use warnings;
use autodie; # Automatically handles "die if file not found"
use File::Path qw(make_path); # Needed to create directories automatically

my $found1 = 0;
my $found2 = 0;
my $found3 = 0;
my $found4 = 0;


my $uploadDate = "2026OCT";

my %stats;

my %FOUND;
my $filename = 'input/keybase-file-names.txt';

my $keysfile = 'keybase/upload-'.$uploadDate.'/keys.tsv';

open(my $key_fh,  '>:utf8', $keysfile);

print $key_fh "id\tcreated_at\tupdated_at\ttitle\tauthor\tdescription\titem\tspatial\tremarks\tsource_id\tcreated_by\tupdated_by\tkey_file\n";

my $sourcesfile = 'keybase/upload-'.$uploadDate.'/sources.tsv';

open(my $src_fh,  '>:utf8', $sourcesfile);

print $src_fh "id\tauthor\tyear\ttitle\tcollection_authors\tcollection_title\tedition\tseries\tvolume\tpart\tpublisher\tplace_of_publication\tpages\turl\n";


open(my $fh, '<:utf8', $filename);

while (my $line = <$fh>) {
    chomp $line;
    
    # Skip empty lines
    next unless $line =~ /\S/;
    
    # Trim whitespace just in case
    $line =~ s/^\s+|\s+$//g;
    
    if ($line =~ m/^key-(\d+)-([^.]+\.tsv)/){
    	my $keyCode=$1;
    	my $keyName=$2;
    	$FOUND{$keyName}=$keyCode;
    }
}
close($fh);

#Key to Family Groups
#Key To Groups
#key-3854-key-to-family-groups.tsv


#open (FAM, ">keybase/keybase_keys_families_processed.txt");
#open (GEN, ">keybase/keybase_keys_genera_processed.txt");
#open (SPE, ">keybase/keybase_keys_species_processed.txt");
#open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
#open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
#open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");
#open (my $FGK, ">keybase/keybase_family_group_keys_processed.txt");
open (my $FKGR, ">keybase/keybase_family_key_to_groups_processed.txt");

local $/ = "\n\n";
#OPEN THE RAW FILE
my $treatments="<keybase/keybase_family_key_to_groups.txt";

	open(my $in_fh,$treatments);
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
	my @all_pars=(<$in_fh>);


	foreach my $j (0 .. $#all_pars){

		$all_pars[$j] =~ s/'/&prime;/g;

		$all_pars[$j] =~ s/\n\n+/\n/;

	}

	print $FKGR join("\n\n",@all_pars);


close($in_fh);
close($FKGR);


# Define paths
my $input_file  = "keybase/keybase_family_key_to_groups_processed.txt";
my $output_dir  = "keybase/upload-" . $uploadDate;

# Create the output directory if it doesn't already exist
make_path($output_dir) unless -d $output_dir;

# Set input record separator to '' for paragraph mode (blocks separated by blank lines / \n\n)
local $/ = '';

open(my $IN,  "<", $input_file)  or die "Could not open $input_file: $!";
open(my $OUT, ">", "keybase/pre-match-fam") or die "Could not open pre-match-fam: $!";


while ( my $block = <$IN> ) {
    ++$found4;
    print "DEBUG: Read block $found4 (Length: " . length($block) . " chars)\n";


    # Your custom formatting function (assumed to be defined elsewhere in your script)
    $block =~ s/"//g; #interferes with formatting
    
    # Look for Key to Family Groups anywhere at the start of the block
	if ($block =~ m/(Key) to (Family) (Groups)/ ) {
		++$found1;
		my $output_name = lc($1) . "-to-" . lc($2) . "-" . lc($3) . ".tsv";

		print " -> MATCHED! Target file: $output_name\n";

		my $title = "Key to California Plant Families";
		my $auth = "David J. Keil, as revised by Alan R. Smith and Thomas J. Rosatti to include Cyatheaceae";
		my $desc = "Key to All Family Groups";
		#key-3854-key-to-family-groups.tsv
		my $url = "https://herbariadb.berkeley.edu/eflora/keys/IJM_fam_key.php";

    	my $keyCode = $FOUND{$output_name};

		if( ($keyCode !~ m/^\d+$/) || ($keyCode eq "") ){
			++$found3;
			print "==>WARNING: New KEY not found on 2024 Keybase list.\n";
			print "NEW OUTPUT-->".$output_name."\n";
			print "NEW TITLE-->".$title."\n\n";

		} else {
			++$found2;
			my $key_name = "key-".$keyCode."-".$output_name;
			$block =~ s/^Key to Family Groups\n/from\tstatement\tto\tshortcut\n/g;
			#remove the title, it is being added to the file name and replace with the table field header

			if ($block =~ m/^Key To Groups\n/){
				#my $add = $1;
				#my $temp = $desc;
				#$desc = $temp.": ".$add;
				$desc = "Key To Groups";
			}
			#add the full description, if present

#id	created_at	updated_at	title	author	description	item	spatial	remarks	source_id	created_by	updated_by	key_file
#this needs to be output to the keys.tsv table
#3854	"2015-04-01 17:04:32"	"2019-11-07 10:52:27"	"Key to Family Groups"		"Key to Family Groups"	Equisetopsida	California			dbaxter@berkeley.edu	niels.klazenga@rbg.vic.gov.au	key-3854-key-to-family-groups.tsv
#3863	"2014-09-23 08:43:46"	"2014-09-23 08:43:46"	"Family Group 8"			"Family Group 8"	California			dbaxter@berkeley.edu	dbaxter@berkeley.edu	key-3863-family-group-8.tsv
			print {$key_fh} $keyCode."\t\"2026-10-01 12:12:12\"\t\"2026-10-10 12:12:12\"\t\"" .$title. "\"\t\"" .$auth. "\"\t\"" .$desc. "\"\t\tCalifornia\t\t\tjason_alexander\@berkeley.edu\tjason_alexander\@berkeley.edu\t".$key_name."\n";

#id	author	year	title	collection_authors	collection_title	edition	series	volume	part	publisher	place_of_publication	pages	url
#4040	"J. Robert Haller, Nancy J. Vivrette, & James R. Griffin "	2012	Abies	"Jepson Flora Project (eds.)"	"Jepson eFlora, http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=10025, accessed on January 07, 2020"								
			print {$src_fh} $keyCode."\t\"" .$auth. "\"\t2026\t\"" .$title. "\"\t\"Jepson Flora Project (eds.)\"\t\"Jepson eFlora\"\t\"Revision 14\"\t\t\t\t\t\"University of California, Berkeley\"\t\t".$url."\n";

			# Clean up leading/trailing newlines if necessary
			$block =~ s/^\n+//g; 
			$block =~ s/\n+$//g;


			close($OUT);
			open($OUT, ">", "$output_dir/$key_name") or die "Could not open $key_name: $!";
		}
	} else {
		print " -> WARNING: ($block) did not match 'Family Group [Number]' pattern.\n";
	}

	    # Process the block line-by-line so headers/descriptions stay intact 
	    # and only actual data lines get formatted by your subroutine.
	    my @lines = split(/^/m, $block); # Split safely by lines keeping linebreaks
	    for my $line (@lines) {
	        if ($line =~ /^\d+\t/) {
	            $line = format_keybase_line($line);
	        }
	        next if $line =~ m/^Key To G.+/;
	        print $OUT $line;
	    }


}

close($IN);
close($OUT);
print "Done! Read $found4 blocks. Successfully wrote $found1 files to $output_dir/\n";


#Filehandle Fix: Your original code opened my $fh, but read from <IN>. I changed the open to use my $IN and read from my $IN.
#Directory Creation: Added use File::Path qw(make_path); and make_path($output_dir) so Perl automatically creates keybase/upload-2026OCT/ if it doesn't exist, preventing fatal No such file or directory errors when open tries to write to it.
#Undefined Variable: Removed print "$key_name\n"; because $key_name was never defined in your snippet (you likely meant to print $output_name or removed it during debugging).
#Robust Regex: Updated the regex slightly (\b and \s+) to ensure it catches "Family Group [Number]" reliably even if there are slight spacing differences.

print <<EOP;
Keybase Family Group files
Keys with Keybase Code converted: $found2
Keys Unconverted: $found3

TOTAL KEYS: $found1

TOTAL LINES: $found4

EOP

sub format_keybase_line {
    my ($input_line) = @_;

    return $input_line unless $input_line =~ /^\d+\t/;

    chomp($input_line);
    
    $input_line =~ s/([A-Za-z]+) \{([A-Z][A-Za-z]+)/$1\t$2/;
    $input_line =~ s/\}//;
    
    my @fields = split(/\t/, $input_line);

    for my $i (1 .. $#fields) {
        my $val = $fields[$i];
        next unless defined $val;
        
        $val =~ s/^"|"$//g;
        $val =~ s/^\s+|\s+$//g;

        if ($val =~ / /) {
            $val = qq("$val");
        }
        $fields[$i] = $val;
    }

    if (scalar @fields == 3) {
        push(@fields, ""); 
    }

    return join("\t", @fields) . "\n";
}

#Line-by-Line Inside Paragraphs: Instead of sending the whole text block into format_keybase_line (which would instantly bounce it back unmodified because it doesn't start with a number), the script splits each paragraph into individual lines (split(/^/m, $block)).
#Selective Formatting: It checks each line. If it's a data line starting with a number and a tab (1\t...), it runs your formatting rules (adding quotes to fields with spaces, handling brackets, etc.). If it's Family Group 24 or Group 24: Herbs..., it leaves them clean and writes them straight to the .tsv file.
#File Isolation: Each Family Group section safely closes the previous .tsv file and opens a brand new one inside keybase/upload-2026OCT/.
