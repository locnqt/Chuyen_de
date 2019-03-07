#! /usr/bin/perl
use Digest::SHA1;
print "File name: ";
    $file = <>;
chomp($file);
my $filename = shift || "lab2/$file";
my $file_id = `fsutil file queryfileid $filename`;
my @id;
@id = split(' ', $file_id);
#print $id[3];

open (my $fh, '<', $filename) or die "Can't open '$filename': $!";
binmode ($fh);
my $epoch_timestamp = (stat($fh))[9];
my $timestamp       = localtime($epoch_timestamp);
$hash = Digest::SHA1->new->addfile($fh)->hexdigest;
#print $hash, " $filename\n";
my @log;
my $logname;
my $new = 0;
my $filename = shift || "lab2/output.log";
if (open(my $fh, '<', $filename)) {
	while (my $row = <$fh>) {
		chomp $row;
		#print "Line $l: $row\n";
		@log = split(' ', $row);
		if($id[3] eq $log[7]){
			$logname = $log[0];
			$oldhash = $log[1];
			$new = 0;
		}
		else{
			$new = 1;
		}
	}
}
$date = $log[2]. ' ' .$log[3]. ' ' .$log[4]. ' ' .$log[5]. ' ' .$log[6];
if($new==0){
	if(($hash eq $oldhash) && ($file eq $logname)){
		print "File $file not changed\n";
	}
	elsif (($hash ne $oldhash) && ($file eq $logname)){
		print "File $file Content changed at '$date'\n";
	}
	elsif (($hash eq $oldhash) &&($file ne $logname)){
		print "File $logname changed name to $file at '$date'\n";
	}
	else {
		printf "File changed at '$date'\n";
	}
} else{
	print "Add new file to log";
}
	my $filelog = shift || "lab2/output.log";
	open(my $fh, '>>', $filelog) or die "Could not open file '$filelog' $!";
	$write = $file. ' ' .$hash. ' ' .$timestamp. ' ' .$id[3];
	say $fh $write;
	close $fh;
