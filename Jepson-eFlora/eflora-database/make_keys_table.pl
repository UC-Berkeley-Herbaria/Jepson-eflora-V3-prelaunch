#use strict;
#use warnings;
use POSIX qw(strftime);




#my $load_date = "2023-12-23";
#my $load_date = "2024-02-29";
#my $load_date = "2025-10-29";
#my $load_date = "2026-03-06";
#my $load_date = "2026-06-11";
#my $load_date = "2026-09-26";
#my $load_date = "2026-10-08";
#my $load_date = "2026-10-09";
#my $load_date = "2026-10-10";
#my $load_date = "2026-10-12";
#my $load_date = "2026-10-13";
#my $load_date = "2026-10-19";
my $load_date = "2026-10-20";


my $todayJD = &get_today;
$todayJD =~ s/ *PDT//;
$todayJD =~ s/ *PST//;

$log_file = 'output/eflora_log'.$todayJD.'.txt';
	open(LOG, '>>', $log_file);


#mariaDB
#open(EF, ">output/load_eflora_carex_keys.sql") || die;
#open(EF, ">output/load_eflora_asteraceae_keys.sql") || die;
#open(EF, ">output/load_eflora_fabaceae_keys.sql") || die;
#open(EF, ">output/load_eflora_eriogonum_keys.sql") || die;
#open(EF, ">output/load_eflora_poaceae_keys.sql") || die;
#open(EF, ">output/load_eflora_brassicaceae_keys.sql") || die;
#open(EF, ">output/load_eflora_salix_keys.sql") || die;
#open(EF, ">output/load_eflora_juncus_keys.sql") || die;
#open(EF, ">output/load_eflora_malacothamnus_keys.sql") || die;
#open(EF, ">output/load_eflora_navarretia_keys.sql") || die;
#open(EF, ">output/load_eflora_penstemon_keys.sql") || die;
#open(EF, ">output/load_eflora_phacelia_keys.sql") || die;
#open(EF, ">output/load_eflora_trifolium_keys.sql") || die;
#open(EF, ">output/load_eflora_astragalus_keys.sql") || die;




#Key to Bassia 11492######START KEY BODY###<section class="key-container"><div class="key-row indent-0"> <span class="key-number"><a href="#1_prime" id="1">1.</a></span><div class="key-content"><span class="term-trigger" tabindex="0">Calyx<span class="term-popup">Collective term for sepals; outermost or lowermost whorl of flower parts, generally green and enclosing remainder of flower in bud.  Sometimes indistinguishable from corolla.</span></span> densely tan-woolly,&nbsp;<span class="term-trigger" tabindex="0">spines<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)</span></span> hooked	Bassia hyssopifolia	VERBATIM NAME: B. hyssopifolia</div></div>  <div class="key-row indent-0"> <span class="key-number"><a href="#1" id="1_prime">1&prime;</a></span><div class="key-content"><span class="term-trigger" tabindex="0">Calyx<span class="term-popup">Collective term for sepals; outermost or lowermost whorl of flower parts, generally green and enclosing remainder of flower in bud.  Sometimes indistinguishable from corolla.</span></span>&nbsp;<span class="term-trigger" tabindex="0">glabrous<span class="term-popup">Without hairs.</span></span> to thinly appressed-hairy,&nbsp;<span class="term-trigger" tabindex="0">bisexual<span class="term-popup"><img src="/eflora/common/images/morph/bisexual-flower.jpg" class="term-img" alt="Morphology: bisexual">Both male and female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inflorescence).</span></span> flowers with&nbsp;<span class="term-trigger" tabindex="0">tubercles<span class="term-popup">Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)</span></span> or&nbsp;<span class="term-trigger" tabindex="0">wings<span class="term-popup">1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals.</span></span> < 2 mm	Bassia scoparia	VERBATIM NAME: B. scoparia</div></div></section>
##########END


#open(IN, "../eflora_keys/output/eflora_carex_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_asteraceae_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_fabaceae_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_eriogonum_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_poaceae_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_brassicaceae_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_salix_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_juncus_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_malacothamnus_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_navarretia_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_penstemon_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_phacelia_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_trifolium_keys_expanded-SQL.html") || die;
#open(IN, "../eflora_keys/output/eflora_astragalus_keys_expanded-SQL.html") || die;


#open(IN, $data_path."/text.txt") || die;
#open(IN, "../eflora_keys/output/eflora_keys_expanded-SQL.html") || die;
while(<IN>){
	chomp;
	
	#f01287-01.txt	Agave shawii var. shawii
	($key_text) = split(/##########END\n/);

next if m/##########END/;

#Escaping single quotes for SQL insert
	$key_text =~ s/'/''/g;

#for the full version of the file, do not load any keys that have been hand revised
	 next if $key_text =~ m|</h3> 8902######START|g; #carex group keys
	 next if $key_text =~ m|</h3> 58######START|g; #asteraceae group keys
	 next if $key_text =~ m|</h3> 134######START|g; #fabaceae group keys
	 next if $key_text =~ m|</h3> 11209######START|g; #eriogonum group keys
	 next if $key_text =~ m|</h3> 223######START|g; #poaceae group keys
	 next if $key_text =~ m|</h3> 9887######START|g; #salix group keys
	 next if $key_text =~ m|</h3> 70######START|g; #brassicaceae group keys
	 next if $key_text =~ m|</h3> 9148######START|g; #juncus group keys
	 next if $key_text =~ m|</h3> 9579######START|g; #Malacothamnus group keys
	 next if $key_text =~ m|</h3> 8874######START|g; #Navarretia group keys
	next if $key_text =~ m|</h3> 11396######START|g; #Penstemon group keys
	next if $key_text =~ m|</h3> 9655######START|g; #Phacelia group keys
	 next if $key_text =~ m|</h3> 10383######START|g; #trifolium group keys
	 next if $key_text =~ m|</h3> 9291######START|g; #astragalus group keys



#<h3>Key to Groups of Carex</h3> 8902######START KEY BODY###
#<h3>Key to Groups of Asteraceae</h3> 58######START KEY BODY###
	if ($key_text =~ m/(<h3>Key to Groups of) ([A-Za-z-]+)(<\/h3>) +(\d+)######START KEY BODY###/){
		$title = $1." ".$2.$3;
		$tid = $4;
		$taxon = $2;
		$key_text =~ s/^.+\d+######START KEY BODY###(<section.+)/$1/g;
		++$key_count;
	}
	elsif ($key_text =~ m/(<h3>Key to Groups of) ([A-Za-z-]+): +(.+<\/h3>) +(\d+)######START KEY BODY###/){
		$title = $1." ".$2.": ".$3;
		$tid = $4;
		$taxon = $2;
		$key_text =~ s/^.+\d+######START KEY BODY###(<section.+)/$1/g;
		++$key_count;
	}
	#<h3>Key to Asteraceae Group
	#elsif ($key_text =~ m/(<h3>Key to) (Asteraceae|Brassicaceae|Carex|Eriogonum|Fabaceae|Juncus|Poaceae|Salix) (Group [1-9][0-9]?[A-Z]?): +(.+<\/h3>) +(\d+)######START KEY BODY###<section/){
	elsif ($key_text =~ m/(<h3>Key to) (Astragalus|Navarretia|Malacothamnus|Phacelia|Penstemon|Trifolium) (Group [1-9][0-9]?[A-Z]?): +(.+<\/h3>) +(\d+)######START KEY BODY###<section/){
		$title = $1." ".$2." ".$3.": ".$4;
		$tid = $5;
		$taxon = $2." ".$3;
		$key_text =~ s/^.+\d+######START KEY BODY###(<section.+)/$1/g;
		++$key_count;
	}

#8902######START KEY BODY###<section class="key-container
#Key to Phacelia 9655######START TITLE###<section class="key-container"><h3>Group 3: Annual from slender taproot; most cauline leaf blades entire to shallowly lobed (proximal-most sometimes deeply few-lobed at base, but sinuses generally not reaching #midrib)</h3>
#</section>
###########END	
	#if ($key_text =~ m/^(Key to (.+)) (\d+)######START TITLE###/){
	#	$title = $1;
	#	$tid = $3;
	#	$taxon = $2;
	#	$key_text =~ s/^.+######START TITLE###(.+)/$1/g;
	#}
	

	#this used to be done by get_IJM.pl, but this does not seem to be a issue anymore.  
	#There does not seem to be any section of
	#the format_for_i script that makes a <sp_list> tag, commented out for now
			#if($entry=~s/<sp_list>(.*)<\/sp_list>//){
			#	@taxa=split(/,/,$1);
			#	foreach(@taxa){
			#	s!.*!<OPTION VALUE="http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$&">$NAN{$&}\n!;
			#	}
			#}

	
$HasKey = "1";
	#single quotes for SQL are added in the print OUT
	if ( ($tid =~ /^\d+$/) && ($title ne "") && ($taxon ne "") && ($key_text ne "") ){
#if ( ($tid =~ /^\d+$/) ){
#mariaDB export
		print EF "INSERT INTO eflora_keys(TaxonID, Title, ScientificName, HasKey, KeyText, Updated)\n";
		print EF "VALUES(".$tid.", '".$title."', '".$taxon."', ".$HasKey.", '".$key_text."', '".$load_date."')\n";
		#If the TaxonID in eflora_keys already exists, update selected fields only 
		print EF "ON DUPLICATE KEY UPDATE Title = '".$title."', ScientificName = '".$taxon."', HasKey = ".$HasKey.", KeyText = '".$key_text."', Updated = '".$load_date."'\n";
		print EF ";\n\n";

	}
	else {
		print "badly formatted or no taxon id: $tid==>$key_text\n";
		print LOG "badly formatted or no taxon id: $tid==>$key_text\n";
++$BAD;
	}
}	



print LOG <<EOP;
IJM Keys Sep 2016: 899
IJM Keys Jan 2017: 898
IJM Keys Dec 2017: 898
IJM Keys Jan 2018: 898
IJM Keys Apr 2019: 900
IJM Keys Jan 2020: 901
IJM Keys Jan 2021: 901
IJM Keys Mar 2022: 906
IJM Keys Nov 2023: 906
IJM Keys Feb 2025: 903
IJM Keys Dec 2025: 903
IJM Keys Mar 2026: 900

Current Numer of keys: $key_count
eflora keys expanded combined lines: $hash_lines

BAD keys: $BAD

EOP

print <<EOP;
IJM Keys Sep 2016: 899
IJM Keys Jan 2017: 898
IJM Keys Dec 2017: 898
IJM Keys Jan 2018: 898
IJM Keys Apr 2019: 900
IJM Keys Jan 2020: 901
IJM Keys Jan 2021: 901
IJM Keys Mar 2022: 906
IJM Keys Nov 2023: 906
IJM Keys Feb 2025: 903
IJM Keys Dec 2025: 903
IJM Keys Mar 2026: 900

Current Numer of keys: $key_count
eflora keys expanded combined lines: $hash_lines

BAD keys: $BAD

EOP

close(IN);
close(OUT);

sub get_today {
#usage: add the following line before processing records:
#$today_ymd = &CCH::get_today;
#!/usr/local/bin/perl
	my $datestring = strftime "%F %Z", localtime;
	return ($datestring);
}
