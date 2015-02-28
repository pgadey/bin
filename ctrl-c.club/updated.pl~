#!/usr/bin/perl

print "
<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\n
<html>\n
<body>\n
This is a static list of the pages modified in <tt>/home/*/public_html/*</tt>. It updates every hour.<br>
<ul>\n";


while (<>) {
	chomp;
	($date, $index) = split(/ /, $_);
	#	print "$date \n";
	$date = `date --date="\@$date" +'%F %H:%M'`;
	#$index = ($index =~ m/pgadey/);
	$author = $index;
	$file = $index;
	$author =~ s%/home/(\w+)/public_html/(\S+)%$1%;
	$file =~ s%/home/(\w+)/public_html/(\S+)%$2%;
	print "<li><a href=\"http://ctrl-c.club/\~$author/\">$author</a> worked on <a href=\"http://ctrl-c.club/\~$author/$file\">$file</a> at $date</li>\n\n";
};

print "</ul>This page is compiled by a dirty Perl script written by a dirty open-source hippy for the edification of other dirty open-source hippies<sup><a href=\"http://ctrl-c.club/faq.html\">1</a></sup>. Let me know if you would like any modifications made. (Wed Dec 17 2014)</body></html>";
