#chmod a+x hb2
use BerkeleyDB;

my $this_year = "2026";
my $today=scalar(localtime());
warn "Today is $today\n";
#my %month_code_hash = &month_name_hash; 
my %month_hash = &month_hash;
my %month_counts; # This hash will store your totals

open(IN, "eflora_database/input/_hb2.pl") || die;
open(OUT, ">eflora_database/output/hb2") || die;
	while(<IN>){
		print OUT;
		last if m/^__END__/; # exit when at end of the script portion of the file
	}
close(IN);

open(OUT2, ">heath_bar_output_$today.txt") || die;

#data files
open(IN, "Synonymy/input/smasch_taxon_ids.txt") || die "Couldn't open the TID file\n";
	while(<IN>){
		chomp;
		($code,$name,$residue)=split(/\t/);
		$CODE_TO_NAME{$code}=$name;
		$NAME_TO_CODE{$name}=$code;
	}
close(IN);





$CDL_DBM_file="../CCHV2/bulkload/output/db/CCH1_DBM";
$CDL_nomsyn_file="../CCHV2/bulkload/output/db/CCH1_SYNONYMY";

tie(%nomsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_nomsyn_file", -Flags=>DB_RDONLY)|| die "$!";
	while(($key,$value)=each(%nomsyns)){

				@VAL=split(/\t/,$value);

				my $SYNtid = $key;
				my $SYN = $VAL[0];
				my $STAT = $VAL[1];
				my $ACCtid = $VAL[2];
				my $ACC = $VAL[3];

			if ($ACC =~ m/^(NULL| *)$/){
				$ACC = $SYN;
				$ACCtid = $SYNtid;
			}

			if($STAT !~ m/^(NULL| *)$/){
				if($STAT =~ m/[0-9], acc/){
					print $STAT."\n\n" unless $seen{$STAT}++;
					$acctidFound{$SYNtid}++;
					$accFound{$SYN}++;
					++$found unless $seen{$SYNtid}++;
				}
			}
			
				$NOMSYN{$SYNtid}=$ACCtid;
		#print "$SYNtid-$SYN becomes $ACCtid-$accepted\n" if $key=~/4291/;

print OUT2 "$SYNtid-$SYN becomes $ACCtid-$accepted\n";
		#print "$SYNtid-key becomes $ACCtid-$value\n";

}

print <<EOP;
Accepted names in CCH SYNS found: $found

EOP

#die;


open(IN, "eflora_database/output/accepted_name_list.txt") || die; #output from the current eflora database script with accepted names
warn "reading Accepted names\n";
while(<IN>){
chomp;

my $accName = $_;

	if ($accName !~ m/aceae$/){ #skip family
		if ($accName !~ m/^[A-z][a-z-]+$/){ #skip genera
			++$efACC;
			$ACC{$accName}++;

			if ($accFound{$accName} eq ""){
				print "Current Revision name not in CCH1 SYNS: ".$accName."\n\n";
				++$MIS;
			}
		}
	}




}
	close(IN);

print <<EOP;
Accepted names in eFlora found: $efACC

Accepted names in eFlora NOT found in CCH1 SYNS: $MIS

If this number is not close to zero, then the current revision has not been added to the CCH1 SYNS table or the CCH SYNONYM hash needs updated

EOP

#die;

tie %CDL, "BerkeleyDB::Hash", -Filename=>"$CDL_DBM_file", -Flags=>DB_RDONLY or die "Cannot open file CDL_DBM: $! $BerkeleyDB::Error\n" ;
#CDL is the pre-2018 name of the CCH1 hash table, CDL California Digital Library
#CDL funded the first CCH website
#this is kept here for now
#get list of relevent names, this is the old format that predates the eflora php scripts
#<a href="/cgi-bin/get_IJM.pl?tid=29483">        Jacaranda mimosifolia</a><br>
#<a href="/cgi-bin/get_IJM.pl?tid=4770"> Jacobaea vulgaris*</a><br>

while(($key,$value)=each(%CDL)){
	@fields=split(/\t/,$value);
	#CDL 2018 taxon ID was $fields[0]
	#CCH1 search hash table taxon ID is fields
	my $tid=$fields[1];
	my $id=$fields[0];
	my $sciName = $fields[2];
	
		if ($fields[8] =~ /(Ensenada|Mexicali|Tecate|Tijuana|Rosarito)/){
			#warn "$taxon skipped, Mexican county\n";
			next; #verbatimCounty
		}
		elsif ($fields[15] =~ /(Ensenada|Mexicali|Tecate|Tijuana|Rosarito)/){
			#warn "$taxon skipped, Mexican county\n";
			next;#county_correction
		}
		elsif ($fields[31] =~ /(Ensenada|Mexicali|Tecate|Tijuana|Rosarito)/){
			#warn "$taxon skipped, Mexican county\n";
			next;#CountyGeoRefFla
		}

		if ($fields[11] !~ m/^(NULL| *$)/){
			if ($fields[11] < 32.53){
				#warn $sciName." skipped, ".$fields[11]." south of California\n";
				++$skip;
				next;
			}
		}
		
	next if $sciName =~ m/aceae$/; #skip specimens ID'd only to family
	next if $sciName =~ m/^[A-Z][a-z-]+$/;	#skip specimens ID'd only to genera
	
	
	foreach ($tid){
		if ($NOMSYN{$tid} eq ""){
			print OUT2 "Accepted name not in NomSyn Table-->".$sciName."\n";
			++$NO;
		}

	}	
		

	
	next unless $fields[5];
	#next if $fields[5] =~ m/^(NULL| *)$/; #skip null dates numbers
	$fields[7] =~s/ +//g;
	next if $seen{"$sciName$fields[5]$fields[7]"}++;
	
	print OUT2 "==>Heath_Bar_unique_identifier: $sciName$fields[5]$fields[7]\n";
	#print "==>Heath_Bar_unique_identifier: $sciName$fields[5]$fields[7]\n";
	
	my $EJD = $fields[4];
	
	if($EJD !~ m/^(NULL| *$)/){
		++$DD;

		my $year = $EJD;
		my $mo = $EJD;
		my $day = $EJD;
		$year =~ s/^([0-9][0-9][0-9][0-9])[0-9][0-9][0-9][0-9]$/$1/;
		$mo =~ s/^[0-9][0-9][0-9][0-9]([0-9][0-9])[0-9][0-9]$/$1/;
		$day =~ s/^[0-9][0-9][0-9][0-9][0-9][0-9]([0-9][0-9])$/$1/;

		#next if $seen4{$fields[3].$fields[5]}++;
		if ($year > $this_year){
			warn "BAD YEAR $year $EJD\n";
			++$BAD;
			$MM = "";
			next;#skip invalid years
		}
		elsif ($mo =~ m/^(00|13|14|15)$/){
			#warn "BAD MONTH $mo $EJD\n";
			++$BAD;
			$MM = "";
			next; #skip invalid months
		}
		elsif ($day =~ m/^(00|3[2-9])$/){
			#warn "BAD DAY $day $EJD\n";
			++$BAD;
			$MM = &get_month_number($mo, $id, %month_hash);
		#good month but bad day, this still can pass through
		} else {
			$MM = &get_month_number($mo, $id, %month_hash);
		}
    
    	if ($MM ne ""){
    		++$PASS;
    		# 1. Your snippet maps the digit to a name
    		my $month = ("", "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")[$MM];
	
    		# 2. Increment the count per taxon ID for that specific month name
    		$month_counts{$tid}{$month}++;
		}

			$total{$tid}++;
	}
}

print OUT "\n"; #print a hard return at the end.
# otherwise the first TID below prints on same line as the END line of _hb2
#die;
	foreach $tid (sort(keys(%month_counts))){
		print OUT "$tid"; #3. Print the starting with taxonID
		print "$tid\t";

		# 4. Print month hash results
			foreach my $m ("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
			               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec") {
			    printf("%s: %d\t", $m, $month_counts{$tid}{$m} // 0);
				print OUT  (" ", $month_counts{$tid}{$m} // 0);
			}

		print OUT2 "$sciName\t$tid\tn=$total{$sciName}\n";
		print OUT " ($total{$tid})\n";
		print "\t($total{$tid})\n";  
	}
	

print <<EOP;

Specimens with EJD dates: $DD
Specimens with valid EJD dates (no zero years, months or days):$PASS

Mexico specimen skipped: $skip

CCH1 Accepted name not in CCH1 Synonyms: $NO

EOP


sub month_hash {
#returns a month number hash from the various strings that are used to represent months
#use as input for the get_month_number subroutine

my %month_number=(
'1'=>1,
'01'=>1,
'jan'=>1,
'Jan'=>1,
'JAN'=>1,
'January'=>1,
'january'=>1,
'I'=>1,

'2'=>2,
'02'=>2,
'feb'=>2,
'Feb'=>2,
'FEB'=>2,
'February'=>2,
'february'=>2,
'II'=>2,

'3'=>3,
'03'=>3,
'mar'=>3,
'Mar'=>3,
'MAR'=>3,
'Maro'=>3,
'March'=>3,
'march'=>3,
'III'=>3,

'4'=>4,
'04'=>4,
'apr'=>4,
'Apr'=>4,
'APR'=>4,
'April'=>4,
'april'=>4,
'Arpil'=>4,
'IV'=>4,

'5'=>5,
'05'=>5,
'may'=>5,
'May'=>5,
'MAY'=>5,
'nay'=>5,
'V'=>5,

'6'=>6,
'06'=>6,
'jun'=>6,
'Jun'=>6,
'JUN'=>6,
'June'=>6,
'june'=>6,
'VI'=>6,

'7'=>7,
'07'=>7,
'jul'=>7,
'Jul'=>7,
'JUL'=>7,
'JULY'=>7,
'July'=>7,
'july'=>7,
'VII'=>7,

'8'=>8,
'08'=>8,
'aug'=>8,
'Aug'=>8,
'AUG'=>8,
'Augu'=>8,
'August'=>8,
'august'=>8,
'VIII'=>8,

'9'=>9,
'09'=>9,
'sep'=>9,
'Sep'=>9,
'SEP'=>9,
'SEPT'=>9,
'sept'=>9,
'Sept'=>9,
'September'=>9,
'september'=>9,
'IX'=>9,

'10'=>10,
'oct'=>10,
'Oct'=>10,
'OCT'=>10,
'october'=>10,
'October'=>10,
'X'=>10,

'11'=>11,
'nov'=>11,
'Nov'=>11,
'NOV'=>11,
'november'=>11,
'November'=>11,
'XI'=>11,

'12'=>12,
'dec'=>12,
'Dec'=>12,
'DEC'=>12,
'december'=>12,
'December'=>12,
'XII'=>12
);

return %month_number; 
}

sub get_month_number {
#takes a month string as input
#if the month string is not recognized, add it to the %month_number translation table
#if a numeric month is input, that is fine
#however leading zeroes are removed
#if a null month is put in, a null value is returned
#the %month_number was previously on its own in this perl module as %monthno
#if a script is trying to call that, use this subroutine instead

my ($month_string, $id, %month_number) = @_;

#check that the number of input arguments is correct
#each key-value pair in a hash is counted as two arguments
#so the total should be double the hash keys count, plus 2
$hash_count = keys %month_number;
$expected_total = (($hash_count * 2) + 2);

if (@_ != $expected_total){
	print "&get_month_number used incorrectly\n";
	print 'proper usage is &get_month_number ($month_string, %month_number, $id);'."\n";
	print "get %month_number by running &month_hash\n";
	die;
}
elsif (@_ < 12){
	print "too few arguments in the hash sent to &get_month_number\n"; 
	print "Is the %month_number hash being properly generated by &month_hash?\n";
	die;
}

if ($month_string){
	#convert month string to number
	$monthno = $month_number{$month_string};
}
else {
	return ""; # if input month is null, output is null, and that's fine
}

#check if result is a number between 1 and 12, null and report if not.
unless ($monthno=~/^(\d+)$/){
	unless ($monthno >= 1 || $monthno <=12){
		&log_change ("DATE CCH.pm: month string ($month_string) in record $id not translated to numeric month, month nulled\t--\tplease add the string ($month_string) to the translation table in &month_hash\n");
		return "";
	}
}
return "$monthno";
}


