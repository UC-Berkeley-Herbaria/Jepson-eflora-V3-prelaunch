use BerkeleyDB;

tie(%IJM_key, "BerkeleyDB::Hash", -Filename=>"output/IJM_key.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";

#tie(%IJM, "BerkeleyDB::Hash", -Filename=>"output/IJM.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";
#tie(%IJM, "BerkeleyDB::Hash", -Filename=>"output/IJM_expanded.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";
open(IN, "output/eflora_keys_expanded.html") || die;
#$/="</blockquote>\n";
$/="\n";

while(<IN>){
next if m/^#/;
	chomp;
		next if m/^#/; #skip lines that are commented out
		
	($id,$value)=split(/\t/);
	$IJM_key{$id}=$value;
#warn "$id==>$value\n";
}
close(IN);
untie (%IJM_key);
#tie (%G_T_F, BerkeleyDB::Hash, -Filename =>G_T_F, -Flags => DB_CREATE);

tie %IJM, "BerkeleyDB::Hash", -Filename=>"output/IJM_key.hash", -Flags=>DB_CREATE or die "Cannot open file data_file $! $BerkeleyDB::Error\n";
while(($id,$value)=each(%IJM)){
print "HASH==>$id==>$value\n";
}
print scalar keys %IJM;