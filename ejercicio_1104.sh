# 1)  Write a script that, for a given csv file and
# column number, prints:
# - Column name
# - Number of distinct values
# - Minimum value
# - Maximum value

# First, we need to extract the column name.
# For example, for the Buzzard data file, and col 7

cut -d ',' -f 7 ./Buzzard2015_data.csv | head -n 1

# biomass

# Second, we need to obtain the number of
# distinct values. We can sort the results
# (after removing the header), and use uniq

cut -d ',' -f 7 ./Buzzard2015_data.csv | tail -n +2 | sort | uniq | wc -l

# 285

# Third, to get the max/min value we can use
# the code above, sort using -n, and either
# head (for min) or tail (for max) the result.

# Minimum
cut -d ',' -f 7 ./Buzzard2015_data.csv | tail -n +2 | sort -n | head -n 1

# 1.048466198

# Maximum
cut -d ',' -f 7 ./Buzzard2015_data.csv | tail -n +2 | sort -n -r | head -n 1

# 14897.29471
