#!/usr/bin/perl
use CGI;
use HTML::Template;
use List::Util qw(uniqstr);
use List::MoreUtils qw(any uniq true);
use Data::Dumper qw(Dumper);
use BerkeleyDB;
#use warnings;
use strict;
use feature qw(say);
use CGI::Carp qw( fatalsToBrowser );
use GD;

# create a new image
#my $im = new GD::Image(500,650); old Dick Moe script from 2012
my $im = GD::Image->new(500,650) || die;; #new format from 2025 GD module synopsis

#define variables for strict

#smasch_taxon_ids variables
my ($code,$name);
my %TID;

#jepson elev hash
my ($min,$max);
my %jeps_elev;

#input variables from url
my ($elevation,$taxon_label,$lookfor,$latitude);

#cch specimen data variables
my @F_acc;
my @unique;
my @sorted;
my ($found,$index, $GUID);

#push_results
my @DBM_fields;
my @unique;
my @AIDLIST;

#all results
my @result;
# my ($elevM,$latM,$elev_metric,$im);  # JG: $im is defined a few lines above, then is wiped out here. Replaced with line below to avoid $im not defined error.
my ($elevM,$latM,$elev_metric,$tid_acc);

#CCH1_LAT_ELEV variables
my ($id,$elev,$lat,$taxon_id);
my %DBM;

#GD processing variables
my ($ticklat,$tick,$t,$g);
my %position;

my $start_time=time;
my $begin_time=times();

my $query = new CGI; # create new CGI object
print $query->header; # create the HTTP header


my $data_path="/usr/local/web/ucjeps_data/ucjeps_data/";
my $filename = "${data_path}JEPS_elev.hash";
    tie %jeps_elev, "BerkeleyDB::Hash",
                -Filename => $filename,
-Flags => DB_RDONLY
        or die "Cannot open file $filename: $! $BerkeleyDB::Error\n" ;

open(IN,"../ucjeps_data/ucjeps_data/smasch_taxon_ids.txt") || die;
while(<IN>){
chomp;
($code,$name)=split(/\t/);
$TID{$code}=$name;
}

open(IN,"../ucjeps_data/ucjeps_data/CCH1_LAT_ELEV.out") || die;
	while(<IN>){
		chomp;
			($id,$taxon_id,$elev,$lat)=split(/\t/);
				$DBM{$id} = $taxon_id."\t".$elev."\t".$lat;
				#$DBM{$taxon_id} = $elev."\t".$lat;
	}

my $ff= $ENV{'QUERY_STRING'};

# if ($ENV{'SERVER_PORT'} && !$ENV{'HTTPS'}){
if ($ENV{'SERVER_PORT'} && $ENV{'HTTPS'}){ # JG: the "if !$ENV{'HTTPS'}" is breaking; I changed to "if $ENV{'HTTPS'}"

    my $template = HTML::Template->new(
    	filename => 'ERROR_HTTP.tmpl',
    	utf8 => 1,
    	path => ['/usr/local/web/ucjeps_web/common/templates', '../common/templates'],
    );
    print $template->output();
} elsif ($ff =~ m/(document.cookie|document.domain|information.schema|pg.sleep|schema.name|onerror|xss)/){

    my $template = HTML::Template->new(
    	filename => 'ERROR_INVALID.tmpl',
    	utf8 => 1,
    	path => ['/usr/local/web/ucjeps_web/common/templates', '../common/templates'],
    );
    print $template->output();
} elsif ($ff =~ m/(sleep.?%28.?|%2F%2F|%28%29%7B|%3B%7D%3B|boot.ini)/){
    my $template = HTML::Template->new(
    	filename => 'ERROR_SEARCH.tmpl',
    	utf8 => 1,
    	path => ['/usr/local/web/ucjeps_web/common/templates', '../common/templates'],
    );
    print $template->output();
} elsif ($ff =~ m/(document.+cookie|onerror.+prompt|onload.+prompt|script.+alert|onerror.+ alert)/){
    my $template = HTML::Template->new(
    	filename => 'ERROR_INVALID.tmpl',
    	utf8 => 1,
    	path => ['/usr/local/web/ucjeps_web/common/templates', '../common/templates'],
    );
    print $template->output();
} elsif (($ff =~ m/(union[(%2B)|\s]+select)/)||($ff =~ m/(and[(%2B)|\s]+ascii)/)){
    my $template = HTML::Template->new(
    	filename => 'ERROR_SEARCH.tmpl',
    	utf8 => 1,
    	path => ['/usr/local/web/ucjeps_web/common/templates', '../common/templates'],
    );
    print $template->output();
} elsif (($ff =~ m/[(%2B)|\s]+length/)||($ff =~ m/[(%2B)|\s|(%20)]+exists/)||($ff =~ m/[(%2B)|(%20)|\s]+sleep/)||($ff =~ m/%2[0-9]\s*sleep\s*%2[0-9]/)){
    my $template = HTML::Template->new(
    	filename => 'ERROR_SEARCH.tmpl',
    	utf8 => 1,
    	path => ['/usr/local/web/ucjeps_web/common/templates', '../common/templates'],
    );
    print $template->output();
} else{
	my $template = HTML::Template->new(
		filename => 'PASSED.tmpl',
		utf8 => 1,
		path => ['/usr/local/web/ucjeps_web/common/templates', '../common/templates'],
	);
	#print $template->output();

@result=();


	if($query->param('tid')){
		$lookfor=$query->param('tid');

		$taxon_label=$TID{$lookfor};

#print <<EOP;
#<h2>Name LIST==>$lookfor-->$taxon_label</h2>
#EOP
#this should be taxon ID only
		if($lookfor !~m/^\d+$/){
			die;
		}

		$lookfor=~s/^[^0-9]+$//;

	}

	if($lookfor){
		if($jeps_elev{$lookfor}){

			($min,$max)=split(/\t/, $jeps_elev{$lookfor});
				$min= int($min /10);
				$max =int($max/10);
				if ($max eq $min){
					$max +=1; 
				}
		}

			@unique=&get_tid_accessions($lookfor);

				#@unique = uniqstr @acc_buffer;
				#i dont think this needs unique'd
				foreach $GUID (@unique){
					++$found;
				}

			if(length $found){
					#@sorted = sort @unique;
					#while ( ($index, $GUID) = each @sorted) {
					while ( ($index, $GUID) = each @unique) {
						if ((length $GUID) && (length $index)) {
							&push_result($GUID);
						}
#print <<EOP;
#<h2>UNIQ LOC: At unique-index $index</h2>
#<h2>UNIQ LOC: I found this unique $GUID</h2>
#EOP
					}
			}


	}

	if($query->param('lat')){
		$latitude=$query->param('lat');

#print <<EOP;
#<h2>latitude==>$latitude</h2>
#EOP
#this should be latitude only
		if($latitude !~m/^[0-9.]+$/){
			die;
		}

	}

	if($query->param('elev')){
		$elevation=$query->param('elev');

#print <<EOP;
#<h2>elevation==>$elevation</h2>
#EOP
		if($elevation !~m/^[0-9]+$/){
			die;
		}

	}

#Output file to store data for Berkeley Mapper

my $tempLat = $latitude;
$tempLat =~ s/\.//g;

my $tab_file_name = "CHC_ELEV_" . $elevation . "_" . $tempLat . "_" . $lookfor . ".png";
#my $YF_tab_file_name = "CHC_YF_" . substr($start_time,6,4) . $ . ".txt";
my $map_file_path = "/BerkeleyMapper/";
my $map_file_out = "$map_file_path$tab_file_name";
my $map_file_URL = "https://ucjeps.berkeley.edu$map_file_out";


	my $scaling_factor = 80;
	my $north_lat= int((43 * 3600)/$scaling_factor);
	my $south_lat = int((32 * 3600)/$scaling_factor);

	my $whitney=$north_lat - int((36.579 * 3600)/$scaling_factor);
	my $lyell=$north_lat - int((37.739 * 3600)/$scaling_factor);
	my $shasta=$north_lat - int((41.32 * 3600)/$scaling_factor);
	my $jacinto=$north_lat - int((33.815 * 3600)/$scaling_factor);
	my $lassen=$north_lat - int((40.492 * 3600)/$scaling_factor);
	$latitude=$north_lat - int(($latitude * 3600)/$scaling_factor);

$elevation=int($elevation/10);




####assemble image
        # allocate some colors
		my $white = $im->colorAllocate(255,255,255);
		my $bar = $im->colorAllocate(225,225,255);
		my $black = $im->colorAllocate(0,0,0);       
		my $red = $im->colorAllocate(220,50,32); #R 220 G 50 B 32     
		my $pink = $im->colorAllocate(211,95,183); #R 211 G 95 B 183
		my $blue = $im->colorAllocate(26,133,255); #R 26  G 133 B 255
		my $dkblue = $im->colorAllocate(0,90,181); #R 0 G 90 B 181 
		my $yellow = $im->colorAllocate(255,194,10); #R 255 G 194 B 10
		my $green = $im->colorAllocate(17,119,51); 



# make the background transparent and interlaced
		#$im->transparent($white);
		$im->interlaced('true');

# Put a black frame around the picture
		$im->rectangle(0,0,499,649,$black);

# make filled rectangle the size of the image and color it white
		$im->filledRectangle($min, 12, $max, 630,$bar);

# add the Jepson elevation label
		$im->string(gdSmallFont,$min,600,"Jepson elevation range: ".$min."0m to ".$max."0m",$dkblue);

# formats for the colored ticks along the right edge
		$im->string(gdLargeFont,120,550,"$taxon_label",$pink);
		$im->string(gdLargeFont,121,550,"$taxon_label",$pink);
		$im->stringUp(gdLargeFont,480,350,"N Latitude",$black); 
		$im->stringUp(gdLargeFont,480,351,"N Latitude",$black); 
		$im->string(gdLargeFont,290,10,"Elevation (feet)",$black);
		$im->string(gdLargeFont,291,10,"Elevation",$black);
		$im->string(gdLargeFont,290,525,"Elevation (meters)",$black);
		$im->string(gdLargeFont,291,525,"Elevation",$black);
		$im->string(gdSmallFont,400,$whitney,"Mt. Whitney",$black);
		$im->string(gdSmallFont,400,$lyell,"Mt. Lyell",$black);
		$im->string(gdSmallFont,400,$shasta,"Mt. Shasta",$black);
		$im->string(gdSmallFont,400,$jacinto,"Mt. San Jacinto",$black);
		$im->string(gdSmallFont,400,$lassen,"Mt. Lassen",$black);

			foreach $tick (32 .. 43){
				$ticklat= $north_lat-int(($tick * 3600)/$scaling_factor);
				$im->string(gdSmallFont,0, $ticklat,"$tick-",$black);
			}

			#foreach $t ( 0 .. $north_lat){
			#	#print "\n$t";
			#	foreach $g ( 0 .. 630){
			#		if ($position{$t}{$g}){
				#print "   $g";
			#			$im->setPixel($g,$t,$pink);
			#			$im->setPixel($g,$t+1,$pink);
			#			$im->setPixel($g+1,$t+1,$pink);
			#			$im->setPixel($g+1,$t,$pink);
			#		}
			#	}
			#}

			foreach $elev_metric ( 1 .. 430){
				unless ($elev_metric % 50){
						$im->setPixel($elev_metric,520,$black);
						$im->setPixel($elev_metric,518,$black);
						$im->setPixel($elev_metric,516,$black);
						$im->setPixel($elev_metric,514,$black);
						$im->setPixel($elev_metric,512,$black);
						$im->setPixel($elev_metric,510,$black);
				}
	
				unless ($elev_metric % 100){
					$im->string(gdTinyFont,$elev_metric +2,520,$elev_metric."0",$black);
				}
			}

			foreach $elev_metric ( 1 .. 450){
				unless ($elev_metric % 50){
					$im->setPixel($elev_metric,0,$black);
					$im->setPixel($elev_metric,8,$black);
					$im->setPixel($elev_metric,6,$black);
					$im->setPixel($elev_metric,4,$black);
					$im->setPixel($elev_metric,2,$black);
					$im->setPixel($elev_metric,0,$black);
						my $feet=$elev_metric * 33;
						$im->string(gdTinyFont,$elev_metric +2,4,"$feet",$black);
				}

				unless ($elev_metric % 100){
					#$im->string(gdTinyFont,$elev_metric +2,4,"${elev_metric}0",$black);
				}
			}

			$im->filledRectangle($elevation, $latitude, $elevation+15, $latitude+15,$red);

			#my $poly = GD::Polygon->new;

	foreach(@result){
		chomp;
		($elevM,$latM)= split(/\t/);

		my $latY=$north_lat - int($latM*3600/$scaling_factor);
		my $elevX=int($elevM/10);

#print "E ".$elevX." -->L ".$latY."\n";
		#$position{$north_lat-$elevX}{$elevM}++;
	#$position{$north_lat - $lat}{$west_long - $long}++;

			#$im->filledRectangle($elevX, $latY, $elevX+2, $latY+2,$green);
my $unq = $latY.$elevX;

			foreach ($unq){
#print "\n$latY  X  $elevX\n";

				#$poly->addPt($latY,$elevX);

				#foreach $elevX ( 0 .. 630){
			#		if ($position{$t}{$g}){
#print "   $elevX\n\n";
			$im->filledRectangle($elevX, $latY, $elevX+3, $latY+3,$green);

						#$im->setPixel($elevX,$latY,$green);
						#$im->setPixel($elevX,$latY+5,$green);
						#$im->setPixel($elevX+5,$latY+5,$green);
						#$im->setPixel($elevX+5,$latY,$green);
					#}
				#}
			}
	}

			#$im->openPolygon($poly,$green);

# make sure we are writing to a binary stream
		#binmode STDOUT; #old Dick Moe line from 2012

		#print $query->header(-type=>'image/gif',-expires=>'+1d');#old Dick Moe line from 2012
		#print $query->header(-type=>'image/png',-expires=>'+1d');
		#print to window is not working, so I created a berkeley mapper export file
# Convert the image to PNG and print it on standard output
		#print $im->gif;  #old Dick Moe line from 2012
		my $png_data = $im->png;

#new code from GD
open(DISPLAY, ">/data/tmp$map_file_out") || do{
	print qq{<h2>Sorry, the IMAGE data file cannot be saved to Berkeley Mapper temp directory.</h2><h4>Contact Jason Alexander about this problem</h4>};
#
exit;
};

binmode DISPLAY;
print DISPLAY $png_data;
close(DISPLAY);


sub get_tid_accessions {
	$tid_acc=shift;
	my %seen=();
	my %store_AID=();
	my @acc=();


	open(TIDS,"/usr/local/web/ucjeps_data/ucjeps_data/CCH1_ELEV_TID_AID.out") || do{
	print qq{<H2>Sorry, the accession TID  file cannot be opened.</H2><h4>Contact Jason Alexander about this problem</h4>};

exit;
	};

			while(<TIDS>){
				chomp;
				my ($key, $acclist) = split (/==>/,$_);
				
				#foreach($key){
				#	if($key =~ m/^$lookfor$/){
				#		@acc=split(/\t/,$acclist);

				$acclist =~ s/^\t//;

				foreach($key){
					if ($key =~ m/^$lookfor$/){
#print <<EOP
#$key\t$acclist
#EOP
						$store_AID{$key} = $acclist;
					}
				}

			}
close(TIDS);

				while ( my ($found_tid,$aid_list) = each(%store_AID) ) {

						foreach($found_tid){
							@AIDLIST=split(/\t/,$aid_list);
						}
				}

		return @AIDLIST;
	#return %store_AID;
}





sub push_result {
	my $accession=shift;
	#print $accession;
	@DBM_fields=split(/\t/,$DBM{$accession}, 10);

			my $elev=$DBM_fields[1];
			return 0 unless (length($elev) > 0);

			my $lat=$DBM_fields[2];
	
push(@result, <<EOP
$elev\t$lat
EOP
);

	}



}
