#! /usr/bin/perl -w
use File::Find;
use Excel::Writer::XLSX;
print "Path name: ";
    $mypath = <STDIN>;
chomp($mypath);
#$mypath = "E:/IMT/1204_受領ソース/製造/01UI";
 
my $workbook  = Excel::Writer::XLSX->new( 'simple.xlsx' );
my $worksheet = $workbook->add_worksheet();
$count=3;
find sub{
    push @folders,"$File::Find::name" if(-d $File::Find::name);
},$mypath;
for my $i (@folders){
	print "$i \n";
	my $filename = (split'/', $i)[-1];
	print "file: $filename\n";
	$worksheet->write( $count, 2, $i );
	$count++;
}
$workbook->close;
$end = <STDIN>;