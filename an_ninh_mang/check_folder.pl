#!/usr/bin/perl
use Digest::MD5 qw(md5 md5_hex md5_base64);
use Digest::MD5::File qw(dir_md5_hex file_md5_hex url_md5_hex);
our $BASE_FOLDER = $ARGV[0];
our $BASE_FILE = $BASE_FOLDER . "/base.log";

my $md5 = Digest::MD5->new;
Main();
sub Main
{	
	Check_Base_Empty();
	#print "Hay nhap ten duong danh thu muc: ";
	#$dir = <STDIN>;
	#chomp $dir;
	$dir = $ARGV[1];
	
	$find = "/";
	$replace = "-";
	$fileout = $dir;
	$fileout =~ s/$find/$replace/ig;
	$fileout = $BASE_FOLDER . "/" . $fileout . ".log";
	
	my $list = Brower_Directories($dir,$fileout);
	
	if($list eq "")
	{ 
		print "CRITICAL	- The folder does not exist or empty\n";
		exit(2);
	}
	else
	{
		my $digest = md5_hex($list);
		my $hash = Check_Folder_Exists($dir);
		chomp $hash;
		if($hash eq "")
		{
			Write_Folder_Hash($dir,$digest);
			Brower_Directories_Files($dir,$fileout);
			print "OK - The directory is checked for the first time ..!\n";
			exit(0);
		}
		else
		{
			Check_Hash_Folder($dir,$digest,$hash,$fileout);
			
		}
	}

}

sub Check_Hash_Folder
{
	my($dir,$digest,$hash,$fileout)=@_;
	my $count = 0;
	if($digest eq $hash)
	{
		
		$count = $count + Check_Hash_AllFile($dir,$fileout,$count);
		if($count == 0)
		{
			print "OK - The directory does not change - Data file not changed\n";
			exit(0);
		}
		else
		{
			print "WARNNING - The directory does not change - There are $count files changed\n";
			exit(1);
		}
	}	
	else
	{
		print "WARNNING - The directory is changed..!\n";
		exit(1);
	}

}

sub Check_Hash_AllFile
{
	my($dir,$fileout,$count)=@_;
	my @files;
	opendir (DIR, $dir);
	while (my $file = readdir(DIR)) 
	{
        	push @files,$file;	
	}
	foreach(@files)
	{	
		$check = (($_ eq ".") || ($_ eq ".."));
		if ($check == 0)
		{	
			
			$count = $count + Check_Hash_File($dir,$fileout,$_);
			$folder = $dir . "/" . $_;
			if(-d $folder)
				{
					 Check_Hash_AllFile($folder,$fileout,$count);
					
				}
			
		}
	}
	return $count;
}
sub Check_Hash_File
{
	
	my($dir,$fileout,$filename)=@_;
	$link  = $dir . "/" . $filename;
	
	if(-f $link)
	{
		$md5->addpath($link);
		my $digest = $md5->hexdigest;
		open(my $in , '<' , $fileout )or die "Can't read old file: $!";
			my @line = <$in>;
		close $in;
		foreach(@line)
			{
				@array = split('          ',$_);
				if($array[0] eq $link)
					{
						
						if($array[1] eq $digest)
						{
							return 0;
						}
						else
						{
							return 1;
						}
					}
			}
		
	}
}
sub Write_Folder_Hash
{
	my($dir,$digest)=@_;
	open(my $out, '>>' , $BASE_FILE) or die "Can't read old file: $!";
    print $out "$dir          $digest\n";
    close $out;

}
sub Check_Folder_Exists
{
	my($dir)=@_;
	open(my $in,'<' ,$BASE_FILE) or die "Can't read old file: $!";
		my @line = <$in>;
	close $in;
	foreach(@line)
			{
				my @array = split('          ',$_);
				if($array[0] eq $dir)
				{
					return $array[1];
				}
			}		
	
	return "";
}
sub Check_Base_Empty
{	
	if(!(-f $BASE_FILE))
	{
		open(my $out, '>' , $BASE_FILE) or die "Can't read old file: $!";
    	print $out "";
    	close $out;
	}
	
}

sub Brower_Directories
{
	my($dir)=@_;
	my $list = "";
	my @files;
	opendir (DIR, $dir);
	while (my $file = readdir(DIR)) 
	{
        	push @files,$file;
			
	}
	foreach(@files)
	{
		$check = (($_ eq ".") || ($_ eq ".."));
		if ($check == 0)
		{	
			
			$list = $list . $_;
			$folder = $dir . "/" . $_;
			if(-d $folder)
				{
					
					$data = Brower_Directories($folder);
					$list = $list . $data;
					
				}
			
		}
	}
	return $list;
}

sub Brower_Directories_Files
{
	my($dir,$fileout)=@_;
	my @files;
	opendir (DIR, $dir);
	while (my $file = readdir(DIR)) 
	{
        	push @files,$file;
			
	}
	foreach(@files)
	{
		$check = (($_ eq ".") || ($_ eq ".."));
		if ($check == 0)
		{	
			Add_File_List($dir,$_,$fileout);
			$folder = $dir . "/" . $_;
			if(-d $folder)
				{
					Brower_Directories_Files($folder,$fileout);	
				}
			
		}
	}
	
}
sub Add_File_List
{
	my($dir,$filename,$fileout)=@_;
	$link  = $dir . "/" . $filename;
	if(-f $link)
	{	
		$md5->addpath($link);
		my $digest = $md5->hexdigest;
		@info = stat($link);
		my $inode = $info[1];
		$mess = "Add file $link success\n";
		Update($fileout,$link,$digest,$inode,$mess);
	}
	
}
sub Update
{
	
	my($fileout,$link,$digest,$inode,$mess) = @_;
	open(my $out, '>>' , $fileout) or die "Can't read old file: $!";
    print $out "$link          $digest          $inode\n";
    close $out;
	#print $mess;
    
}


