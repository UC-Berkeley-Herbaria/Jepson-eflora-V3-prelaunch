
#use warnings;
use strict;
use BerkeleyDB;
use HTML::Entities;

my %NAME_TO_CODE;
my %CODE_TO_NAME;
my @lines;
my %seen;
my ($names, $key, $smasch_code, $smasch_name, @residue, $k, $v) = "";
my ($taxon_name,$accepted_name,$gen_lines,$fam_lines) = "";
my ($icpn_name,$is_terminal,$is_accepted,$accepted) = "";
my ($count_lines, $count,$NFM) = "";


my $load_date = "2026-04-23";

open(IN, "../synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
	
	#s/Encelia farinosa &times;Encelia frutescens/Encelia farinosa &times; Encelia frutescens/;
	s/farinosa &times;frutescens/farinosa &times; frutescens/;

	($smasch_code,$smasch_name,@residue)=split(/\t/);
	$NAME_TO_CODE{$smasch_name}=$smasch_code;
	$CODE_TO_NAME{$smasch_code}=$smasch_name;
	
}
close(IN);

print "Hybrid Check==>".$CODE_TO_NAME{93861}."\n\n";
print LOG "Hybrid Check==>".$CODE_TO_NAME{93861}."\n\n";

#this function indicates the record delimiter. In this case, an empty line
#as such, it needs to be designated after the other files are processed
$/="";

#mariaDB
open(ICPN, ">output/load_icpn.sql") || die;

open(FILE, ">output/icpn_accepted_name_list.txt") || die;

open(TEMP, ">output/icpn_terminal_name_list.txt") || die;

open(IN, "../../Interchange/input/icpn_current.txt") || die;
while(<IN>){
   next if m/^\#/; #skip lines that are commented out
   next if m/^\.Admin/;	#skip lines that start with Admin
   next if m/^Admin/;	#skip lines that start with Admin
   next if m/=======+/;
   next if m/\.ZZZZee/;

	s/Ottley &times;Lotus dendroideus/Ottley &times; Lotus dendroideus/;

++$count_lines;

s/\357\273\277//;
s/\303\201/&Aacute;/g;
s/\303\251/&eacute;/g;
s/\303\263/&oacute;/g;
s/\303\250/&egrave;/g;
s/\303\266/&ouml;/g;
s/<#e9>/&eacute;/g;
s/<#fc>/&uuml;/g;
s/\303\241/&aacute;/g;
s/\303\261/&ntilde;/g;
s/\303\262/&ograve;/g;
s/\303\242/&acirc;/g;
s/<#f6>/&ouml;/g;
s/\]/ /g;
s/\[/ /g;
s/\{/ /g;
s/\}/ /g;

s/\\/####fslash####/g; #fix an extra slash created  by some mis-converted end of line hidden character

#calculated fields
	my $TaxonID;
	my $CurrentNameTID;
	my $Updated = $load_date;


#These tags have dedicated "&get" subroutines"
#text file fields
	my $ScientificName=&get_ScientificName($_);
	my $Family=&get_Family($_);
	my $AuthorNotes=&get_AuthorNotes($_);
	my $KMcitation=&get_KMcitation($_);
	my $PublicationNote=&get_PublicationNote($_);
	my $SourceA=&get_SourceA($_);
	my $SourceB=&get_SourceB($_);
	my $SourceC=&get_SourceC($_);
	my $SourceD=&get_SourceD($_);
	my $SourceE=&get_SourceE($_);
	my $SourceF=&get_SourceF($_);
	my $SourceG=&get_SourceG($_);
	my $LINK=&get_LINK($_);
	my $LiteratureA=&get_LiteratureA($_);
	my $LiteratureB=&get_LiteratureB($_);
	my $LiteratureC=&get_LiteratureC($_);
	my $LiteratureD=&get_LiteratureD($_);
	my $TJMsynonyms=&get_TJMsynonyms($_);
	my $OtherSynonyms=&get_OtherSynonyms($_);
	my $TJMmisapplied=&get_TJMmisapplied($_); 
	my $JFPmisapplied=&get_JFPmisapplied($_); 
	my $GeographicComment=&get_GeographicComment($_); 
	my $Correspondence1=&get_Correspondence1($_);
	my $Correspondence2=&get_Correspondence2($_);
	my $Correspondence3=&get_Correspondence3($_);
	my $Correspondence4=&get_Correspondence4($_);
	my $Correspondence5=&get_Correspondence5($_);
	my $Correspondence6=&get_Correspondence6($_);
	my $Correspondence7=&get_Correspondence7($_);
	my $Correspondence8=&get_Correspondence8($_);
	my $Correspondence9=&get_Correspondence9($_);
	my $Correspondence10=&get_Correspondence10($_);
	my $Correspondence11=&get_Correspondence12($_);
	my $Correspondence12=&get_Correspondence12($_);
	my $Correspondence13=&get_Correspondence13($_);
	my $EdComments1=&get_EdComments1($_);
	my $EdComments2=&get_EdComments2($_);
	my $EdComments3=&get_EdComments3($_);
	my $EdComments4=&get_EdComments4($_);
	my $EdComments5=&get_EdComments5($_);
	my $EdComments6=&get_EdComments6($_);
	my $EdComments7=&get_EdComments7($_);
	my $EdComments8=&get_EdComments8($_);
	my $EdComments9=&get_EdComments9($_);
	my $EdComments10=&get_EdComments10($_);
	my $EdComments11=&get_EdComments12($_);
	my $EdComments12=&get_EdComments12($_);
	my $EdComments13=&get_EdComments13($_);
	my $Summary=&get_Summary($_);
	my $CurrentStatus=&get_CurrentStatus($_);
	my $CurrentStatusAuthority=&get_CurrentStatusAuthority($_); 
	my $CurrentStatusDate=&get_CurrentStatusDate($_); 
	my $CurrentName=&get_CurrentName($_); 
	my $Pending=&get_Pending($_);
	my $VariantSpelling=&get_VariantSpelling($_);
	my $TypesInfo=&get_TypesInfo($_);

#encode HTML entitites for smoother import to SQL
	$AuthorNotes = encode_entities($AuthorNotes);
	$KMcitation = encode_entities($KMcitation);
	$PublicationNote = encode_entities($PublicationNote);
	$SourceA = encode_entities($SourceA);
	$SourceB = encode_entities($SourceB);
	$SourceC = encode_entities($SourceC);
	$SourceD = encode_entities($SourceD);
	$SourceE = encode_entities($SourceE);
	$SourceF = encode_entities($SourceF);
	$SourceG = encode_entities($SourceG);
	$LINK = encode_entities($LINK);
	$LiteratureA = encode_entities($LiteratureA);
	$LiteratureB = encode_entities($LiteratureB);
	$LiteratureC = encode_entities($LiteratureC);
	$LiteratureD = encode_entities($LiteratureD);
	$TJMsynonyms = encode_entities($TJMsynonyms);
	$OtherSynonyms = encode_entities($OtherSynonyms);
	$TJMmisapplied = encode_entities($TJMmisapplied); 
	$JFPmisapplied = encode_entities($JFPmisapplied); 
	$GeographicComment = encode_entities($GeographicComment); 
	$Correspondence1 = encode_entities($Correspondence1);
	$Correspondence2 = encode_entities($Correspondence2);
	$Correspondence3 = encode_entities($Correspondence3);
	$Correspondence4 = encode_entities($Correspondence4);
	$Correspondence5 = encode_entities($Correspondence5);
	$Correspondence6 = encode_entities($Correspondence6);
	$Correspondence7 = encode_entities($Correspondence7);
	$Correspondence8 = encode_entities($Correspondence8);
	$Correspondence9 = encode_entities($Correspondence9);
	$Correspondence10 = encode_entities($Correspondence10);
	$Correspondence11 = encode_entities($Correspondence11);
	$Correspondence12 = encode_entities($Correspondence12);
	$Correspondence13 = encode_entities($Correspondence13);
	$EdComments1 = encode_entities($EdComments1);
	$EdComments2 = encode_entities($EdComments2);
	$EdComments3 = encode_entities($EdComments3);
	$EdComments4 = encode_entities($EdComments4);
	$EdComments5 = encode_entities($EdComments5);
	$EdComments6 = encode_entities($EdComments6);
	$EdComments7 = encode_entities($EdComments7);
	$EdComments8 = encode_entities($EdComments8);
	$EdComments9 = encode_entities($EdComments9);
	$EdComments10 = encode_entities($EdComments10);
	$EdComments11 = encode_entities($EdComments11);
	$EdComments12 = encode_entities($EdComments12);
	$EdComments13 = encode_entities($EdComments13);
	$Summary = encode_entities($Summary);
	$CurrentStatus = encode_entities($CurrentStatus);
	$CurrentStatusAuthority = encode_entities($CurrentStatusAuthority); 
	$CurrentStatusDate = encode_entities($CurrentStatusDate); 
	$CurrentName = encode_entities($CurrentName); 
	$Pending = encode_entities($Pending);
	$VariantSpelling = encode_entities($VariantSpelling);
	$TypesInfo = encode_entities($TypesInfo);


#check taxon ID's for current names and icpn entry names
			$ScientificName =~ s/^[. ]+//g;
			$ScientificName =~ s/&amp;times;/&times;/g;
			$ScientificName =~ s/&amp;/&/g;


	if ($ScientificName =~ m/^( *|NULL)$/){
		print "ScientificName missing or NULL: $_\n";
	}
			$icpn_name=&strip_name($ScientificName);

	if ($icpn_name !~ m/^([A-Za-z-]+|&times;[A-Za-z-]+|&times;[A-Za-z-]+ [a-z-]+|[A-Za-z-]+ &times;[a-z-]+|[A-Za-z-]+ [a-z-]+|[A-Za-z-]+ [a-z-]+ [nothvarsbpuf.]{2,11} [a-z-]+)$/){
		print "icpn_name stripping problem: $icpn_name==>$_\n";
	}

#fix one odd hybrid only in ICPN that does not strip correctly
	if ($ScientificName =~ m/^Lotus argophyllus .A\. Gray. Greene var\. ornithopus .Greene. Ottley &times;/){
		$icpn_name = "Lotus argophyllus var. ornithopus &times; dendroideus var. traskiae";
	}


$CurrentName =~ s/&\#39;/ /g;
$CurrentName =~ s/ / /g;
$CurrentName =~ s/^ //g;
$CurrentName =~ s/ $//g;
$CurrentName =~ s/&amp;/&/g;

			$accepted=&strip_name($CurrentName);

	if ($accepted !~ m/^[.&;A-Za-z- ]+$/){
		print "accepted not stripped: $accepted-->$_\n";
	}
#if there is no current name field, then it is an accepted name
#only records without a current name field are candidates for terminal taxa
	if($CurrentName =~ m/^( *|NULL)$/){
		$is_accepted = "1";
		
		if($icpn_name =~ m/(var\.|subsp\.|f\.)/){
			$is_terminal = "1";
		}
		elsif($icpn_name =~ m/^[A-Za-z-]+ [a-z-]+$/){
			$is_terminal = "1";
		}
		elsif($icpn_name =~ m/^&times;[A-Za-z-]+ [a-z-]+/){
			$is_terminal = "1";
		}
		elsif($icpn_name =~ m/^[A-Za-z-]+ &times;[a-z-]+$/){
			$is_terminal = "1";
		}
		elsif($icpn_name =~ m/^[A-Za-z-]+$/){
			$is_terminal = "NULL";
		}
		else{
			print TEMP "PROBLEM NAME, NOT TERMINAL?==>$_\n";
			print "PROBLEM NAME, NOT TERMINAL?==>$_\n";
			$is_terminal = "NULL";
		}
	}
	else{
		$is_terminal = "NULL";
		$is_accepted = "NULL";
	}

#create the ICPN terminal names table
	if($is_terminal eq "1"){
		print TEMP "$icpn_name\n";
	}
	else{
		$is_terminal = "NULL";
	}

#create the ICPN accepted names table
	if($is_accepted eq "1"){
		print FILE "$icpn_name\n";
	}
	else{
		$is_accepted = "NULL";
	}
	
##############TAXON ID's

	if($icpn_name !~ /^( *|NULL)$/){
		$TaxonID=$NAME_TO_CODE{$icpn_name};
		++$NFM;
		if ($TaxonID !~ m/^\d+$/){
				print "TAXON_ID non numerical or NULL: $_\n";
		}
	}

	if ($TaxonID !~ m/^\d+$/){
		$TaxonID = "NULL";
	}



	
	if($accepted !~ m/^( *|NULL)$/){
		$CurrentNameTID=$NAME_TO_CODE{$accepted};
			if ($CurrentNameTID !~ m/^\d+$/){
				print "CurrentNameTID non numerical or NULL: $accepted==>$_\n";
			}
	}

	if ($CurrentNameTID !~ m/^\d+$/){
		$CurrentNameTID = "NULL";
	}

##############FAMILY 
	$Family=ucfirst(lc($Family));

#Some families have alternate names in parens, e.g. "Asteraceae (Compositae)"
#first, make sure the alternate name is capitalized correctly
	if ($Family =~ /([A-Za-z]+) \((.*)\)/){ #can't have the parens as part of $2, otherwise the ucfirst function will target the open paren
		$Family = $1; 
	} 

	if($icpn_name =~ m/aceae$/){
		++$fam_lines;
	}
	elsif($icpn_name =~ m/^[A-Z][a-z-]+$/){
		++$gen_lines;
	}
	elsif($icpn_name =~ m/^&times;[A-Z][a-z-]+$/){
		++$gen_lines;
	}

print LOG "$NAME_TO_CODE{$icpn_name}\t$icpn_name\n";

#print out the plain matched taxon names to file used by synonymy script
print FILE "$icpn_name\n";

#convert fields to SQL format

	if ($ScientificName !~ m/^(NULL| *)$/){
		$ScientificName =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$taxon_name = "'".$ScientificName."'";
	}
	else{
		$taxon_name = "NULL";
	}

	if ($CurrentName !~ m/^(NULL| *)$/){
		$CurrentName =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$accepted_name = "'".$CurrentName."'";
	}
	else{
		$accepted_name = "NULL";
	}

	if ($Family !~ m/^(NULL| *)$/){
		$Family = "'".$Family."'";
	}
	else{
		$Family = "NULL";
	}

	if ($AuthorNotes !~ m/^(NULL| *)$/){
		$AuthorNotes = "'".$AuthorNotes."'";
	}
	else{
		$AuthorNotes = "NULL";
	}

	if ($KMcitation !~ m/^(NULL| *)$/){
		$KMcitation = "'".$KMcitation."'";
	}
	else{
		$KMcitation = "NULL";
	}

	if ($PublicationNote !~ m/^(NULL| *)$/){
		$PublicationNote =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$PublicationNote = "'".$PublicationNote."'";
	}
	else{
		$PublicationNote = "NULL";
	}

	if ($SourceA !~ m/^(NULL| *)$/){
		$SourceA =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$SourceA = "'".$SourceA."'";
	}
	else{
		$SourceA = "NULL";
	}

	if ($SourceB !~ m/^(NULL| *)$/){
		$SourceB =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$SourceB = "'".$SourceB."'";
	}
	else{
		$SourceB = "NULL";
	}

	if ($SourceC !~ m/^(NULL| *)$/){
		$SourceC =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$SourceC = "'".$SourceC."'";
	}
	else{
		$SourceC = "NULL";
	}

	if ($SourceD !~ m/^(NULL| *)$/){
		$SourceD =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$SourceD = "'".$SourceD."'";
	}
	else{
		$SourceD = "NULL";
	}

	if ($SourceE !~ m/^(NULL| *)$/){
		$SourceE =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$SourceE = "'".$SourceE."'";
	}
	else{
		$SourceE = "NULL";
	}

	if ($SourceF !~ m/^(NULL| *)$/){
		$SourceF =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$SourceF = "'".$SourceF."'";
	}
	else{
		$SourceF = "NULL";
	}

	if ($SourceG !~ m/^(NULL| *)$/){
		$SourceG =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$SourceG = "'".$SourceG."'";
	}
	else{
		$SourceG = "NULL";
	}

	if ($LINK !~ m/^(NULL| *)$/){
		$LINK = "'".$LINK."'";
	}
	else{
		$LINK = "NULL";
	}

	if ($LiteratureA !~ m/^(NULL| *)$/){
		$LiteratureA = "'".$LiteratureA."'";
	}
	else{
		$LiteratureA = "NULL";
	}

	if ($LiteratureB !~ m/^(NULL| *)$/){
		$LiteratureB = "'".$LiteratureB."'";
	}
	else{
		$LiteratureB = "NULL";
	}

	if ($LiteratureC !~ m/^(NULL| *)$/){
		$LiteratureC = "'".$LiteratureC."'";
	}
	else{
		$LiteratureC = "NULL";
	}

	if ($LiteratureD !~ m/^(NULL| *)$/){
		$LiteratureD = "'".$LiteratureD."'";
	}
	else{
		$LiteratureD = "NULL";
	}

	if ($TJMsynonyms !~ m/^(NULL| *)$/){
		$TJMsynonyms =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$TJMsynonyms = "'".$TJMsynonyms."'";
	}
	else{
		$TJMsynonyms = "NULL";
	}

	if ($OtherSynonyms !~ m/^(NULL| *)$/){
		$OtherSynonyms =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$OtherSynonyms = "'".$OtherSynonyms."'";
	}
	else{
		$OtherSynonyms = "NULL";
	}

	if ($TJMmisapplied !~ m/^(NULL| *)$/){
		$TJMmisapplied =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$TJMmisapplied = "'".$TJMmisapplied."'";
	}
	else{
		$TJMmisapplied = "NULL";
	}

	if ($JFPmisapplied !~ m/^(NULL| *)$/){
		$JFPmisapplied =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$JFPmisapplied = "'".$JFPmisapplied."'";
	}
	else{
		$JFPmisapplied = "NULL";
	}

	if ($GeographicComment !~ m/^(NULL| *)$/){
		$GeographicComment = "'".$GeographicComment."'";
	}
	else{
		$GeographicComment = "NULL";
	}

	if ($Correspondence1 !~ m/^(NULL| *)$/){
		$Correspondence1 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence1 = "'".$Correspondence1."'";
	}
	else{
		$Correspondence1 = "NULL";
	}

	if ($Correspondence2 !~ m/^(NULL| *)$/){
		$Correspondence2 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence2 = "'".$Correspondence2."'";
	}
	else{
		$Correspondence2 = "NULL";
	}

	if ($Correspondence3 !~ m/^(NULL| *)$/){
		$Correspondence3 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence3 = "'".$Correspondence3."'";
	}
	else{
		$Correspondence3 = "NULL";
	}

	if ($Correspondence4 !~ m/^(NULL| *)$/){
		$Correspondence4 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence4 = "'".$Correspondence4."'";
	}
	else{
		$Correspondence4 = "NULL";
	}

	if ($Correspondence5 !~ m/^(NULL| *)$/){
		$Correspondence5 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence5 = "'".$Correspondence5."'";
	}
	else{
		$Correspondence5 = "NULL";
	}

	if ($Correspondence6 !~ m/^(NULL| *)$/){
		$Correspondence6 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence6 = "'".$Correspondence6."'";
	}
	else{
		$Correspondence6 = "NULL";
	}

	if ($Correspondence7 !~ m/^(NULL| *)$/){
		$Correspondence7 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence7 = "'".$Correspondence7."'";
	}
	else{
		$Correspondence7 = "NULL";
	}

	if ($Correspondence8 !~ m/^(NULL| *)$/){
		$Correspondence8 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence8 = "'".$Correspondence8."'";
	}
	else{
		$Correspondence8 = "NULL";
	}

	if ($Correspondence9 !~ m/^(NULL| *)$/){
		$Correspondence9 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence9 = "'".$Correspondence9."'";
	}
	else{
		$Correspondence9 = "NULL";
	}

	if ($Correspondence10 !~ m/^(NULL| *)$/){
		$Correspondence10 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence10 = "'".$Correspondence10."'";
	}
	else{
		$Correspondence10 = "NULL";
	}

	if ($Correspondence11 !~ m/^(NULL| *)$/){
		$Correspondence11 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence11 = "'".$Correspondence11."'";
	}
	else{
		$Correspondence11 = "NULL";
	}

	if ($Correspondence12 !~ m/^(NULL| *)$/){
		$Correspondence12 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence12 = "'".$Correspondence12."'";
	}
	else{
		$Correspondence12 = "NULL";
	}

	if ($Correspondence13 !~ m/^(NULL| *)$/){
		$Correspondence13 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Correspondence13 = "'".$Correspondence13."'";
	}
	else{
		$Correspondence13 = "NULL";
	}

	if ($EdComments1 !~ m/^(NULL| *)$/){
		$EdComments1 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments1 = "'".$EdComments1."'";
	}
	else{
		$EdComments1 = "NULL";
	}

	if ($EdComments2 !~ m/^(NULL| *)$/){
		$EdComments2 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments2 = "'".$EdComments2."'";
	}
	else{
		$EdComments2 = "NULL";
	}

	if ($EdComments3 !~ m/^(NULL| *)$/){
		$EdComments3 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments3 =~ s/\#\#\#\#fslash\#\#\#\#//g; #fix one line that is mystriouslt adding a forward slash for no apparant reason
			#the slash is cutting off the rest of the line and  essing up the code for SQL import
		$EdComments3 = "'".$EdComments3."'";

	}
	else{
		$EdComments3 = "NULL";
	}

	if ($EdComments4 !~ m/^(NULL| *)$/){
		$EdComments4 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments4 = "'".$EdComments4."'";
	}
	else{
		$EdComments4 = "NULL";
	}

	if ($EdComments5 !~ m/^(NULL| *)$/){
		$EdComments5 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments5 = "'".$EdComments5."'";
	}
	else{
		$EdComments5 = "NULL";
	}

	if ($EdComments6 !~ m/^(NULL| *)$/){
		$EdComments6 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments6 = "'".$EdComments6."'";
	}
	else{
		$EdComments6 = "NULL";
	}

	if ($EdComments7 !~ m/^(NULL| *)$/){
		$EdComments7 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments7 = "'".$EdComments7."'";
	}
	else{
		$EdComments7 = "NULL";
	}

	if ($EdComments8 !~ m/^(NULL| *)$/){
		$EdComments8 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments8 = "'".$EdComments8."'";
	}
	else{
		$EdComments8 = "NULL";
	}

	if ($EdComments9 !~ m/^(NULL| *)$/){
		$EdComments9 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments9 = "'".$EdComments9."'";
	}
	else{
		$EdComments9 = "NULL";
	}

	if ($EdComments10 !~ m/^(NULL| *)$/){
		$EdComments10 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments10 = "'".$EdComments10."'";
	}
	else{
		$EdComments10 = "NULL";
	}

	if ($EdComments11 !~ m/^(NULL| *)$/){
		$EdComments11 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments11 = "'".$EdComments11."'";
	}
	else{
		$EdComments11 = "NULL";
	}

	if ($EdComments12 !~ m/^(NULL| *)$/){
		$EdComments12 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments12 = "'".$EdComments12."'";
	}
	else{
		$EdComments12 = "NULL";
	}

	if ($EdComments13 !~ m/^(NULL| *)$/){
		$EdComments13 =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$EdComments13 = "'".$EdComments13."'";
	}
	else{
		$EdComments13 = "NULL";
	}

	if ($Summary !~ m/^(NULL| *)$/){
		$Summary = "'".$Summary."'";
	}
	else{
		$Summary = "NULL";
	}

	if ($CurrentStatus !~ m/^(NULL| *)$/){
		$CurrentStatus = "'".$CurrentStatus."'";
	}
	else{
		$CurrentStatus = "NULL";
	}

	if ($CurrentStatusAuthority !~ m/^(NULL| *)$/){
		$CurrentStatusAuthority = "'".$CurrentStatusAuthority."'";
	}
	else{
		$CurrentStatusAuthority = "NULL";
	}

	if ($CurrentStatusDate !~ m/^(NULL| *)$/){
		$CurrentStatusDate = "'".$CurrentStatusDate."'";
	}
	else{
		$CurrentStatusDate = "NULL";
	}

	if ($Pending !~ m/^(NULL| *)$/){
		$Pending =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$Pending = "'".$Pending."'";
	}
	else{
		$Pending = "NULL";
	}

	if ($CurrentName !~ m/^(NULL| *)$/){
		$CurrentName =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$CurrentName = "'".$CurrentName."'";
	}
	else{
		$CurrentName = "NULL";
	}

	if ($VariantSpelling !~ m/^(NULL| *)$/){
		$VariantSpelling =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$VariantSpelling = "'".$VariantSpelling."'";
	}
	else{
		$VariantSpelling = "NULL";
	}

	if ($TypesInfo !~ m/^(NULL| *)$/){
		$TypesInfo =~ s/'/&#39;/g; #apostrophe interferes with SQL, change to html
		$TypesInfo = "'".$TypesInfo."'";
	}
	else{
		$TypesInfo = "NULL";
	}


++$count;


#mariaDB export
		print ICPN "INSERT INTO icpn(TaxonID, ScientificName,CurrentNameTID,CurrentName,Family,AuthorNotes,Correspondence1,Correspondence2,Correspondence3,Correspondence4,Correspondence5,Correspondence6,Correspondence7,Correspondence8,Correspondence9,Correspondence10,Correspondence11,Correspondence12,Correspondence13,CurrentStatus,CurrentStatusAuthority,CurrentStatusDate,EdComments1,EdComments2,EdComments3,EdComments4,EdComments5,EdComments6,EdComments7,EdComments8,EdComments9,EdComments10,EdComments11,EdComments12,EdComments13,GeographicComment,JFPmisapplied,KMcitation,LINK,LiteratureA,LiteratureB,LiteratureC,LiteratureD,OtherSynonyms,Pending,PublicationNotes,SourceA,SourceB,SourceC,SourceD,SourceE,SourceF,SourceG,Summary,TJMmisapplied,TJMsynonyms,TypesInfo,VariantSpelling,Updated,IsTerminal,IsAccepted)\n";
		print ICPN "VALUES(".$TaxonID.",".$taxon_name.",".$CurrentNameTID.",".$accepted_name.",".$Family.",".$AuthorNotes.",".$Correspondence1.",".$Correspondence2.",".$Correspondence3.",".$Correspondence4.",".$Correspondence5.",".$Correspondence6.",".$Correspondence7.",".$Correspondence8.",".$Correspondence9.",".$Correspondence10.",".$Correspondence11.",".$Correspondence12.",".$Correspondence13.",".$CurrentStatus.",".$CurrentStatusAuthority.",".$CurrentStatusDate.",".$EdComments1.",".$EdComments2.",".$EdComments3.",".$EdComments4.",".$EdComments5.",".$EdComments6.",".$EdComments7.",".$EdComments8.",".$EdComments9.",".$EdComments10.",".$EdComments11.",".$EdComments12.",".$EdComments13.",".$GeographicComment.",".$JFPmisapplied.",".$KMcitation.",".$LINK.",".$LiteratureA.",".$LiteratureB.",".$LiteratureC.",".$LiteratureD.",".$OtherSynonyms.",".$Pending.",".$PublicationNote.",".$SourceA.",".$SourceB.",".$SourceC.",".$SourceD.",".$SourceE.",".$SourceF.",".$SourceG.",".$Summary.",".$TJMmisapplied.",".$TJMsynonyms.",".$TypesInfo.",".$VariantSpelling.",'".$Updated."',".$is_terminal.",".$is_accepted.")\n";
		#If the TaxonID in icpn already exists, update selected fields only 
		print ICPN "ON DUPLICATE KEY UPDATE ScientificName = ".$taxon_name.",CurrentNameTID = ".$CurrentNameTID.",CurrentName = ".$accepted_name.",Family = ".$Family.",AuthorNotes = ".$AuthorNotes.",Correspondence1 = ".$Correspondence1.",Correspondence2 = ".$Correspondence2.",Correspondence3 = ".$Correspondence3.",Correspondence4 = ".$Correspondence4.",Correspondence5 = ".$Correspondence5.",Correspondence6 = ".$Correspondence6.",Correspondence7 = ".$Correspondence7.",Correspondence8 = ".$Correspondence8.",Correspondence9 = ".$Correspondence9.",Correspondence10 = ".$Correspondence10.",Correspondence11 = ".$Correspondence11.",Correspondence12 = ".$Correspondence12.",Correspondence13 = ".$Correspondence13.",CurrentStatus = ".$CurrentStatus.",CurrentStatusAuthority = ".$CurrentStatusAuthority.",CurrentStatusDate = ".$CurrentStatusDate.",EdComments1 = ".$EdComments1.",EdComments2 = ".$EdComments2.",EdComments3 = ".$EdComments3.",EdComments4 = ".$EdComments4.",EdComments5 = ".$EdComments5.",EdComments6 = ".$EdComments6.",EdComments7 = ".$EdComments7.",EdComments8 = ".$EdComments8.",EdComments9 = ".$EdComments9.",EdComments10 = ".$EdComments10.",EdComments11 = ".$EdComments11.",EdComments12 = ".$EdComments12.",EdComments13 = ".$EdComments13.",GeographicComment = ".$GeographicComment.",JFPmisapplied = ".$JFPmisapplied.",KMcitation = ".$KMcitation.",LINK = ".$LINK.",LiteratureA = ".$LiteratureA.",LiteratureB = ".$LiteratureB.",LiteratureC = ".$LiteratureC.",LiteratureD = ".$LiteratureD.",OtherSynonyms = ".$OtherSynonyms.",Pending = ".$Pending.",PublicationNotes = ".$PublicationNote.",SourceA = ".$SourceA.",SourceB = ".$SourceB.",SourceC = ".$SourceC.",SourceD = ".$SourceD.",SourceE = ".$SourceE.",SourceF = ".$SourceF.",SourceG = ".$SourceG.",Summary = ".$Summary.",TJMmisapplied = ".$TJMmisapplied.",TJMsynonyms = ".$TJMsynonyms.",TypesInfo = ".$TypesInfo.",VariantSpelling = ".$VariantSpelling.",Updated = '".$Updated."',IsTerminal = ".$is_terminal.",IsAccepted = ".$is_accepted."\n";
		print ICPN ";\n\n";

}


print LOG <<EOP;
BEGIN ICPN STATS

TOTAL lines in ICPN-current: $count_lines

Family count: $fam_lines
Genus count: $gen_lines
Name For Matching count: $NFM
Records added to icpn MAIN: $count

END ICPN STATS
EOP

print <<EOP;
BEGIN ICPN STATS

TOTAL lines in ICPN-current: $count_lines

Family count: $fam_lines
Genus count: $gen_lines
Name For Matching count: $NFM
Records added to icpn MAIN: $count

END ICPN STATS
EOP

close (ICPN);
close (TEMP);
close (FILE);
close (LOG);
close (OUT);
close (IN);

###########################################





sub get_ScientificName {
  my $par = shift; #each paragraph is separated by a blank line
  @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
	if($lines[0] =~ m/^\.[A-Z][a-z-]+/){
		return $lines[0];
	}
	if($lines[0] =~ m/^\.&times;[A-Z][a-z-]+/){
		return $lines[0];
	}
	else{ #otherwise...
		return "NULL"; #don't return anything for that paragraph
	}
}

sub get_Family {
		my $par = shift;
		if($par =~ m/[\H]Family: *([A-Z]+.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_AuthorNotes {
		my $par = shift;
		if($par =~ /[\H]Author [Nn]otes: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_KMcitation {
		my $par = shift;
		if($par =~ /[\H]KM citation: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_PublicationNote {
		my $par = shift;
		if($par =~ /[\H]Notes on Publication of Name: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_SourceA {
		my $par = shift;
		if($par =~ /[\H]Source: *(.+)/){
			return "$1";
		}
		elsif($par =~ /[\H]Source a: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_SourceB {
		my $par = shift;
		if($par =~ /[\H]Source b: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_SourceC {
		my $par = shift;
		if($par =~ /[\H]Source c: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_SourceD {
		my $par = shift;
		if($par =~ /[\H]Source d: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_SourceE {
		my $par = shift;
		if($par =~ /[\H]Source e: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_SourceF {
		my $par = shift;
		if($par =~ /[\H]Source f: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_SourceG {
		my $par = shift;
		if($par =~ /[\H]Source g: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_SourceComments {
		my $par = shift;
		if($par =~ /[\H]Comments: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_LINK {
		my $par = shift;
		if($par =~ /[\H]LINK: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_LiteratureA {
		my $par = shift;
		if($par =~ /[\H]Literature: *(.+)/){
			return "$1";
		}
		elsif($par =~ /[\H]Literature a: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_LiteratureB {
		my $par = shift;
		if($par =~ /[\H]Literature b: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_LiteratureC {
		my $par = shift;
		if($par =~ /[\H]Literature c: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_LiteratureD {
		my $par = shift;
		if($par =~ /[\H]Literature d: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_TJMsynonyms {
		my $par = shift;
		if($par =~ /[\H]TJM synonyms: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_OtherSynonyms {
		my $par = shift;
		if($par =~ /[\H]Synonyms not explicitly cited in TJM: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_TJMmisapplied {
		my $par = shift;
		if($par =~ /[\H]TJM misapplied names: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_JFPmisapplied {
		my $par = shift;
		if($par =~ /[\H]TJM2 misapplied names: *(.+)/){
			return "$1";
		}
		elsif($par =~ /[\H]Current JFP misapplied names: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_GeographicComment {
		my $par = shift;
		if($par =~ /[\H]Geography: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_Correspondence1 {
		my $par = shift;
		if($par =~ /[\H]Correspondence: *(.+)/){
			return "$1";
		}
		elsif($par =~ /[\H]Correspondence 1: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_Correspondence2 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 2: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_Correspondence3 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 3: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}
sub get_Correspondence4 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 4: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}
sub get_Correspondence5 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 5: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}
sub get_Correspondence6 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 6: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}
sub get_Correspondence7 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 7: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}
sub get_Correspondence8 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 8: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}
sub get_Correspondence9 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 9: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}
sub get_Correspondence10 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 10: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_Correspondence11 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 11: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_Correspondence12 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 12: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_Correspondence13 {
		my $par = shift;
		if($par =~ /[\H]Correspondence 13: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments1 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments: *(.+)/){
			return "$1";
		}
		elsif($par =~ /[\H]Editorial Comments 1: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments2 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 2: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments3 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 3: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments4 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 4: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments5 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 5: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments6 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 6: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments7 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 7: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments8 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 8: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments9 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 9: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments10 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 10: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments11 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 11: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments12 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 12: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_EdComments13 {
		my $par = shift;
		if($par =~ /[\H]Editorial Comments 13: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_Summary {
		my $par = shift;
		if($par =~ /[\H]Summary: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}


sub get_CurrentStatus {
		my $par = shift;
		if($par =~ /[\H]Current Status: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_CurrentStatusAuthority {
		my $par = shift;
		if($par =~ /[\H]Current Status Authority: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_CurrentStatusDate {
		my $par = shift;
		if($par =~ /[\H]Current Status Date: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_CurrentName {
		my $par = shift;
		if($par =~ /[\H]Current Name: *(.+)/){
			return "$1";
		}
		elsif($par =~ /[\H]Current Name \(T\): *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_Pending {
		my $par = shift;
		if($par =~ /[\H]Pending: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_VariantSpelling {
		my $par = shift;
		if($par =~ /[\H]Variant Spelling: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

sub get_TypesInfo {
		my $par = shift;
		if($par =~ /[\H]Types Info: *(.+)/){
			return "$1";
		}
		else {
			return "NULL";
		}
}

#current ICPN field headers
	#Author Notes:
	#Comments:
	#Correspondence 1:
	#Correspondence 2:
	#Correspondence 3:
	#Correspondence 4:
	#Correspondence 5:
	#Correspondence 6:
	#Correspondence 7:
	#Correspondence 8:
	#Correspondence 9:
	#Correspondence 10:
	#Correspondence 11:
	#Correspondence 12:
	#Current JFP misapplied names:
	#Current JFP synonyms:
	#Current JFP synonyms: 
	#Current Name (T):
	#Current Name:
	#Current Status Authority:
	#Current Status Date:
	#Current Status:
	#Editorial Comments 1:
	#Editorial Comments 2:
	#Editorial Comments 3:
	#Editorial Comments 4:
	#Editorial Comments 5:
	#Editorial Comments 6:
	#Editorial Comments 7:
	#Editorial Comments 8:
	#Editorial Comments 9:
	#Editorial Comments 10:
	#Editorial Comments 11:
	#Editorial Comments 12:
	#Effort:
	#Family:
	#Geography:
	#KM citation:
	#LINK:
	#Literature a:
	#Literature b:
	#Literature c:
	#Literature d:
	#Literature:
	#Notes on Publication of Name:
	#Pending:
	#Previous JFP misapplied names:
	#Previous JFP synonyms:
	#Source a:
	#Source b:
	#Source c:
	#Source d:
	#Source e:
	#Source f:
	#Source g:
	#Source:
	#Summary:
	#Synonyms not explicitly cited in TJM:
	#TJM misapplied names:
	#TJM synonyms:
	#TJM2 misapplied names:
	#TJM2 synonyms:
	#Types Info:
	#Variant Spelling:

#ICPN MariaDB table structure
 #TaxonID MEDIUMINT UNSIGNED NOT NULL,
 #ScientificName varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
 #Family varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #AuthorNotes TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #KMcitation TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #PublicationNotes TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #SourceA TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #SourceB TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #SourceC TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #SourceD TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #SourceComments TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #LINK TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #LiteratureA TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #LiteratureB TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #LiteratureC TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #LiteratureD TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #TJMsynonyms TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #OtherSynonyms TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #TJMmisapplied TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #JFPmisapplied TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #GeographicComment TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence1 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence2 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence3 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence4 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence5 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence6 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence7 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence8 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence9 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence10 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence11 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence12 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Correspondence13 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments1 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments2 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments3 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments4 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments5 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments6 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments7 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments8 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments9 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments10 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments11 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments12 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #EdComments13 TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #Summary TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #CurrentStatus TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #CurrentStatusAuthority TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #CurrentStatusDate TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #CurrentName varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #CurrentNameTID MEDIUMINT UNSIGNED NOT NULL,
 #Pending TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #VariantSpelling varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
 #TypesInfo TINYTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,

sub strip_name{
local($_) = @_;

s/"//g;
#$_=ucfirst($_);

s/ +/ /g;
s/^ +//;
s/ +$//;

#encelioides (Cav.) Benth. & Hook. f. ex A. Gray subsp. exauriculata
s/Hook\. f\. ex A\. Gray/Hook. filius ex A. Gray/i;

#add additional 'filial' authorities at this point so they parse correctly, JAA
s/Ait\. f\./Ait. filius/g;
s/Backh\. f\./Backh. filius/g;
s/Baker f\./Baker filius/g;
s/Bakh\. f\./Bakh. filius/g;
s/Balf\. f\./Balf. filius/g;
s/Burm\. f\./Burm. filius/g;
s/Brunner,? f\./Brunner filius/g;
s/Celakovsky f\./L.F. Celak./g;
s/Delar\. f\./Delar. filius/g;
s/Forst\. f\./Forst. filius/g;
s/Gaertn\. f\./Gaertn. filius/g;
s/Gagnaire f\./Gagnaire filius/g;
s/Haage f\./Haage filius/g;
s/Haller f\./Haller filius/g;
s/Hallier f\./Hallier filius/g;
s/Harr\. f\./Harr. filius/g;
s/Hedw\. f\./Hedw. filius/g;
s/Hirats\. f\./Hirats. filius/g;
s/Hook\. f\./Hook. filius/g;
s/Hooker f\./Hooker filius/g; #some people dont abbreviate Hooker
s/Jacq\. f\./Jacq. filius/g;
s/Kickx f\./Kickx filius/g;
s/Kampm\. f\./Kampm. filius/g;
s/Keng f\./Keng filius/g;
s/Klokov f\./Klokov filius/g;
#s/L\. f\. sulcat/f. sulcat/g;

s/L\. f\. var./L. filius var./g;
s/L\. f\. subsp./L. filius subsp./g;
s/L\. f\./L. filius/g;
s/L\. *filius azure/L. f. azure/g; #fix special cases where L. f. is a forma name not filius, Anagallis arvensis L. f. azurea Hyl.
s/L\. *filius vine/L. f. vine/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. vineale
s/L\. *filius comp/L. f. comp/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. compactum L.
s/L\. *filius tome/L. f. tome/g; #fix special cases where L. f. is a forma name not filius, Acer rubrum L. f. tomemtosum L. 
s/L\. *filius sang/L. f. sang/g; #fix special cases where L. f. is a forma name not filius, Acer negundo L. f. sanguineum L. Martin
s/L\. *filius masc/L. f. masc/g; #fix special cases where L. f. is a forma name not filius, Orchis morio L. f. mascula L.
s/L\. *filius lute/L. f. lute/g; #fix special cases where L. f. is a forma name not filius, Ophrys insectifera L. f. luteomarginata L. Lewis
s/L\. *filius micr/L. f. micr/g; #fix special cases where L. f. is a forma name not filius, Jasminum humile L. f. microphyllum L.C. Chia
s/L\. *filius sask/L. f. sask/g; #fix special cases where L. f. is a forma name not filius, Carex capillaris L. f. saskatschewana (Boeckeler) L.H. Bailey
s/L\. *filius negl/L. f. negl/g; #fix special cases where L. f. is a forma name not filius, Celtis occidentalis L. f. neglecta L.
s/L\. *filius duri/L. f. duri/g; #fix special cases where L. f. is a forma name not filius, Eryngium campestre L. f. duriberum L.
s/L\. *filius glab/L. f. glab/g; #fix special cases where L. f. is a forma name not filius, Dioscorea villosa L. f. glabrata L.
s/L\. *filius prae/L. f. prae/g; #fix special cases where L. f. is a forma name not filius, Silphium trifoliatum L. f. praecisum L.M. Perry
s/L\. *filius pinn/L. f. pinn/g; #fix special cases where L. f. is a forma name not filius, Quercus alba L. f. pinntifida L.
s/L\. *filius sulc/L. f. sulc/g; #fix special cases where L. f. is a forma name not filius, Zostera marina L. f. sulcatifolia Setchell
s/L\. *filius pinn/L. f. vill/g; #fix special cases where L. f. is a forma name not filius, Cardiospermum corindum L. f. villosum (Mill.) Radlk
s/Lestib\. f\./Lestib. filius/g;
s/Lindb\. f\./Lindb. filius/g;
s/Lindm\. f\./Lindm. filius/g;
s/Luer f\./Luer filius/g;
s/Michx\. f\./F. Michx./g;
s/Michaux f\./F. Michx./g;
s/Occhioni f\./Occhioni filius/g;
s/Pearsall f\./Pearsall filius/g;
s/Phil\. f\./Phil. filius/g;
s/Rchb\. f\./Rchb. filius/g;
s/Rech\. f\./Rech. filius/g;
s/Rehb\. f\./Rehb. filius/g;
s/Reichenb\. f\./Reichenb. filius/g;
s/Reichenbach f\./Reichenbach filius/g;
s/Scheuchzer f\./Scheuchzer filius/g;
s/Schultes f\./Schultes filius/g;
s/Schult\. f\./Schult. filius/g;
s/Wallr\. f\./Wallr. filius/g;
s/Wendl\. f\./Wendl. filius/g;



s/,//g; #delete stray commas

s/^([A-Z][A-Za-z-]+) ([-a-z]+) ?.* (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (&times;)([-a-z]+) .+/$1 $2$3/||
s/^([A-Z][A-Za-z-]+) (&times;)([-a-z]+)/$1 $2$3/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+) .+/$1 $2/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+)/$1 $2/||
s/^(&times;)([A-Z][a-z-]+) ([-a-z]+) (.+)/$1$2 $3/||
s/^(&times;)([A-Z][a-z-]+) ([-a-z]+)/$1$2 $3/;
s/ +/ /;
s/^ +//;
s/ +$//;


#print "$_ \n";
$_;
}