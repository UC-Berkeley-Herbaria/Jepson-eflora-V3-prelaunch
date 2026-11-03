
use strict;
#use warnings;
use autodie; # Automatically handles "die if file not found"

my %FOUND;
my $filename = 'input/keybase-file-names.txt';
my ($group,$title,$next_key_number);

# 1. Open Output Files with Lexical Filehandles
my $fkgr_file = 'keybase/keybase_family_key_to_groups.txt';
my $fgk_file  = 'keybase/keybase_family_group_keys.txt';

open(my $FKGR_FH, '>:utf8', $fkgr_file) || die;
open(my $FGK_FH,  '>:utf8', $fgk_file) || die;

# 2. Read the Input File
my $treatments = "input/eflora_key_to_families_for_keybase.txt";
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

    # Clean up the trailing separator from each paragraph if needed
    $current_key =~ s/##########END OF KEY$//;

    # ... Proceed with processing $current_key ...


#RECOGNIZE KEY TO FAMILY GROUPS PARAGRAPH
    # Check for the Group header in the named variable
    if ($current_key =~ m/^(Key To Groups)/m) {
	#if(m/^(Key To Groups)/m){
		$group = $1;
		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			#$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			#$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			#print "Key to Family Groups\n"."$modified_key\n\n";
			print {$FKGR_FH} "Key to Family Groups\n", $modified_key, "\n\n";
			#print {$FKGR_FH} "Key to Family Groups\n$modified_key\n\n";
	}
#RECOGNIZE FAMILY GROUP KEY PARAGRAPHS
    elsif ($current_key =~ m/^(Group \d+)(:.+)\n/m){
	#elsif(m/^(Group \d+)(:.+)\n/m){
		$group=$1;
		print "$group\n";
		$title = $1.$2;
		    # Use the named variable instead of $_
			my $modified_key = mod_key($current_key);

			#$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			#$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^Group \d+:.+$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous tab space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			#print $FGK_FH "Family $group\n$title"."$modified_key\n\n";
			print {$FGK_FH} "Family $group\n$title", $modified_key, "\n\n";
			#print "Family $group\n$title", $modified_key, "\n\n";

	}
	else{
		print "BAD KEYS-->".$current_key."\n\n";
	}
}

close ($FGK_FH);
close ($FKGR_FH);

#sub mod_group_key {
#	my $key =shift;
#	my @key_lines =split(/\n/,$key);
#	foreach $j (0 .. $#key_lines){

		
#RECOGNIZE LINES WITH TARGETS
#		if($key_lines[$j] =~m/\t(.+)\tVERBATIM NAME:.+/){
#			$target=$1;
#			$key_lines[$j] =~s/\tVERBATIM NAME:.+$//mg;
#			$key_lines[$j] =~s/^(\d+[A-Za-z]?)[.'] (.+)/$1\t$2/mg;
#		}
#		else{
#ASSUME THAT THE LINE FOLLOWING A LINE WITHOUT A TARGET IS THE SUCCESSOR, #USE ITS NUMBER AS THE TARGET
#			($next_key_number=$key_lines[$j+1]) =~s/^(\d+[A-Za-z]?)[.'] .+/$1/mg;
#			$key_lines[$j] =~s/^(\d+[A-Za-z]?)[.'] (.+)/$1\t$2\t$next_key_number/mg;
#		}
#	}


#return join("\n",sort {$a <=> $b}(@key_lines));
#}



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



