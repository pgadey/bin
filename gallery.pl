#!/usr/bin/perl -w
use strict;
use File::Slurp;

my $outfile = "gallery.html";
my @pics = glob("*.JPG");
my $bg   = "black";
my $font = "white";

open OUT, ">", $outfile;
select OUT;
print "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n";
print "<html>\n";
print "<head>\n";
print "<title>cell phone camera dump</title>\n";
print "<body bgcolor=$bg vlink=#c0c0c0 link=#c0c0c0 text=$font>\n";
print "<center>\n";
print "<p>";

foreach (@pics) {
	my @picname = split /\/+/, $_;
	my $pic = pop(@picname);

	if (-f "$pic.txt"){
		print "<a href=\"$pic\"><img src=\"thumb/$pic\" border=1 style=\"border-color: green\" title=\"" . read_file("$pic.txt") . "\"></a>\n";
	} else {
		print "<a href=\"$pic\"><img src=\"thumb/$pic\" border=1 alt=\"$pic\"></a>\n";
	}
}

print "</p>";

print "<p>written by: vincent zeng (hvincent at <a href=\"http://modgethanc.com\">modgethancdotcom</a> a.k.a. <a href=\"http://ctrl-c.club/~endorphant/\">~endorphant</a>)</p>\n";
print "</center></body></html>";

close OUT;
