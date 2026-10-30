
open (FKGR, ">keybase/keybase_family_key_to_groups.txt");
open (FGK, ">keybase/keybase_family_group_keys.txt");


$/='##########END OF KEY';
#OPEN THE RAW FILE
$treatments="input/eflora_key_to_families_for_keybase.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@paragraphs=(<IN>);

#READ THE ARRAY BOTTOM TO TOP
foreach $i (reverse(0 .. $#paragraphs)){
		$_ = $paragraphs[$i];
		$last_key=$_;
		$key_number=$i;


#RECOGNIZE KEY TO FAMILY GROUPS PARAGRAPH
	if(m/^(Key To Groups)/m){
		$group = $1;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			#$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print FKGR "Key to Family Groups\n"."$modified_key\n\n";
	}
#RECOGNIZE FAMILY GROUP KEY PARAGRAPHS
	elsif(m/^(Group \d+)(:.+)\n/m){

		$group=$1;
		print "$group\n";
		$title = $1.$2;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			#$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^Group \d+:.+$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print FGK "Family $group\n$title"."$modified_key\n\n";
	}
}

close (FGK);
close (FKGR);

sub mod_group_key {
	my $key =shift;
	my @key_lines =split(/\n/,$key);
	foreach $j (0 .. $#key_lines){

		
#RECOGNIZE LINES WITH TARGETS
		if($key_lines[$j] =~m/\t(.+)\tVERBATIM NAME:.+/){
			$target=$1;
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



sub mod_key {
	my $key =shift;
	my @key_lines =split(/\n/,$key);
	foreach $j (0 .. $#key_lines){

		
#RECOGNIZE LINES WITH TARGETS
		if($key_lines[$j] =~m/\t(.+)\tVERBATIM NAME:.+/){
			$target=$1;
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
