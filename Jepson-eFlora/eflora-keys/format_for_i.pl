#formatter for eFlora that expects input with expanded abbreviations

use strict;

my ($LA,$LB,$LC,$LD,$LE,$LF,$LG);

my ($C16c,$C16d,$C16b,$C16aa,$G,$G1,$G2,$G3,$remain,$exclude);
my ($C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$C10);
my ($C11,$C12,$C13,$C14,$C15,$C16,$C17,$C18,$C19,$C20);
my ($C12b,$C13b,$C14b,$C5b,$C6b,$C6c);
my ($C1a,$C2a,$C3a,$C4a,$C5a,$C6a,$C7a,$C8a,$C9a,$C10a,$C7b,$C8b);
my ($C11a,$C11b,$C12a,$C13a,$C14a,$C15a,$C16a,$C17a,$C18a,$C19a,$C20a);
my %seen_line;
my %indent_level;
my %NAME_TO_CODE;
my %CODE_TO_NAME;
my ($file,$indent_level,$uk,$name_link,$name_anchor,$goto_code,$newline,$target);
my ($key_species,$key_genus,$epithet,$trinomial,$family,$key_name,$key_infra);
my ($key_rank,$indent,$genus,$pixel_indent, $prime_indent);



open (ERR, ">output/keybase_error.txt");

open (FORMAT, ">../eflora_database/input/eflora_keys_formatted-NEW.txt") || die;
open (OUT, ">input/eflora_keys_for_keybase.txt");

open(IN, "../Synonymy/input/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	my ($code,$name,@residue)=split(/\t/);

$name=~s/ X / &times;/;
	#$NAME_CODE{$name}=$code;
	#$TNOAN{$name}=$code;
	#$NAN{$code}=$name;
	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
}

#	foreach(keys(%NAME_TO_CODE)){
#print <<EOP;
#		name: $_
#		code: $NAME_TO_CODE{$_}

#EOP
#	}

#die;


foreach(keys(%NAME_TO_CODE)){
print "$_\n" if m/acutidens/;

#print "$_\n" if m/&times;/;
#print "$_\n";
}
#die;

close(IN);


$file="../eflora_database/input/eflora_treatments.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

	my $all_lines=<IN>;
		
	my @all_pars=split(/\n\n+/,$all_lines);


foreach my $par (@all_pars) {
next if $par =~ m/^KEY_PAR:/;    
next if $par =~ m/^SCI_ED:/;    
next if $par =~ m/^#/;
next if $par =~ m/^Admin/;
next if $par =~ m/^PROOF:/;
next if $par =~ m/^CAPTION:/;

    # --- RESET indentation variables for each new key block ---

    my $indent_level = -1; 
    my %indent_map = (); # Stores the level for each number (e.g., '1' => 0, '2' => 1)
    my $indent = 0;
    my $uk = "";

    # Clean up the paragraph: remove trailing newlines/whitespace
    	$par =~ s/\s+$//;
		$par =~ s/([0-9])-([0-9])/$1&ndash;$2/g;
		$par =~ s/(\d+)'/$1&prime;/g;
		$par =~ s/UNABRIDGED KEY LEAD: //g; 

#delete the unabridged phrase; most of these have been renumbered
#the color change will only show up in the old eFlora; 
#this is not accessible and has problems with mobile accessibility
#unabridged and normals keys are indistriguishable in keybase and herbariadb

#foreach(@all_pars){
###################### KEYS ##########################
#skip Astragalus tephrodes unabridged key lead
next if $par =~ m/UNABRIDGED KEY LEAD: 29a\. Leaflets > 21/;
next if $par =~ m/UNABRIDGED KEY LEAD: 29a' Leaflets <= 21/;

$par =~ s/UNABRIDGED KEY LEAD: //g; 
#delete the unabridged phrase; most of these have been renumbered
#the color change will only show up in the eFlora; 
#unabridged and normals keys are indistriguishable in keybase


#foreach(@all_pars){
###################### KEYS ##########################
		#if( m/^1\./ || m/^UNABRIDGED KEY/ || m/^Group \d+[A-Z]?[.:]/ || m/^Key to Groups/ || m/^Key to Groups Based Primarily on Flowering Material/|| m/^Key to Groups Based on Fruiting Material/|| m/^Key to Pistillate Plants/|| m/^Key to Staminate Plants/|| m/^Key to Vegetative Plants/ || m/^Group \d+ *\n/){
		if( $par =~ m/^(1\.|UNABRIDGED KEY|Group \d+[A-Z]?[.:]|Key to Groups Based .+|Key to Groups|Key to Pistillate Plants|Key to Staminate Plants|Key to Vegetative Plants|Group \d+[ .:])/){

		    $uk = "";
		    $exclude = 0;
		    
		    # 2. Split the paragraph into lines
		    my @lines = split("\n", $par);
		    next unless @lines; # Skip empty paragraphs
	
	    # We use a 'if/elsif' chain so we only shift the header ONCE.
	    
	    if ($lines[0] =~ m/UNABRIDGED KEY/) {
	        ++$LA;
	        print ERR "(1)==>$uk\n";
	    }
	    elsif ($lines[0] =~ /Group \d+/ && $lines[1] =~ /^[A-Z]/) {
	        ++$LB;
	        print ERR "(2)==>$uk\n";
	    }
	    elsif ($lines[0] =~ /Key to (Staminate|Pistillate|Vegetative) Plants/i) {
	        ++$LC;
	        print ERR "(3)==>$uk\n";
	    }
	    elsif ($lines[0] =~ /Key to (Groups|genera|California)/i) {
	        ++$LD;
	        print ERR "(4)==>$uk\n";
	    }
	    elsif ($lines[0] =~ /^Group \d+[: ]*/) {
	        # This catches "Group 1:", "Group 1: Mimosoideae", and "Group 1"
	        ++$LE;
	        print ERR "(5)==>$uk\n";
	    }
	    else{
	    	if ($lines[0] !~ /^\d+(\.|&prime;)/) {
	    		#are there any other missing title types?
	    		print "(6)==>$lines[0]\n";
	    	}
	    }

	   # --- 3. INTELLIGENT TITLE (H3) HANDLING ---
	    # Check if the first line is a "Lead" (starts with a number).
	    # If it is NOT a lead, it's a title. Shift it into $uk.
	    if ($lines[0] !~ /^\d+(\.|&prime;)/) {
	        $uk = shift(@lines);
	        $exclude = 1;
	        # Clean up common title issues
	        #$uk =~ s/UNABRIDGED KEY/Unabridged key/i;
	    }


	    # 4. Clean up the title (Italicize scientific names in titles if present)
	    $uk =~ s/_([^_]+)_/<i>$1<\/i>/g;
	

#foreach(@all_pars){
	    # --- Now proceed to loop through the remaining @parts for the Leads ---

 # --- 3. PROCESS THE LEADS ---
    # Use 'my $line' for clarity and scoping
    foreach my $line (@lines) {

				if( ($line =~ m/--[0-9]+\(--[0-9]/) || ($line =~ m/[0-9]--\)[0-9]+--/) ){
					$line =~ s/(--[0-9]+\()--([0-9]+)/$1$2/g;
					$line =~ s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
				}
				$line =~ s/([0-9])-([0-9])/$1&ndash;$2/;
				$line =~ s/---/&mdash;/g;
				$line =~ s/\.+[-_]*>/--&gt;/g;
				$line =~ s/-->/--&gt;/g;



#foreach(@all_pars){
#if( m/^1\./ ||
#foreach my $line (@lines) {
		
		
		if($line =~ m!--&gt; *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C1";
			++$C1a;
				if($goto_code eq "C1"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C1;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			$line =~ s!--&gt; *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+) *!\t$key_name\tVERBATIM NAME:$1 $2. $3 $4 $5!;
			print ERR qq{1 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		#1' Ann; lvs narrowly elliptic to ovate or obovate.....-> [P. ruderale var. macrocephalum]
		elsif($line =~ m!&gt; *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C2";
			++$C2a;
				if($goto_code eq "C2"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C2;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			$line =~ s!--&gt; *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!\t$key_name\tVERBATIM NAME:$1 [$2. $3 $4 $5]!;
			print ERR qq{2 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		elsif($line =~ m!--&gt; *(most )([A-Z]). ([&;a-z-]+)!){#none match this pattern as of Oct 2019
			$key_species=$3;
			#print "C3 $key_genus $key_species\n\n";
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C3";
			++$C3a;
				if($goto_code eq "C3"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C3;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{3 $key_genus $key_species code=$goto_code\n\n};
			$line =~ s!--&gt; *(most )([A-Z]). ([&;a-z-]+) *!\t$key_name\tVERBATIM NAME:$1 $2. $3!;
		}
		elsif($line =~ m!--&gt; *(\d*)([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			#print "C4 $key_genus $key_species\n\n";
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C4";
			++$C4a;
				if($goto_code eq "C4"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C4;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{4 $key_genus $key_species code=$goto_code\n\n};
			$line =~ s!--&gt; *(\d*)([A-Z]). ([&;a-z-]+) *!\t$key_name\tVERBATIM NAME:$1 $2. $3!;
		}
		elsif($line =~ m!--&gt; *(\d*)([A-Z][A-Z]+) ?(.*)!){
			$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C5";
			++$C5a;
				if($goto_code eq "C5"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C5;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{5 $key_genus code=$goto_code\n\n};
			$line =~ s!--&gt; *(\d*)([A-Z][A-Z]+) ?(.*) *!\t$key_name\tVERBATIM NAME:$2 $3!;
		}
		elsif($line =~ m!--&gt; *\[(\d*)([A-Z][A-Z]+)\] *(.*)!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C6";
			++$C6a;
				if($goto_code eq "C6"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C6;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{6 $key_genus code=$goto_code\n\n};
			$line =~ s!--&gt; *\[(\d*)([A-Z][A-Z]+)\] *(.*) *!\t$key_name\tVERBATIM NAME:[$2] $3!;
		}
		elsif($line =~ m!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C7";
			++$C7a;
				if($goto_code eq "C7"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C7;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{7 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			$line =~ s!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+) *!\t$key_name\tVERBATIM NAME:$1 $2!;
		}
		elsif($line =~ m!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C8";
			++$C8a;
				if($goto_code eq "C8"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C8;
				}
			$key_name = $CODE_TO_NAME{$goto_code};			
			print ERR qq{8 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			$line =~ s!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+\]) *!\t$key_name\tVERBATIM NAME:[$1 $2!;
		}
		elsif($line =~ m!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)\]!){
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C9";
			++$C9a;
				if($goto_code eq "C9"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C9;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{9 $key_genus $key_species code=$goto_code\n\n};
			$line =~ s!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)\]!\t$key_name\tVERBATIM NAME:$1 [$2. $3]!;
		}
		elsif($line =~ m!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+);.*\]!){#none match this pattern as of Oct 2019
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C10";
		++$C10a;
				if($goto_code eq "C10"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C10;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{10 $key_genus $key_species code=$goto_code\n\n};
			$line =~ s!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)(;.*)\]!\t$key_name\tVERBATIM NAME:$1 [$2. $3$4]!;
		}
		elsif($line =~ m!--&gt; *\[(\d*)([A-Z][a-z]+) ([&;a-z-]+)\] *!){
				$key_genus=ucfirst(lc($2))." ".(lc($3));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C11";
		++$C11a;
				if($goto_code eq "C11"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C11;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{11 $key_genus code=$goto_code\n\n};
			$line =~ s!--&gt; *\[(\d*)([A-Z][a-z]+) ([&;a-z-]+)\] *!\t$key_name\tVERBATIM NAME:[$2 $3]!;
		}
		elsif($line =~ m!--&gt; *\[(\d*)([A-Z][a-z]+).*\]!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C11";
		++$C11b;
				if($goto_code eq "C11"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C11;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{11 $key_genus code=$goto_code\n\n};
			$line =~ s!--&gt; *\[(\d*)([A-Z][a-z]+)(.*\]) *!\t$key_name\tVERBATIM NAME:[$2$3!;
		}
		elsif($line =~ m!--&gt; *(\d*)([A-Z][a-z]+) ([^ ]+) *\(.*!){
			$key_genus=ucfirst(lc($2));
			$key_species=$3;
		++$C12a;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C12";
				if($goto_code eq "C12"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C12;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			$line =~ s!--&gt; *(\d*)([A-Z][a-z]+)(.*)(\(.*) *!\t$key_name\tVERBATIM NAME:$2$3$4!;
		}
		#1. Fl radial; calyx, corolla gen inconspicuous; petals free or fused, lobes not overlapped in bud; stamens 5--many, often long-exserted; lf 2-pinnate (simple in alien _Acacia_).....-> Group 1: Mimosoideae
		elsif($line =~ m!--&gt; *Group (\d+[A-Z]*)(: )(.+)!m){
			#$group=$1;
			$key_name="Group ".$1;
			#print qq{FOUND >$family $key_name< code=$group\n\n};
					++$G3;
			print ERR qq{G1 $key_name\n\n};
			$line =~ s!--&gt; *(Group \d+[A-Z]*): ([A-Z][a-z]+)(.+) *!\t$key_name\tVERBATIM NAME:Group $1: $2 $3!;
		}
		elsif($line =~ m!--&gt; *(Group) (\d+[A-Z]*)$!m){
			#print qq{FOUND >$family $1 $2 < code=$group\n\n};
					++$G;
			$key_name = "$1 $2";
			print ERR qq{G1 $key_name\n\n};
			$line =~ s!--&gt; *(Group) (\d+[A-Z]*) *!\t$key_name\tVERBATIM NAME:$1 $2!;
		}
		elsif($line =~ m!--&gt; *(Group) (\d+[A-Z]*)(,.+)$!m){
			#print qq{FOUND >$family $1 $2$3 < code=$group\n\n};
					++$G2;
			$key_name = "$1 $2$3";
			print ERR qq{G1 $key_name\n\n};
			$line =~ s!--&gt; *(Group) (\d+[A-Z]*)(,.+) *!\t$key_name\tVERBATIM NAME:$1 $2$3!;
		}
		elsif($line =~ m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+) (var\.|subsp\.) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target="$2 $3 $4 $5";
			$goto_code= $NAME_TO_CODE{$target} || "C13";
		++$C13a;
				if($goto_code eq "C13"){
					print qq{ERROR >$key_genus $target< code=$goto_code\n\n};
					++$C13;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{13 $target code=$goto_code==>$_\n\n};
			$line =~ s!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*) *!\t$key_name\tVERBATIM NAME:$2 $3$4!;
		}
		elsif($line =~ m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target="$2 $3";
			$goto_code= $NAME_TO_CODE{$target} || "C14";
		++$C14a;
				if($goto_code eq "C14"){
					print qq{ERROR >$key_genus $target< code=$goto_code\n\n};
					++$C14;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{14 $target code=$goto_code $_\n\n};
			$line =~ s!--&gt; *(\d*)([A-Z][a-z]+ [a-z]+)(.*) *!\t$key_name\tVERBATIM NAME:$2$3!;
			#12b Elymus multisetus code=24122 <a href="#ALE33.">33'</a><a name="ALE33'"> </a> Per; spikelets 2(3--4) per node --&gt; Elymus multisetus
		}
		elsif($line =~ m!--&gt; *(\d*)([A-Z][a-z]+)(.*)!){#none match this pattern as of Oct 2019
			$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C15";
		++$C15a;
				if($goto_code eq "C15"){
					print qq{ERROR >$key_genus $target< code=$goto_code\n\n};
					++$C15;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{15 $key_genus code=$goto_code\n\n};
			$line =~ s!--&gt; *(\d*)([A-Z][a-z]+)(.*) *!\t$key_name\tVERBATIM NAME:$2$3!;
		}

		#13. Pinnae fan-shaped, texture delicate, deep green; outer margins finely toothed or crenate; occurring in or very near saturated substrate .....-> sun forms of B. crenulatum(2), see also lead 9
		#6. Trophophore and sporophore joined well below mid-lf, gen at ground level.....-> small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		#<a href="#AO6'">6.</a><a name="AO6."> </a> Trophophore and sporophore joined well below mid-lf, gen at ground level--&gt; small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		elsif($line =~ m!--&gt;.*_[A-Z]. [&;a-z-]+_!){
			++$C16;
		
			if($line =~ m/--&gt; *(.+)_; *_G\. pyrenaicum_\]/){
				$line =~ s!--&gt; (.+)_([A-Z]). ([&;a-z-]+).+!!;
				++$C16a;
#3. Mericarp without basal callus --&gt; [<i>G. palmatum</i>; <i>G. pyrenaicum</i>]
				$key_species=$3;
				$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C16aa";
				if($goto_code eq "C16aa"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C16aa;
				}
			}#this precedes an unabridged key that parses these two out, leaving this in causes problems with formatting
			elsif (m/--&gt; (.+)(geniculata)(, including _A. ovata_)(.+)/){
				$key_species=$2;
				$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C16b";
				if($goto_code eq "C16b"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C16b;
				}
				$key_name = $CODE_TO_NAME{$goto_code};
				print ERR qq{16b $key_genus $key_species code=$goto_code\n\n};
				$line =~ s!--&gt; (.*)_([A-Z])\. ([&;a-z-]+)_!\t$key_name\tVERBATIM NAME:$1 $2. $3!;
			}#this parses the to the wrong name, and no longer has a valid link in the eFlora
			else{
				if($line =~ m!--&gt;(.*)_([A-Z]\. )([&;a-z-]+)_!){
					$key_species=$3;
					$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C16c";
						if($goto_code eq "C16c"){
							print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
							++$C16;
						}
					$key_name = $CODE_TO_NAME{$goto_code};
					print ERR qq{16c $key_genus $key_species code=$goto_code\n\n};
					$line =~ s!--&gt; (.*)_([A-Z])\. ([&;a-z-]+)_!\t$key_name\tVERBATIM NAME:$1 $2. $3!;
				}
			}
		}
		elsif($line =~ m!--&gt; (see couplet \d+)!){#--&gt; see couplet 5
			$line =~ s!--&gt; (.*)! .....&nbsp;$1!;
		++$C18a;
		}
		elsif($line =~ m!--&gt; (\[E\. farinosa &times;)(.+)$!m){
			$target = "Encelia fariosa &times; frutescens";
			$line =~ s!--&gt; *(.*)!\t$target\tVERBATIM NAME:$1$2!;
		++$C17a;
		}
		elsif($line =~ m!--&gt; .*see .*lead \d!){
			$line =~ s!--&gt; *(.*)! .....&nbsp;$1!;#none match this pattern as of Oct 2019
		++$C18a;
		}
		elsif($line =~ m!--&gt; (\(see )_([A-Z][a-z ]+)_(.+)$!m){
			$target=$2;
			$goto_code= $NAME_TO_CODE{$target} || "C19";
				if($goto_code eq "C19"){
					print qq{ERROR >$target< code=$goto_code\n\n};
					++$C19;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			$line =~ s!--&gt; (\(see )_(.+)_(.+) *!\t$key_name $1$3\tVERBATIM NAME:$1<i>$2</i>$3!;
		++$C19a;
		#43. Corolla 24&ndash;30 mm; anther sacs 1.2&ndash;1.6 mm; main upper leaves 45&ndash;90 mm &ndash; common hybrid  .....&nbsp;(see <i>Penstemon centranthifolius</i> description)
		}
		else{
			print ERR "ERROR==>$line \n\n" if m/--&gt;/;
			#print "PROBLEM?  $_\n";
		++$remain;
		}
		
#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){
		
		
#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){


		$line =~ s/--([^&])/&ndash;$1/g;
		$line =~ s|\+/-|&plusmn;|g;
		$line =~ s|\+-|&plusmn;|g;
		$line =~ s/ > or =/ &ge;/g;
		$line =~ s/^UNABRIDGED KEY LEAD: //;

		
		$line =~ s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
		while($line =~ s/_/<i>/){
			$line =~ s/_/<\/i>/;
		}

		$line =~ s/\.\.+&nbsp; +/.....&nbsp;/;
	}#foreach(@lines[0 .. $#lines]){


	my $keybase=join("\n",@lines);

	
#foreach(@all_pars){
#if( m/^1\./ ||

	s/  +/ /g;

$key_name = $CODE_TO_NAME{$name_anchor};

		foreach($uk){
			while(s/_/<i>/){
				s/_/<\/i>/;
			}
			s/---/&mdash;/g;
			s/--/&ndash;/g;
			s|\+-|&plusmn;|g;
		}
				my @keyvalues = split('\n', $keybase);

#this creates a split version of this file, with all lines of a key in a format with fields ready to be formatted for a SQL database
					#foreach my $k (@keyvalues) {
					#	#print "$k: $keyvalues{$k}\n";
					#	print OUT2 $name_anchor."\t".$uk."\t".$key_name."\t".$k."\n";
					#}

	if(length($uk) > 2){
		print OUT $uk."\n";
		print ERR "KEY: $name_anchor\n\n";
	}
	else{
		print ERR "KEY: $name_anchor\n\n";
		print OUT $key_name."\t".$name_anchor."\n".$keybase."\n##########END OF KEY\n";
	}


    foreach my $line (@keyvalues) {

# --- 4. CLEANUP LINK STYLES ---
# Ensure any generated species links use the .key-link class for WCAG targets
			$line =~ s|<a href="#([^"]+)">\.\.\.\.\.&nbsp;(.*?)</a>|.....<a href="#$1" class="key-link">$2</a>|g;

			$line =~ s/  +/ /g;


        
	        # Match 1. or 2. (Primary Leads)
	        if ($line =~ s|^(\d+)(\.)| <span class="key-number"><a href="#$genus${1}_prime" id="$genus$1">$1$2</a></span> |g) {
	            $indent_level++;
	            $indent_map{$1} = $indent_level;
	            $indent = $indent_level;
	        } 
	        # Match 1' or 2' or 1&prime; (Prime Leads)
	        elsif ($line =~ s|^(\d+)(&prime;)| <span class="key-number"><a href="#$genus${1}" id="$genus${1}_prime">$1$2</a></span> |g) {
	            $indent = $indent_map{$1} // 0; 
	            $indent_level = $indent; # Reset level so children of 1' start from the right depth
	        }
	
	        # Calculate pixel indent
	        my $pixel_indent = $indent * 7;
	
	        # --- 4. WRAP IN SEMANTIC HTML ---
	        # First, wrap the text following the number in the key-content div
	        $line =~ s|</span>\s*(.*)|</span><div class="key-content">$1</div>|g;
	        
	        # Then, wrap the whole thing in the key-row div
	        $line = qq|<div class="key-row indent-$pixel_indent">$line</div>|;
			$line =~ s/ \t/\t/g;
	} #foreach my $line (@lines)


my $base_key_name = "Key to ".$CODE_TO_NAME{$name_anchor};


	    # --- 5. FINAL ASSEMBLY ---
	    # Join lines back together
	    my $key_body = join(" ", @keyvalues);
	    my $h3_header = $uk ? "<h3>$uk</h3>\n" : "";
	
		if($exclude==1){
			if ($key_body !~ /\S/) { # if there is no actual text
				if($h3_header =~ /\S/) { # Only print if there is actual title text
					print FORMAT $base_key_name . " " .$name_anchor .
						"######START TITLE###<section class=\"key-container\">".$h3_header."</section>\n##########END\n";
				}
			}
		}
		else{
		    if ($key_body =~ /\S/) { # Only print if there is actual text
		        print FORMAT $base_key_name . " " . $name_anchor . 
		              "######START KEY BODY###<section class=\"key-container\">".$key_body."</section>\n##########END\n";
		    }
		}




	#next;
}#if( m/^1\./ ||
######################################################END OF KEY SECTION

######################################################BEGIN PROCESS FIELDS

		

#foreach(@all_pars){
#The /m modifier allows you to use those anchors to represent the beginning and end of a line, respectively.
#The /m modifier is similar to the /s modifier. 
#You can think of /s as "single line" in that it changes the meaning of the character class shortcut . (the period symbol)
# so that it matches any character on a single line and does not run on to the next line.

		if($par =~ m/^([A-Z]+ACEAE) \(([A-Z][a-z]+)\)$/ms){
			$family = ucfirst(lc($1));
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
print "2\n" if $name_anchor==76377;
			}			
			else {
				print ERR "FAMILY 1: $key_genus not found in lists\n\n";
			}
		}#if(s|^([A-Z]+ACEAE)

		if($par =~ m/^([A-Z]+ACEAE)$/ms){
			$family = ucfirst(lc($1));
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
#print "2\n" if $name_anchor==76377;
			}			
			else {
				print ERR "FAMILY 2: $key_genus not found in lists\n\n";
			}
		}#if(s|^([A-Z]+ACEAE)



		
		if($par =~ m/^([A-Z]+)$/ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));
			
			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
#print "4\n" if $name_anchor==76377;
			}

		}


			if($par =~m/UNABRIDGED\n([A-Z-]+)\n(COMMON|TJM|HABIT)/){
				$key_genus=$1;
				$key_genus=ucfirst(lc($key_genus));
			
				if($NAME_TO_CODE{$key_genus}){
					$name_anchor = $NAME_TO_CODE{$key_genus};
#print "4\n" if $name_anchor==76377;
				}

			}


		if($par =~ m/(NATIVE|NATURALIZED)\n([A-Z]+) ([a-z]+)/ms){
			$key_genus=$2;
			$key_species=$3;
			$key_genus=ucfirst(lc($key_genus));
			
		}


#foreach(@all_pars){
############GET infra name for links
		if($par =~ m/^([A-Z][A-Z]+) +([a-z-]+).*(var\.|nothosubsp\.|subsp\.) ([a-z-]+) *\n/m){
#SAGITTARIA montevidensis Cham. & Schltdl. subsp. calycina
			$key_species=$2;
			$name_link=ucfirst(lc("$1 $2 $3 $4"));
#print "1 NL $name_link\n";

			if($NAME_TO_CODE{$name_link}){
				$name_anchor = $NAME_TO_CODE{$name_link};
#print "6\n" if $name_anchor==76377;
			}
			else{
				print ERR "INFRA NAME LINK 1. NO $name_link in SMASCH TAXON IDS\n\n";
				$name_link= "flabba0";
			}
#print "$name_link\n";
		}#if(m/^([A-Z][A-Z]+) +
		
		
		
#foreach(@all_pars){
############GET hybrid name for links
		elsif($par =~ m|^([A-Z][A-Z]+) +(&times;[a-z-]+) *\n|m){
			$trinomial="$1 $2";
#print "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
#print "2 NL $name_link\n";
			
				if($NAME_TO_CODE{$name_link}){
					$name_anchor = $NAME_TO_CODE{$name_link};
				}#if($NAME_TO_CODE
				else{
					print ERR "HYBRID NAME LINK 2. NO $name_link in SMASCH TAXON IDS\n\n";
					$name_link= "flabba1";
				}
		}#elsif(m|^([A-Z][A-Z]+)

#foreach(@all_pars){
############GET name for links
		elsif($par =~ m|^([A-Z][A-Z]+) +([a-z-]+) *\n|m){
			$trinomial="$1 $2";
			$key_species=$2;
#print "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
#			$name_link=~s/ x / X /;
#print "2 NL $name_link\n";

				if($NAME_TO_CODE{$name_link}){
					$name_anchor = $NAME_TO_CODE{$name_link};
#print "8\n" if $name_anchor==76377;
				}
				else{
					print ERR "1. NO NAME_TO_CODE ${name_link}<\n\n";
					#die "Missing name in NAME_TO_CODE: $name_link. Terminating load\n";
					$name_link= "flabba2";
				}

		}#elsif(m|^([A-Z][A-Z]+)
		else{
		#print "END OF LINES==>>>$_\n";
		}
		
#foreach(@all_pars){

			if($par =~ m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				$par =~s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				$par =~s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}

		$par =~s/([0-9])-([0-9])/$1&ndash;$2/;

		while($par =~s/_/<i>/){
			$par =~s/_/<\/i>/;
		}

######end of field processing



}#foreach(@all_pars){


print <<EOP;
C1a Names FOUND: $C1a
C2a Names FOUND: $C2a
C3a Names FOUND: $C3a
C4a Names FOUND: $C4a
C5a Names FOUND: $C5a
C6a Names FOUND: $C6a
C7a Names FOUND: $C7a
C8a Names FOUND: $C8a
C9a Names FOUND: $C9a
C10a Names FOUND: $C10a
C11a Names FOUND: $C11a
C11b Names FOUND: $C11b
C12a Names FOUND: $C12a
C13a Names FOUND: $C13a
C14a Names FOUND: $C14a
C15a Names FOUND: $C15a
C16 Names FOUND: $C16
C16a Names FOUND: $C16a
C17a Names FOUND: $C17a
C18a Names FOUND: $C18a
C19a Names FOUND: $C19a


Problem C1 Names: $C1
Problem C2 Names: $C2
Problem C3 Names: $C3
Problem C4 Names: $C4
Problem C5 Names: $C5
Problem C6 Names: $C6
Problem C7 Names: $C7
Problem C8 Names: $C8
Problem C9 Names: $C9
Problem C10 Names: $C10
Problem C11 Names: $C11
Problem C12 Names: $C12
Problem C13 Names: $C13
Problem C14 Names: $C14
Problem C15 Names: $C15
Problem C16a Names: $C16aa
Problem C16b Names: $C16b
Problem C16c Names: $C16c
Problem C19 Names: $C19

Other Names(1): $C17
Other Names(2): $C18
Other Names(3): $C19

Key Group Names Found(1): $G
Key Group Names Found(2): $G2
Key Group Names Found(2): $G3

Error Key Names: $remain

UNAB Key Title Names Found(1): $LA
Key Title Names Found(2): $LB
VEG/PIST/STAM Title Names Found(3): $LC
Key Title Names Found(4): $LD
Group XX: XXXXXXX Key Title Names Found(5): $LE
Group XX: Key Title Names Found(6): $LF


EOP

