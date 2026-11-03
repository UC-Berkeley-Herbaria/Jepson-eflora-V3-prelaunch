use strict;
#use warnings;
use POSIX qw(strftime);

my ($added, %seen, %NAME_TO_CODE);
my ($image_taxon_id, $TName, @rest, $old, $revised);


#my $load_date = "2023-12-23";
#my $load_date = "2025-10-31";
#my $load_date = "2026-03-13";
my $load_date = "2026-06-11";


my $todayJD = &get_today;
$todayJD =~ s/ *PDT//;
$todayJD =~ s/ *PST//;

my $log_file = 'output/eflora_log'.$todayJD.'.txt';
	open(LOG, '>>', $log_file);

#sqlite3
open(OUT, ">output/load_illustration_table.sql") || die;

#mariaDB
open(EF, ">output/load_eflora_illustrations.sql") || die;


#load Taxon IDs for all taxa
open(IN, "../Synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;

next if (m/^#/);

	#25206	Eschscholzia californica	Eschscholzia	californica	unknown	Cham.	sp	0
	my ($TaxonID,$TName,@rest) = split(/\t/);

	$NAME_TO_CODE{$TName} = $TaxonID;
}

close (IN);


#process the jepson video file

open(IN, "input/video_tid.txt") || die;
while(<IN>){
	chomp;

next if (m/^#/);


	my ($vid_tid,$vid_url) = split(/\t/);


	#single quotes for SQL are added in the print OUT
	foreach ($vid_tid){


#-- Try to update any existing row
#UPDATE players
#SET age=32
#WHERE user_name='steven';

#-- If no update happened (i.e. the row didn't exist) then insert one
#INSERT INTO players (user_name, age)
#SELECT 'steven', 32
#WHERE (Select Changes() = 0);

#sqlite3
		print OUT "-- Try to update any existing row\n";
		print OUT "UPDATE eflora_illustrations SET VideoURL='".$vid_url."'\n";
		print OUT "WHERE TaxonID = ".$vid_tid."\n";
		print OUT ";-- If no update happened (i.e. the row didn't exist) then insert one\n";
		print OUT "INSERT INTO eflora_illustrations(TaxonID, VideoURL)\n";
		print OUT "SELECT ".$vid_tid.", '".$vid_url."'\n";
		print OUT "WHERE (Select Changes() = 0);\n\n";
		++$added;

#mariaDB export
		print EF "INSERT INTO eflora_illustrations(TaxonID, VideoURL, Updated)\n";
		print EF "VALUES(".$vid_tid.", '".$vid_url."', '".$load_date."')\n";
		#If the TaxonID in eflora_taxa already exists, update selected fields only 
		print EF "ON DUPLICATE KEY UPDATE VideoURL = '".$vid_url."', Updated = '".$load_date."'\n";
		print EF ";\n\n";

	}

}
close (IN);

#process the 2014 image files

open(IN, "input/name_illus_pairs.txt") || die;
while(<IN>){
	chomp;
	
next if (m/^#/);
	
	#f01287-01.txt	Agave shawii var. shawii
	my ($image_file_name,$image_taxon_name) = split(/\t/);

	next if $image_taxon_name =~ /aceae$/; #We skip pairing the images with the family caption, since they don't properly represent the family

	unless ($seen{$image_taxon_name}){
	#single quotes for SQL are added in the print OUT
		if ($NAME_TO_CODE{$image_taxon_name}){
			++$old;
			my $image_taxon_id = $NAME_TO_CODE{$image_taxon_name};

#sqlite3
		print OUT "-- Try to update any existing row\n";
		print OUT "UPDATE eflora_illustrations SET FileName='".$image_file_name."'\n";
		print OUT "WHERE TaxonID = ".$image_taxon_id."\n";
		print OUT ";-- If no update happened (i.e. the row didn't exist) then insert one\n";
		print OUT "INSERT INTO eflora_illustrations(TaxonID, FileName)\n";
		print OUT "SELECT ".$image_taxon_id.", '".$image_file_name."'\n";
		print OUT "WHERE (Select Changes() = 0);\n\n";

#mariaDB export
		print EF "INSERT INTO eflora_illustrations(TaxonID, FileName, Updated)\n";
		print EF "VALUES(".$image_taxon_id.", '".$image_file_name."', '".$load_date."')\n";
		#If the TaxonID in eflora_taxa already exists, update selected fields only 
		print EF "ON DUPLICATE KEY UPDATE FileName = '".$image_file_name."', Updated = '".$load_date."'\n";
		print EF ";\n\n";

		}
		else {
		print "no taxon id for $image_file_name\t$image_taxon_name\n";
		print LOG "no taxon id for $image_file_name\t$image_taxon_name\n";
		}
	}
}	
close (IN);

#process the newly revised image files

#open(IN, "input/name_illus_pairs_hi_res.txt") || die;
open(IN, "input/name_illus_pairs_REVISED.txt") || die;
while(<IN>){
	chomp;

next if (m/^#/);

	my ($acc_name,$image_name_new,$note) = split(/\t/);

	$seen{$acc_name}++;



#$large_image_name = $image_name_large.".png";
my $revised_image_name = $image_name_new.".png";
#$small_image_name = $image_name_small.".png";
#dump the originals now, leave this in place in case we make
#a larger version in the future sometime
#if the large file name is populated, then the revised directory will be accessed and not the old directory
#we decided to not actually display large images, so this is somewhat misnamed now, but it functions the same
#we want these revised images to replace all of the old versions eventually.
	#single quotes for SQL are added in the print OUT
	if ($NAME_TO_CODE{$acc_name}){
		++$revised;
		my $image_taxon_id = $NAME_TO_CODE{$acc_name};
		if ($image_name_new ne ""){
			print OUT "-- Try to update any existing row\n";
			print OUT "UPDATE eflora_illustrations SET FileName='".$revised_image_name."', LargeFileName='".$revised_image_name."'\n";
			#print OUT "UPDATE eflora_illustrations SET FileName='".$small_image_name."', LargeFileName='".$large_image_name."'\n";
			print OUT "WHERE TaxonID = ".$image_taxon_id."\n";
			print OUT ";-- If no update happened (i.e. the row didn't exist) then insert one\n";
			#print OUT "INSERT INTO eflora_illustrations(TaxonID, FileName, LargeFileName)\n";
			#print OUT "SELECT ".$image_taxon_id.", '".$small_image_name."', '".$large_image_name."'\n";
			print OUT "INSERT INTO eflora_illustrations(TaxonID, FileName, LargeFileName)\n";
			print OUT "SELECT ".$image_taxon_id.", '".$revised_image_name."','".$revised_image_name."'\n";
			print OUT "WHERE (Select Changes() = 0);\n\n";

#mariaDB export
			print EF "INSERT INTO eflora_illustrations(TaxonID, FileName, RevisedFileName, Updated)\n";
			print EF "VALUES(".$image_taxon_id.", NULL, '".$revised_image_name."', '".$load_date."')\n";
			#If the TaxonID in eflora_taxa already exists, update selected fields only 
			print EF "ON DUPLICATE KEY UPDATE FileName = NULL, RevisedFileName = '".$revised_image_name."', Updated = '".$load_date."'\n";
			print EF ";\n\n";
		}

	}
	else {
		print "no taxon id for $acc_name\t$image_name_new\n";
		print LOG "no taxon id for $acc_name\t$image_name_new\n";
	}
}
close (IN);





print LOG <<EOP;
BEGIN EFLORA ILLUS STATS

Records with Jepson Videos: $added

Records with revised res Images: $revised

Records with original 2014 Images: $old

END EFLORA ILLUS STATS
EOP

print <<EOP;

Records with Jepson Videos: $added

Records with revised res Images: $revised

Records with original 2014 Images: $old

END EFLORA ILLUS STATS
EOP


close (IN);
close (OUT);

sub get_today {
#usage: add the following line before processing records:
#$today_ymd = &CCH::get_today;
#!/usr/local/bin/perl
	my $datestring = strftime "%F %Z", localtime;
	return ($datestring);
}
