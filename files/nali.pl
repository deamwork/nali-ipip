while ($line=<>) {
    $line =~ s/((?:[0-2]?[0-9]{1,2}\.){3}[0-2]?[0-9]{1,2})/ipip($1)/eg;
    print $line;
}
sub ipip {
    my $ip=$_[0];

    my $addr;
    my $after;
    $addr=`ipipnali $ip`;

    #optimize output format
    $addr =~ s/\n//g;
    $addr =~ s/\t/ /g;
    $addr =~ s/[ ]*$//g;
    $addr =~ s/  */ /g;

    $after = `echo $addr | rd`;
    $after =~ s/\n//g;
    return "$ip $after";
    #return "$ip \[$addr\]";
}