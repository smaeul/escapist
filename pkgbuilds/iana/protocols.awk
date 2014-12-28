#!/bin/awk -f

BEGIN {
	print "# See the full IANA XML file at: /share/iana/protocol-numbers.xml\n"
	FS="[<>]"
}

{
	if (/<record/) { v=n=0 }
	if (/<value/) v=$3
	if (/<name/ && !($3~/ /)) n=$3
	if (/<\/record/ && (v || n=="HOPOPT") && n) printf "%-12s %3i %s\n", tolower(n),v,n
}
