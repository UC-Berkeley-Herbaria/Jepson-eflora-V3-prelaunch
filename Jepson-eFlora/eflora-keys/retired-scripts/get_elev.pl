use BerkeleyDB;
 my $filename = "input/hash/JEPS_elev.hash";
    tie %jeps_elev, "BerkeleyDB::Hash",
                -Filename => $filename,
        or die "Cannot open file $filename: $! $BerkeleyDB::Error\n" ;

open(IN,"/Users/Shared/Jepson-Master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
chomp;
($code,$name)=split(/\t/);
$TNOAN{$name}=$code;
}
open(WARNING,">output/stderr.txt") || die;
$/="";
$file="/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_database/input/eflora_treatments.txt";
open(IN,$file) || die "couldn't open $file\n";
while(<IN>){
	($first_line)=m/^(.*)/;
	if(m/([A-Z]+ACEAE)/){
		$family=$1;
		#print "$family\n";
	}
	if( m/NATIVE/){
		$nativity="NAT";
	}
	else{
		$nativity="EXO";
	}
    	if(m/([A-Z-]+ .*)\nTAXON AUTHOR/){
        	$name=&strip_name($1);
    	}
    	elsif(m/^(NATIVE OR NATURALIZED|NATIVE|NATURALIZED|POSSIBLY IN CA|WAIF|EXTIRPATED ALIEN|EXTIRPATED WAIF|EXTIRPATED WEED|EXTIRPATED|HISTORICAL WAIF|SPONTANEOUS HYBRID|AGRICULTURAL WEED|GARDEN WEED|URBAN WEED|GARDEN AND URBAN WEED|AGRICULTURAL, GARDEN, OR URBAN WEED|URBAN WEED EXPECTED IN WILDLANDS)\n([A-Z-]+ +.+)/||
			m/^UNABRIDGED\n(HISTORICAL WAIF|AGRICULTURAL, GARDEN, OR URBAN WEED|URBAN WEED.*|AGRICULTURAL WEED|GARDEN WEED|GARDEN AND URBAN WEED|CULTIVATED PLANT|EXTIRPATED ALIEN|EXTIRPATED WEED|EXTIRPATED WAIF|NATIVE OR NATURALIZED|NATIVE|NATURALIZED|WAIF|SPONTANEOUS HYBRID)\n([A-Z-]+ +.+)/||
			m/^(NATIVE)\nEXTIRPATED\n([A-Z-]+ +.+)/){
        		$name=&strip_name($2);
		}
		else{
			print WARNING "skipping $first_line following $name\n";
			next;
		}
#print "$name\n" if $nativity eq "N";
#next;
	if(($elevation)=m/ELEVATION: (.*)/){
		if(m/UNABR.*elevation/){
			$comment=2;
		}
		else{
			$comment=1;
		}
		$max_e=$min_e="";
				if($elevation=~m/([0-9-]+)--([0-9-]+)/){
					$max_e=$2; $min_e=$1;
				}
				elsif($elevation=~m/([0-9-]+), ([0-9-]+)/){ #added to parse the elevation range for B. serpenticola which is 1100, 2100 m
					$max_e=$2; $min_e=$1;
				}
				elsif($elevation=~m/<=? *([0-9]+)/){
					$max_e=$1; $min_e=0;
				}
				elsif($elevation=~m/>=? *([0-9]+)/){
					$max_e=4300; $min_e=$1;
				}
				elsif($elevation=~m/\+- *([0-9]+)/){
					$max_e=$1; $min_e=$1;
				}
				elsif($elevation=~m/(^[0-9]+) m/){
					$max_e=$1; $min_e=$1;
				}
				else{
					print "$name $elevation\n";
				}
				$max_e=0 if $max_e <0;
				$min_e=0 if $min_e <0;
				$max_e= $min_e=0 if $elevation=~/below.*tide/;
				$native{$name}{max}=$max_e;
				$native{$name}{min}=$min_e;
				#print "ACC==>$name\t$min_e\t$max_e\n";
$jeps_elev{$name}="$min_e\t$max_e";
				if(m/SYNONYMS: (.*)/){
					s/&eacute;//g;
					s/&\#\d+;//g;
					#s/&\#263;//g;
					
					s/probably / /g;
					
					while(s/SYNONYMS: +(.*)//){
						
                                		@syns=split(/; +/,$1);
                                		foreach(@syns){
                                        		s/Expanded author citation: //;
                                        		s/_//g;
                                        		
							next if s/, .*//;
                                        		$name= &strip_name($_);
#$jeps_elev{$name}="$min_e\t$max_e";
                                        		print "ELEV SYNS==>$name\t$min_e\t$max_e\n";
                                		}
                        		}
				}
			}
		}
untie(%jeps_elev);

foreach $name (sort(keys(%native))){
#print "$TNOAN{$name} $native{$name}{max}\n" if ($native{$name}{max} && $native{$name}{max}< 300);
}

sub strip_name{
local($_) = @_;
			s/ \{\/.*//;
			s/\/\{.*//;
			s/ *\{.*//;
s/&times;/ x /;
       s/^([A-Z][-A-Za-z]+) *([xX]? *[-a-z]+).*\b(nothovar\.|nothosubsp\.|subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $4/ ||
s/^([A-Z][A-Za-z]+) ([-a-z]+).*/$1 $2/ ||
s/^([A-Z][A-Za-z]+) *(x [-a-z]+).*/$1 $2/ ||
s/^([x] *[A-Z][A-Za-z]+) *([x ]*[-a-z]+).*/$1 $2/ ||
s/ (nothosubsp\.|nothovar\.|\subsp\.|ssp\.|var\.|f\.) / /;
#return ucfirst((lc($_)));
return (lc($_));
}
