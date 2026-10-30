
open (FAM, ">keybase/keybase_keys_families.txt");
open (GEN, ">keybase/keybase_keys_genera.txt");
open (SPE, ">keybase/keybase_keys_species.txt");
open (FGR, ">keybase/keybase_keys_family_groups.txt");
open (GGR, ">keybase/keybase_keys_genus_groups.txt");
open (KGR, ">keybase/keybase_keys_key_to_groups.txt");
open (UNA, ">keybase/keybase_keys_unabridged.txt");

$/='##########END OF KEY';
#OPEN THE RAW FILE
$treatments="input/eflora_keys_for_keybase.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@paragraphs=(<IN>);

#READ THE ARRAY BOTTOM TO TOP
foreach $i (reverse(0 .. $#paragraphs)){
		$_ = $paragraphs[$i];
		$last_key=$_;
		$key_number=$i;

#Salix	9887
#Key to Vegetative Plants
##########END OF KEY
#Salix	9887
#Salix is an anomaly
#three species keys, vegetative, pistillate, and staminate
#no gey to groups
#due to the titles, the species keys are parsing as group keys
#fix these first
	if(m/^(Salix)\t[0-9]+\nKey to Vegetative Plants/m){
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			#skip this as it is not parsing correctly
	}
	elsif(m/^Key to Staminate Plants\n(Salix)\t[0-9]+/m){
		$name = $1;
		$group = "Staminate";
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print GEN "Species of $name $group"."$modified_key\n\n";
	}
	elsif(m/^Key to Pistillate Plants\n(Salix)\t[0-9]+/m){
		$name = $1;
		$group = "Pistillate";
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print GEN "Species of $name $group"."$modified_key\n\n";
	}
	elsif(m/^(Salix)\t[0-9]+\n1/m){
		$name = $1;
		$group = "Vegetative";
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			#$modified_key =~s/^(Key to .+)$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print GEN "Species of $name $group"."$modified_key\n\n";
	}
#The following two group keys have to be combined
#keybase can only handle 1 key to groups per taxonomic unit
#Key to Groups Based Primarily on Flowering Material
#Key to Groups Based on Fruiting Material
#Brassicaceae	70
	elsif(m/^Key to Groups Based Primarily on Flowering Material\nBrassicaceae\t70/m){
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			#skip this as it is combined in process_keybase_keys_kgr_final.pl
	}	
	elsif(m/^Key to Groups Based on Fruiting Material\nBrassicaceae\t70/m){
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			#skip this as it is combined in process_keybase_keys_kgr_final.pl
	}		
#RECOGNIZE NORMAL KEY TO GROUPS PARAGRAPHS
	elsif(m/^(Key to .+)\n([A-Z][a-z-]+)\t[0-9]+/m){
		$group = $1;
		$name = $2;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print KGR "Groups of $name\n$group"."$modified_key\n\n";
	}
#RECOGNIZE FAMILY GROUP KEY PARAGRAPHS
	elsif(m/^(Group .+)\n([A-Z][a-z-]+aceae)\t[0-9]+/m){

		$group=$1;
		print "$group\n";
		$name = $2;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print FGR "$name $group"."$modified_key\n\n";
	}
#RECOGNIZE GROUP KEY PARAGRAPHS
	elsif(m/^(Group .+)\n([A-Z][a-z-]+)\t[0-9]+/m){

		$group=$1;
		print "$group\n";
		$name = $2;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/^(Key to .+)$//m; #remove group tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print GGR "$name $group"."$modified_key\n\n";
	}
#RECOGNIZE FAMILY PARAGRAPHS
	elsif(m/^([A-Z][a-z]+aceae)\t[0-9]+/m){
		$family=$1;
		#print "$family\n";
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print FAM "Genera of $family"."$modified_key\n\n";
	}
#RECOGNIZE UNABRIDGED GENUS PARAGRAPHS
	elsif(m/^([A-Z][a-z-]+)\t[0-9]+\nUNABRIDGED KEY\n/m){
		$genus=$1;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/UNABRIDGED KEY/\n/;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print UNA "Species of $genus"."$modified_key\n\n";
	}
#RECOGNIZE UNABRIDGED SPECIES PARAGRAPHS
	elsif(m/^([A-Z][a-z-]+ [a-z-]+)\t[0-9]+\nUNABRIDGED KEY\n/m){
		$species=$1;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/UNABRIDGED KEY/\n/;
			$modified_key =~s/^[A-Z][a-z-]+ [a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print UNA "$species"."$modified_key\n\n";
	}
#RECOGNIZE GENUS PARAGRAPHS
	elsif(m/^([A-Z][a-z-]+)\t[0-9]+/m){
		$genus=$1;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print GEN "Species of $genus"."$modified_key\n\n";
	}
#RECOGNIZE SPECIES PARAGRAPHS
	elsif(m/^([A-Z][a-z-]+ [a-z-]+)\t[0-9]+/m){
		$species=$1;
			$modified_key=&mod_key($_);
			$modified_key =~s/##########END OF KEY//;
			$modified_key =~s/^[A-Z][a-z-]+ [a-z-]+\t\d+$//m; #remove key tags
			$modified_key =~s/\n+/\n/g; #remove empty lines
			$modified_key =~s/ +\t/\t/g; #remove superfluous end-of-line space
			$modified_key =~s/ +\n/\n/g; #remove superfluous end-of-line space
			print SPE "$species"."$modified_key\n\n";
	}
}

sub mod_key {
	my $key =shift;
	my @key_lines =split(/\n/,$key);
	foreach $j (0 .. $#key_lines){
		$key_lines[$j] =~s/UNABRIDGED KEY LEAD: //;
		
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
