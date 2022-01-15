###################################################
# Exercise 1.10.1 on Marra & DeWoody (2014)
###################################################
# 1) Change directory 

# If you saved the directory CSB in your home
# directory, as suggested, you should be able
# to go to the sandbox by typing

cd ../Capturas_def  

###################################################
# 2) What is the size of the file
# Marra2014_data.fasta?

# The option -l of the command ls also reports
# the size of the file. Adding the flag -h
# makes it "human-readable" (i.e., using K, M,
# instead of printing the number of bytes). 

ls -lh ../GBI6_ExamenParcial1

# This should return 533K

###################################################
# 3) Create a copy of Marra2014_data.fasta in the
# sandbox and name it my_file.fasta

# To copy a file, use the command cp

cp Marra2014_data.fasta my_file.fasta

# To make sure the copy went well, list the files
# in the sandbox

ls

###################################################
# 4) How many contigs are classified as
# isogroup00036?

# To count the occurrences of a given string, use
# grep with the option -c

grep -c isogroup00036 my_file.fasta 

###################################################
# 5) Replace the original "two-spaces" delimiter
# with a comma.

# In the file, the information on each contig
# is separated by two spaces:
# >contig00001  length=527  numreads=2  ...

# We would like to obtain:
# >contig00001,length=527,numreads=2,...

# We can accomplish by using cat to print the
# file, and substitute the spaces using the
# command tr in combination with the option
# -s (squeeze).

# Before overwriting the file, let's make sure
# we didn't make any mistake: pipe the result
# to head to see the result.

cat my_file.fasta | tr -s ' ' ',' | head -n 3

# This should return:

#>contig00001,length=527,numreads=2,...
#ATCCTAGCTACTCTGGAGACTGAGGATTGAAGTTC...
#TTTACAATTAACCCACAAAAGGCTGTTACTGAAGG...

###################################################
# 6) How many unique isogroups are in the file?


grep '>' my_file.fasta | cut -d ',' -f 4 | sort | uniq | wc -l

# The answer is 43

###################################################
# 7) Which contig has the highest number of reads
# (numreads)? How many reads does it have?
 
grep '>' my_file.fasta | cut -d ',' -f 1,3 | sort -t '=' -k 2 -n -r | head -n 1

# >contig00302,numreads=3330

# Finding that contig 00302 has the highest
# coverage, with 3330 reads.
