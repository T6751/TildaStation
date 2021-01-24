#! /usr/bin/awk -f

# Finds incorrect indentation of absolute path definitions in DM code
# For example, the following fails on the indicated line:

#/datum/path/foo
#	x = "foo"
# /datum/path/bar // FAIL
#	x = "bar"

{
	# mixed indentation tab-space-tab
	if ( $0 ~ /\t+ +/ ) {
		print FILENAME":"FNR":" $0
		fail = 1
	}

}

END {
	if ( fail ) {
		print "FAIL"
		exit 1
	}
	print "TRUE"
}
