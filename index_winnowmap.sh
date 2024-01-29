## Jacob G | Lareau Lab | Jan 29 2023
## Automated script to take a cmd line argument and then winnowmap index that badboy.
## Done using the meryl k-mer counting tool idk man I manually set the winnowmap path bc this will be deployed on a job eventually
winnow=~/bin/Winnowmap/bin/

in_fa=$1
the_k=15 ## why not 9-mers???

## mapping 15k mers??? IDK HOW TO CHECK WHA
$winnow/meryl count k=$the_k output merylDB $in_fa
$winnow/meryl print greater-than distinct=0.9998 merylDB > ${in_fa}.rep_k${the_k}.cnts ## allofus research workbench doesnt allow .txt or .csv or .tsv files to be exported its crazy bro... 


## now you can supposedly align via
#$winnow/winnowmap -W ${in_fa}.rep_k15.txt -ax map-pb $in_fa hifi.fq.gz > output.sam

