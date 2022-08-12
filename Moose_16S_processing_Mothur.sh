# 16S_processing of Isle Royale Moose Microbiome 16S Data from BSU - AMS - 4 Aug 2022 
# Mothur v.1.48.0

# Demultiplexing using idemp
#cd /software
#git clone https://github.com/yhwu/idemp
#cd idemp
#make
#make test
#export PATH=$PATH:/software/idemp/
#idemp -b barcodes.txt -I1 barcodes.fastq.gz -R1 forward.fastq.gz -R2 reverse.fastq.gz -m n -o demultiplexed/

# Make IsleRoyale.txt file containing
#sampleID forwardread reverseread

# Mothur pipeline 

#InputDir /export/lv_data/data/amstromecki/Moose_16S_mothur/Reads/demultiplexed/
#OutputDir /export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/

#make.contigs(file=../IsleRoyale.files.txt, inputdir=./demultiplexed/, outputdir=../analysis)
#summary.seqs(fasta=IsleRoyale.files.trim.contigs.fasta, inputdir=./analysis)
    #Previously screened out minlength=252bp --> why there is another good.fasta suffix 
#screen.seqs(fasta=IsleRoyale.files.trim.contigs.good.fasta, maxambig=0, maxhomop=8, maxlength=275, minlength=251)
#unique.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.contigs.count_table)
#summary.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.count_table)
#align.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.fasta, reference=../../dbs/silva_v132.v4v5.fasta)

#screen.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.align, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.count_table, summary=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.summary, start=1863, end=11445, minlength=252, maxhomop=8)
#summary.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.align, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.good.count_table)
#filter.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.align, vertical=T, trump=.)
#unique.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.good.count_table)
#pre.cluster(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.count_table, diffs=2)
#chimera.vsearch(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.count_table, dereplicate=t)
    ##Note: after chimera.vsearch, automatically ran remove.seqs(fasta=current, accnos=current)

    #Removing chimeras from your input files:
    #/******************************************/
    #Running command: remove.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.fasta, accnos=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.accnos)
    #Removed 297403 sequences from /export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.fasta.

    #Output File Names:
    #/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.pick.fasta
#summary.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.count_table)
#classify.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.fasta, count=c/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.count_table, reference=../../dbs/silva.nr_v138_1.align, taxonomy=../../dbs/silva.nr_v138_1.tax, cutoff=80)
#remove.lineage(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.count_table, taxonomy=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.nr_v138_1.wang.taxonomy, taxon=unknown-Eukaryota-Mitochondria-Chloroplast)
#summary.tax(taxonomy=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.nr_v138_1.wang.pick.taxonomy, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table)
#summary.seqs(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table)
#cluster.split(fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.fasta, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table, taxonomy=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.nr_v138_1.wang.pick.taxonomy, taxlevel=4, cutoff=0.03, cluster=f)
#cluster.split(file=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.file, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table)
#make.shared(list=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.opti_mcc.list, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table, label=0.03)
#classify.otu(list=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.opti_mcc.list, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table, taxonomy=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.nr_v138_1.wang.pick.taxonomy, label=0.03)
#get.otured(list=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.opti_mcc.list, count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table, fasta=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.fasta, method=abundance)
#system(cp /export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.opti_mcc.shared ./IsleRoyale.final.shared)
#system(cp /export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.opti_mcc.0.03.cons.taxonomy ../final/)

# Three groups had <100 sequences. Removed.
#remove.groups(count=/export/lv_data/data/amstromecki/Moose_16S_mothur/analysis/IsleRoyale.files.trim.contigs.good.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.opti_mcc.0.03.rep.count_table, fasta=current, taxonomy=current, groups=12575.W19.066-12575.W19.011-12575.W13.105)
#Removed 175 sequences from your count file.
#Removed 4 sequences from your fasta file.
#Removed 4 sequences from your taxonomy file.