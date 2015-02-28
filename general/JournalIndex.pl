#!/usr/bin/perl

## Takes lists in the form:
#
#2014-01-01:
#	Judith
#	Robert
#2014-01-02:
#	Meeting
#	Dante
#	Robert
#
#And outputs lists in the form:
#
#Dante - 2014-01-02
#Judith - 2014-01-01
#Meeting - 2014-01-02
#Robert - 2014-01-01, 2014-01-02

%dates = (); #  (Robert => '2014-01-01, 2014-01-02')
$date = ""; # The date which is currently being processed
$subject = ""; # The subject which is currently being procressed

# read the first command line argument
open(MYINPUTFILE, "<$ARGV[0]");
while(<MYINPUTFILE>)
{
	my($line) = $_;
	chomp($line);

	if ($line =~ /^\t/) { #check if line begins with tab
		# We're on a subject line, set $subject.
		$subject = substr($line,1); #drop the initial tab
		#print "S $subject \n";
		#print "$subject -> $date \n";
		if ($dates{"$subject"} eq '') {
				# The first date lacks a comma
				$dates{"$subject"} .= "$date";
			} else {
				# All other dates get commas
				$dates{"$subject"} .= ", $date";
			}
	} else {
		# We're on a date line, set $date.
		$date = substr($line,0, -1); #drop the final :
		#print "D $date \n";
	}
}

# print the sorted subject => dates pairs
for(sort keys %dates){
    print("$_ - $dates{$_}\n");
}
