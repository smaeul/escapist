#!/bin/awk -f

BEGIN {
	print "# See the full IANA XML file at: /share/iana/service-names-port-numbers.xml\n"
	FS="[<>]"
}

{
	if (/<record/) { n=u=p=c=0 }
	if (/<name/ && !/\(/) n=$3
	if (/<number/) u=$3
	if (/<protocol/) p=$3
	if (/Unassigned/ || /Reserved/ || /historic/) c=1
	if (/<\/record/ && n && u && p && !c) printf "%-15s %5i/%s\n", n,u,p
}
