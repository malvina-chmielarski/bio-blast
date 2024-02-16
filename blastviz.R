# R script to visualize blast results

## Read in blast results as table
blast_out <- read.table('mm-second.x.zebrafish.tsv', sep='\t')

## Assign Column names
colnames(blast_out) <- c("qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore")

## Plot blast results and save to pdf
pdf("blast_results.pdf",width=7,height=5)
hist(blast_out$evalue)
hist(blast_out$bitscore)
plot(blast_out$pident, blast_out$bitscore)
plot(blast_out$pident  * (blast_out$qend - blast_out$qstart), blast_out$bitscore)
dev.off()
