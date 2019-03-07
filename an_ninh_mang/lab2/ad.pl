#! /usr/bin/perl
use Digest::SHA1;
print "File name: ";
    $file = <>;
chomp($file);

my $filename = shift || "$file";
open (my $fh, '<', $filename) or die "Can't open '$filename': $!";
binmode ($fh);
$hash = Digest::SHA1->new->addfile($fh)->hexdigest;
#print $hash, " $filename\n";

my $filename = shift || "lab2/output.log";
if (open(my $fh, '<', $filename)) {
	while (my $row = <$fh>) {
		chomp $row;
		#print "Line $l: $row\n";
		my @log = split(' ', $row);
		if($file eq $log[0]){
			$oldhash = $log[1];
		}
	}
}
if($hash eq $oldhash){
	print "not changed\n";
}
else {
   printf "File changed\n";
	my $filelog = shift || "lab2/output.log";
	open(my $fh, '>>', $filelog) or die "Could not open file '$filelog' $!";
	$write = $file. ' ' .$hash;
	say $fh $write;
	close $fh;
}
