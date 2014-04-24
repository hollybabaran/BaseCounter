BaseCounter
===========

Clic Day Project 2014: Determine the number of bases we sequence per day


THE PLAN: 

All files that match 

/oicr/data/archive/*/*/Data/Intensities/*/BaseCalls/L[0-9]{3}/C[0-9.]+/*.bcl

and are newer than X file 

in X file, as a csv:
1. list all files that are newer
2. list their size in bytes 
3. list their size difference from last time (if they are a new entry, it is the file size)
4. #of bytes sequenced yesterday = the sum of the size differences. 


Next steps: 
1. record these daily reports, and do statistics!!!
2. give this daily report to ranauq 

----
1. BCL files will not change after they are written-- so depend on time stamps more than regex. Look at the mtime of directories to determine if files have changed. 
2. # of bases should always be teh same or less in a later cycle than an earlier cycle-- if it is larger than there is something wrong 
3. Cx.y => "x cycle attempt y". Only read ONE cycle of x: the latest attempt (highest y value). 
    eg. if the present cycles are C1.1 C1.2 C2.1, only read C1.2 and C2.1
4. nice to have: filter the BCL by quality; error check the BCL byte by byte; record data on a per-machine or per-run basis for better stats collection; dates 
----


RYAN: function: takes in a date, returns a list of files matching criteria ^ that have timestamp newer than the input file 

HOLLY: function: takes in hash of hash of machines/files/sizes, and 1 csv file
sums the sizes by machines and in totals 
prints the data nicely formatted to the csv
       function: main. Looks at the csv file, gets the date, passes it into ryan's function, then passes the returned hash into printing function 



