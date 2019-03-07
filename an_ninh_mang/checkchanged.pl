#! /usr/bin/perl -w
use Digest::SHA1;
use File::Find;
`icacls "D:/Chuyen_de/an_ninh_mang/checkchanged.pl" /grant Users:F`;
print "Path name: ";
    $mypath = <STDIN>;
chomp($mypath);
#$mypath = "/home/locnqt/Desktop/lab2/";
#my $mypath   = $ARGV[0];
#my ($mypath) = @ARGV;
`icacls "$mypath" /grant Users:F`;
my @id;
my $filelog = shift || "D:/Chuyen_de/an_ninh_mang/lab2/output.log";
`icacls "$filelog" /grant Users:F`;
chomp($filelog);
my @log; my @log1;
my @check;
my $logname;
my $oldhash;
my $write='';
my $find='/'; #\
my $replace='-';
my $ischanged=0;
find sub{
    push @folders,"$File::Find::name" if(-d $File::Find::name);
},$mypath;
for my $i (@folders){
    #print "$i \n";
    my @dirc = glob("$i/*.*");
foreach $path (@dirc) {
   #print "path: $path\n";
	my $filename = (split'/', $path)[-1];
	#print "file: $filename\n";
	my $file_id = `fsutil file queryfileid "$path"`;
	@id = split(' ', $file_id);
	open (my $fh, '<', $path) or die "Can't open '$path': $!";
	binmode ($fh);
	my $epoch_timestamp = (stat($fh))[9];
	my $timestamp       = localtime($epoch_timestamp);
	$hash = Digest::SHA1->new->addfile($fh)->hexdigest;
	close $fh;
	my $isnew = 0;
	my $ismove = 0;
	$path =~ s/\Q$find\E/$replace/g;
	open($fh1, '<', $filelog) or die "Couldn't open file $filelog, $!";
	while ($row = <$fh1>) {
		chomp $row;
		@log = split(',', $row);
		#push(@log,split(',', $row));
		if($row ne ''){
			if($id[0] eq $log[3]){
				$logname = (split'-', $log[0])[-1];
				#$logname =~ s/\Q$replace\E/$find/g;
				if($path ne $log[0]){ $ismove=1;}
				$oldhash = $log[1];
				$isnew = 1;
				push(@check,$row);
				#`chmod a+rwx "$filelog"`;
				`perl -ni -e "print unless /^$row/" "$filelog"`;
				last;
			}
		}
	}
	close $fh1;
	if($isnew!=0){
		if($ismove==1){
			$path =~ s/\Q$replace\E/$find/g;
			$log[0] =~ s/\Q$replace\E/$find/g;
			print "File $filename move from $log[0] to $path\n";
			$ischanged=1;
			#print "WARNING - Folder changed."; exit(1);
		}
		if(($hash eq $oldhash) && ($filename eq $logname)){
			#print "File $filename not changed\n";
			#if($ischanged==0){print "OK - Folder not changed."; exit(0);}
		}
		if (($hash ne $oldhash) && ($filename eq $logname)){
			print "File $filename Content changed at '$log[2]'\n";
			$ischanged=1;
			#print "WARNING - Folder changed."; exit(1);
		}
		if (($hash eq $oldhash) &&($filename ne $logname)){
			print "File $logname changed name to $filename at '$log[2]'\n";
			$ischanged=1;
			#print "WARNING - Folder changed."; exit(1);
		}
		if (($hash ne $oldhash) && ($filename ne $logname)) {
			printf "File $logname changed name to $filename and Content changed at '$log[2]'\n";
			$ischanged=1;
			#print "WARNING - Folder changed."; exit(1);
		}

	} else{
		$path =~ s/\Q$replace\E/$find/g;
		print "Add new file $filename to $path\n";
		$ischanged=1;
		#print "WARNING - Folder changed."; exit(1);
	}
	$path =~ s/\Q$find\E/$replace/g;
	$write = $write.$path. ',' .$hash. ',' .$timestamp. ',' .$id[0]. "\n";
}
}
open($fh3, '<', $filelog) or die "Couldn't open file $filelog, $!";

while ($row1 = <$fh3>) {
	chomp $row1;
	#print "Line: $row end\n";
	if($row1 ne ''){
		@log1 = split(',', $row1);
		$log1[0] =~ s/\Q$replace\E/$find/g;
		print "File $log1[0] was deleted.\n";
		$ischanged=1;

	}

}
close $fh3;
#sleep(3);
open($fh2, '>', $filelog) or die "Could not open file '$filelog' $!";
print $fh2 $write;
close $fh2;
if($ischanged==0){
	print "OK - Folder $mypath not changed.\n"; exit(0);
}else{
	print "WARNING - Folder $mypath changed.\n"; exit(1);
}