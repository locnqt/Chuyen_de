#!\usr\bin\perl 
use Digest::MD5 qw(md5 md5_hex md5_base64);
use Digest::MD5::File; 
use File::Basename;


# printf "            
#                    ...
#                  ;::::;              
#                ;::::; :;
#              ;:::::'   :;
#             ;:::::;     ;.
#            ,:::::'       ;           OOO\
#            ::::::;       ;          OOOOO\
#            ;:::::;       ;         OOOOOOOO
#           ,;::::::;     ;'         / OOOOOOO
#         ;:::::::::`. ,,,;.        /  / DOOOOOO
#       .';:::::::::::::::::;,     /  /     DOOOO
#      ,::::::;::::::;;;;::::;,   /  /        DOOO
#     ;`::::::`'::::::;;;::::: ,#/  /          DOOO
#     :`:::::::`;::::::;;::: ;::#  /            DOOO
#     ::`:::::::`;:::::::: ;::::# /              DOO
#     `:`:::::::`;:::::: ;::::::#/               DOO
#      :::`:::::::`;; ;:::::::::##                OO
#      ::::`:::::::`;::::::::;:::#                OO
#      `:::::`::::::::::::;'`:;::#                O
#       `:::::`::::::::;' /  / `:#
#        ::::::`:::::;'  /  /   `#
    
                                                                       
#  \n";

#my $folderpath = 'C:\Users\thanh\Desktop\bt_perl\Hello';
print "Enter filepath you want to check: ";
my $folderpath = <STDIN>;
chomp($folderpath);
$sname = basename($folderpath);
my $file = "zzCSDL.txt";
if(!-e $file){
    print "Set up for frist times!! Please wait a second.....\n";
    unless(open FILE, '>'.$file) {
    die "\nCan't create file $file\n";
    }
    createsubFolder($folderpath);
    close FILE;
    print "DONE!!!\n";
}
&init_words; 
@checkdelete;
$count = 0;
%rvword = reverse %word;
printf "%-0s %-25s %-0s %-25s %-10s \n", "=","==========================","===","==============================","=";
printf "%-0s %-25s %-0s %-25s %-10s \n", "|","_______NAME_______________"," | ","__________STATE_______________","|";
&checkFolder($folderpath);
# $testcase = $word{'C:\Users\thanh\Desktop\bt_perl\11.txt'};
# print "11313131231$testcase";
if(-e $file){
open(my $fh, "<", $file)
	or die "Can't open $file: $!";
    $k = 0;
    while($row = <$fh>){
        chomp $row;
        $flagdl = 0;
        if($k % 2 == 0){      
            foreach $val (@checkdelete){
                chomp $val;
                if($row eq $val){
                    $flagdl =1;
                    #print "$row\n";
                    last;
                }   
            }
            if($flagdl ==0){
               my $infodl=  $word{$row};
               #print "$infodl";
               my @infodll = split ('/',$infodl);
               my $Path_= @infodll[1];
               my $namedl = basename($Path_) ;
               printf "%-2s %-25s %-4s %-29s %-10s \n","|", $namedl ," | ","Was deleleted!!","|";
            }

            
        }
        $k++;
    }
}



printf "%-0s %-25s %-0s %-25s %-10s \n", "=","==========================","===","==============================","=";
                                             
  print "\nDo u want to update Data ?(Y/N) ";
    $backup = <STDIN>;
    chomp($backup);
    if(lc($backup) eq "y"){
        unless(open FILE, '>'.$file) {
        die "\nCan't create file $file\n";
        }
        &createsubFolder($folderpath);
         print "DONE!!\n"
     }else {
        print "GOODBYE!\n";
    }

#sub ===================================================================================================================================
sub checkFolder{
    my $foldercheckchange = shift;
    opendir my($dh), $foldercheckchange or die "Couldn't open dir '$foldercheckchange': $!";
    while (readdir $dh){
        next if (($_ eq '.') || ($_ eq '..'));  
        if (-d "$foldercheckchange\\$_") {  
                checkState("$foldercheckchange\\$_");
                checkFolder("$foldercheckchange\\$_");
            } 
          else {
                checkState("$foldercheckchange\\$_");
          }
    }
        closedir $dh;
}  
sub init_words{
    open(TEMPMD5,$file);
    while($filename = <TEMPMD5>){
        chomp($filename);
        $word = <TEMPMD5>;
        chomp($word);
        $word{$filename} = $word;
    }
    close(TEMPMD5);
}
sub createsubFolder{
    my $dir = shift;
    my $dh;
    opendir($dh, $dir);
    while($file = readdir ($dh)){
         next if (($file eq '.') || ($file eq '..'));
          if (-d "$dir\\$file") {
               my $tempfd="$dir\\$file"; 
                my $tempfdid= qx{"fsutil file queryfileid $tempfd"}; 
                chomp($tempfdid);
                $temp_md5_save = &CodeMD5($dir,$file);
                print FILE "$tempfdid\n";
                print FILE "$temp_md5_save";
                print FILE "/";
                print FILE "$tempfd\n";
                &createsubFolder("$dir\\$file");
            } 
          else {
                my $temp = "$dir\\$file";
                my $tempid = qx{"fsutil file queryfileid $temp"}; 
                chomp($tempid);      
                $temp_md5_save = &CodeMD5($dir,$file);
                print FILE "$tempid\n";
                print FILE "$temp_md5_save";
                print FILE "/";
                print FILE "$temp\n";
          }
    }
    closedir $dh;
    }
sub CodeMD5{
    local($path,$somename) = @_;
    $somepath1 ="$path"."\\$somename";
    if(-f $somepath1){
        $md5 = Digest::MD5::File->new;
        $md5->addpath( $somepath1 ); 
        $temp_md5_save = $md5->hexdigest;
        chomp($temp_md5_save);
        return $temp_md5_save;
    }else{
        $md5 = Digest::MD5::File->new;
        $md5->adddir( $somepath1 ); 
        $temp_md5_save = $md5->hexdigest;
        chomp($temp_md5_save);
        return $temp_md5_save;
    }
}
sub checkState{
    my $filecheck = shift;
    my $cname = basename($filecheck);
    my $foldercheck = dirname($filecheck);
    my $new_md5 = &CodeMD5($foldercheck,$cname);
    my $current_id = qx{"fsutil file queryfileid $filecheck"};  
    @checkdelete[$count] = $current_id;
    $count++;
    chomp($current_id);
    my $tempcheckfn = "$new_md5"."/$filecheck"; 
    my $flagstr = $word{$current_id}; 
    my @spflagstr = split ('/',$flagstr);
    my $MD5_old= @spflagstr[0];
    my $Path_old= @spflagstr[1];
    my $ID_old = $rvword{$tempcheckfn}; # ""
    if($flagstr eq ""){
        printf "%-2s %-25s %-4s %-29s %-10s \n","|", $cname," | ","Only recently created!!","|";
    }else{
        if($flagstr eq $tempcheckfn){
            printf "%-2s %-25s %-4s %-29s %-10s \n","|", $cname," | ","Not Change!","|";
        }elsif($new_md5 eq $MD5_old){
            my $new_name = basename($Path_old);
            if($new_name eq $cname ){
                printf "%-2s %-25s %-4s %-29s %-10s \n","|", $new_name," | ","Not Change!","|";
            }else{
                printf "%-2s %-25s %-4s %-29s %-10s \n","|", $new_name," | ","FName changed to $cname","|";  
            }
        
        }elsif($filecheck eq $Path_old){  
            printf "%-2s %-25s %-4s %-29s %-10s \n","|", $cname," | ","Changed the content!","|"; 
        }else{
            my $new_name = basename($Path_old);
            printf "%-2s %-25s %-4s %-29s %-10s \n","|", $new_name," | ","FName and FContent changed to $cname","|";
        }
    }
}    
