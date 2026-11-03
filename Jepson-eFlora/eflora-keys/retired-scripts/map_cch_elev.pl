#!/usr/bin/perl
use CGI;
use BerkeleyDB;
$data_path	="/usr/local/web/ucjeps_data/ucjeps_data/";
 my $filename = "${data_path}JEPS_elev.hash";
    tie %jeps_elev, "BerkeleyDB::Hash",
                -Filename => $filename,
-Flags => DB_RDONLY
        or die "Cannot open file $filename: $! $BerkeleyDB::Error\n" ;



#Output file to store data for Berkeley Mapper

#data files
#$CDL_name_list_file	="${data_path}CDL_name_list.txt";
$CDL_DBM_file	="${data_path}CDL_DBM";
#$CDL_taxon_id_file	="${data_path}CDL_TID_TO_NAME";
#$CDL_nomsyn_file	="${data_path}CDL_nomsyn";
#$CDL_taxsyn_file	="${data_path}CDL_taxsyn";
#tie(%nomsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_nomsyn_file", -Flags=>DB_RDONLY)|| die "$!";
#tie(%taxsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_taxsyn_file", -Flags=>DB_RDONLY)|| die "$!";

tie %CDL, "BerkeleyDB::Hash", -Filename=>"$CDL_DBM_file", -Flags=>DB_RDONLY or die "Cannot open file CDL_DBM: $! $BerkeleyDB::Error\n" ;
#tie(%TID_TO_NAME, "BerkeleyDB::Hash", -Filename=>"$CDL_taxon_id_file", -Flags=>DB_RDONLY)|| die "$!";

#multiplication sign for hybridity
$times=CGI::Util::unescape("%D7") || "flabba";
$query = new CGI;                        # create new CGI object
#print $query->header;                    # create the HTTP header
#print "OK";
@result=();
$lookfor=$query->param('taxon_name');
$lookfor=ucfirst($lookfor);
if($lookfor=~s/<script.*//i){
$lookfor="Strange search";
}
$record_t	=$query->param('t');
$record_g	=$query->param('g');
$genus=$query->param('genus');
if($genus){
($lookfor_genus=$lookfor)=~s/ .*//;
}
$taxon_label=ucfirst($lookfor);

#if($lookfor){
	#$lookfor=~s/ [xX] / $times /;
	#$lookfor=~s/ $times([a-z])/ $times $1/;
		#%name_acc=&get_name_acc($lookfor);
#
	#foreach(keys(%name_acc)){
			#&push_result($_);
	#}
#}
if($lookfor_genus){
		#%name_acc=&get_name_acc($lookfor_genus);
#
	foreach($lookfor_genus){
			#&push_genus_result($_);
			&push_genus_result($_);
	}
}

if($lookfor){
if($jeps_elev{lc($lookfor)}){

$lookfor=~s/ (var\.|subsp\.|ssp\.|f\.|forma)//;

($min,$max)=split(/\t/, $jeps_elev{lc($lookfor)});
$min= int($min /10);
$max =int($max/10);
$max +=1 if $max==$min;
}
	#if($lookfor=~/ACEAE$/){
	#print $lookfor;
        	#%name_acc=&get_fam_acc($lookfor);
	#}
	#else{
	#$lookfor=~s/ [xX] / $times/;
#$lookfor=~s/ $times([a-z])/ $times $1/;
   	#tie(%nomsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_nomsyn_file", -Flags=>DB_RDONLY)|| die "$!";
    	($ns_lookfor=$lookfor)=~s/ (var\.|subsp\.|ssp\.|f\.|forma)//;

#$tns=$taxsyns{$ns_lookfor} || "";

$nomsyns=lc($ns_lookfor);

	#if($nomsyns{lc($ns_lookfor)} || $tns){
#die;
	#if(lc($ns_lookfor){
		#@nomsyns=split(/\t/,$nomsyns{lc($ns_lookfor)});
		#push(@nomsyns,$tns) if $tns;
        	#foreach(@nomsyns){
			#unless($max){
			#	if($jeps_elev{lc($lookfor)}){
			#		($min,$max)=split(/\t/, $jeps_elev{lc($lookfor)});
#$min= int($min /10);
#$max =int($max/10);
					#$max +=1 if $max==$min;
				#}
			#}
			#%name_acc=$_;
            		#%acc_buffer=&get_name_acc($_);
            		#while(($ns_key,$ns_value)=each(%acc_buffer)){
                	#	$name_acc{$ns_key}=$ns_value;
            		#}
        	#}
    	#}
	#else{
		#%name_acc=&get_name_acc($lookfor);
		#%name_acc=$lookfor;
	#}
	foreach($nomsyns){
			&push_result($_);
	}
	#untie(%nomsyns);
#}
}





sub get_name_acc {
	my $lookfor=shift;
	$lookfor=~s/(var\.|subsp\.) //;
	use Search::Dict;
	open(NAMES,"$CDL_name_list_file") || print "I cant open names file\n";
	$lookfor=lc($lookfor);
	look(\*NAMES, $lookfor);
	while(<NAMES>){
		if(m/^$lookfor/){
			chomp;
			s/^.* ([A-Z])/$1/;
			s/	*$//;
			@acc=split(/\t/);
			foreach(@acc){
				$found_names{$_}++ if $_;
			}
		}
		else{
			last;
		}
	}
	close(NAMES);
	return %found_names;
}

sub push_result {
	my $accession_id=shift;
#print $accession_id;
	@CDL_fields=split(/\t/,$CDL{$accession_id}, 100);
	#return 0 unless $CDL_fields[$#CDL_fields]=~/^CA$/i;
	$elev=$CDL_fields[9];
return 0 unless (length($elev) > 0);
	$elev=~s/,//g;
	$elev=~s/zero/0/;
	$elev=~s/[Ss]ea [Ll]evel/0/;
	$elev=~s/ca?\.? //;
	$elev=~s/ca\.//;
	$elev=~s/[<>]//g;
	$elev=~s/^(about|above|near|above|below) //;
	$elev=~s/ ?\(.*//;
	if($elev=~s/(\d) ?[Ff].*/$1/){
		unless($elev=~s!(\d+) *(to|-) *(\d+)!int($1/3.281) . "-" .int($3/3.281)!e){
			$elev=int($elev/3.281);
		}
}
$elev=~s/ to /-/;
$elev=~s/ ?[mM].*//;

	if($CDL_fields[11]){
$lat=$CDL_fields[11];
if($elev=~m/(\d+)-(\d+)/){
	push(@result, <<EOP
$1\t$2\t$lat
EOP
);
}
else{
	push(@result, <<EOP
$elev\t$elev\t$lat
EOP
);
}
	}

}
sub push_genus_result {
	my $accession_id=shift;
	@CDL_fields=split(/\t/,$CDL{$accession_id}, 100);
	return 0 unless $CDL_fields[$#CDL_fields]=~/^CA$/i;
	$elev=$CDL_fields[9];
return 0 unless (length($elev) > 0);
	$elev=~s/,//g;
	$elev=~s/zero/0/;
	$elev=~s/[Ss]ea [Ll]evel/0/;
	$elev=~s/ca?\.? //;
	$elev=~s/ca\.//;
	$elev=~s/[<>]//g;
	$elev=~s/^(about|above|near|above|below) //;
	$elev=~s/ ?\(.*//;
	if($elev=~s/(\d) ?[Ff].*/$1/){
		unless($elev=~s!(\d+) *(to|-) *(\d+)!int($1/3.281) . "-" .int($3/3.281)!e){
			$elev=int($elev/3.281);
		}
}
$elev=~s/ to /-/;
$elev=~s/ ?[mM].*//;

	if($CDL_fields[11]){
$lat=$CDL_fields[11];
if($elev=~m/(\d+)-(\d+)/){
	push(@genus_result, <<EOP
$1\t$2\t$lat
EOP
);
}
else{
	push(@genus_result, <<EOP
$elev\t$elev\t$lat
EOP
);
}
	}

}
#NEED TO CONVERT DEG TO RAD
#$long=int(&r_to_d(sin(&d_to_r($long_degr)))*3600/$scaling_factor);
$pi=3.1419;
sub d_to_r{
$degrees=shift;
$radians=($degrees/180)*$pi;
}


$scaling_factor=60;
$north_lat= int((43 * 3600)/$scaling_factor);
$south_lat = int((32 * 3600)/$scaling_factor);
#foreach $i (32 .. 43){
#$tick{$i}= int(($i * 3600)/$scaling_factor);
#}
$whitney=$north_lat - int((36.579 * 3600)/$scaling_factor);
$lyell=$north_lat - int((37.739 * 3600)/$scaling_factor);
$shasta=$north_lat - int((41.32 * 3600)/$scaling_factor);
$jacinto=$north_lat - int((33.815 * 3600)/$scaling_factor);
$lassen=$north_lat - int((40.492 * 3600)/$scaling_factor);
$record_t=$north_lat - int(($record_t * 3600)/$scaling_factor);

$record_g=~s/[ -].*//;
$record_g=~s/%20.*//;
$record_g=~s/[^0-9]+//g;
$record_g=int($record_g/10);
#$west_long=int(125*3600)/$scaling_factor;
foreach(@genus_result){
	chomp;
	($elev_min, $elev, $lat)= split(/\t/);
	next if $lat=~/UNK/;
	$lat=int($lat*3600/$scaling_factor);
	$elev=int($elev/10);
	#print "E $elev	L $lat\n";
	$genus_position{$north_lat-$lat}{$elev}++;
	#$position{$north_lat - $lat}{$west_long - $long}++;
}

foreach(@result){
	chomp;
	($elev_min, $elev, $lat)= split(/\t/);
	next if $lat=~/UNK/;
	$lat=int($lat*3600/$scaling_factor);
	$elev=int($elev/10);
	#print "E $elev	L $lat\n";
	$position{$north_lat-$lat}{$elev}++;
	#$position{$north_lat - $lat}{$west_long - $long}++;
}

        use GD;
            
        # create a new image
        $im = new GD::Image(500,650);

        # allocate some colors
        $white = $im->colorAllocate(255,255,255);
        $bar = $im->colorAllocate(225,225,255);
        $black = $im->colorAllocate(0,0,0);       
        $red = $im->colorAllocate(255,0,0);      
        $blue = $im->colorAllocate(0,0,255);
        $yellow = $im->colorAllocate(255,255,0);
#if($lookfor=~/eximium/){
#$im->filledRectangle(300, 12, 420, 630,$bar);
$im->filledRectangle($min, 12, $max, 630,$bar);
$im->string(gdSmallFont,$min,45,"Jepson elevation range: ${min}0m to ${max}0m",$blue);
#}
$im->string(gdLargeFont,120,20,"$taxon_label",$blue);
$im->string(gdLargeFont,121,20,"$taxon_label",$blue);
$im->stringUp(gdLargeFont,480,350,"N Latitude",$black); 
$im->stringUp(gdLargeFont,480,351,"N Latitude",$black); 
$im->string(gdLargeFont,290,10,"Elevation (feet)",$black);
$im->string(gdLargeFont,291,10,"Elevation",$black);
$im->string(gdLargeFont,290,625,"Elevation (meters)",$black);
$im->string(gdLargeFont,291,625,"Elevation",$black);
$im->string(gdSmallFont,400,$whitney,"Mt. Whitney",$black);
$im->string(gdSmallFont,400,$lyell,"Mt. Lyell",$black);
$im->string(gdSmallFont,400,$shasta,"Mt. Shasta",$black);
$im->string(gdSmallFont,400,$jacinto,"Mt. San Jacinto",$black);
$im->string(gdSmallFont,400,$lassen,"Mt. Lassen",$black);
foreach $tick (32 .. 43){
$ticklat= $north_lat-int(($tick * 3600)/$scaling_factor);
$im->string(gdSmallFont,0, $ticklat,"${tick}-",$black);
}
foreach $t ( 0 .. $north_lat){
#print "\n$t";
foreach $g ( 0 .. 630){
if ($position{$t}{$g}){
#print "   $g";
                 $im->setPixel($g,$t,$blue);
                 $im->setPixel($g,$t+1,$blue);
                 $im->setPixel($g+1,$t+1,$blue);
                 $im->setPixel($g+1,$t,$blue);
}
elsif ($genus_position{$t}{$g}){
#print "   $g";
                 $im->setPixel($g,$t,$black);
                 $im->setPixel($g,$t+1,$black);
                 $im->setPixel($g+1,$t+1,$black);
                 $im->setPixel($g+1,$t,$black);
}
}
}
foreach $elev_metric ( 1 .. 430){
	unless ($elev_metric % 50){
                 $im->setPixel($elev_metric,650,$black);
                 $im->setPixel($elev_metric,648,$black);
                 $im->setPixel($elev_metric,646,$black);
                 $im->setPixel($elev_metric,644,$black);
                 $im->setPixel($elev_metric,642,$black);
                 $im->setPixel($elev_metric,640,$black);
	}
	unless ($elev_metric % 100){
		$im->string(gdTinyFont,$elev_metric +2,640,"${elev_metric}0",$black);
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
$feet=$elev_metric * 33;
		$im->string(gdTinyFont,$elev_metric +2,4,"$feet",$black);
	}
	unless ($elev_metric % 100){
		#$im->string(gdTinyFont,$elev_metric +2,4,"${elev_metric}0",$black);
	}
}
#open(OUT,">elevdot.gif") || die;
$im->filledRectangle($record_g, $record_t, $record_g+5, $record_t+5,$red);
binmode(STDOUT);
       print STDOUT  $query->header(-type=>'image/gif',-expires=>'+1d');
print STDOUT $im->gif;
close (STDOUT);

__END__
