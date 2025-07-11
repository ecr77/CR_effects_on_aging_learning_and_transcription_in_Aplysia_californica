#!/bin/bash
#BSUB -J unzip_files
#BSUB -q general
#BSUB -P fieberlab
#BSUB -o /scratch/projects/fieberlab/CR_Batch4/genome/transcriptome/mess.fa
#BSUB -e /scratch/projects/fieberlab/CR_Batch4/genome/transcriptome.err
#BSUB -n 1

gffread \
-w ../genome/transcriptome/transcripts.fa \
-g ../genome/fna/GCF_000002075.1_AplCal3.0_genomic.fna ../genome/gff/GCF_000002075.1_AplCal3.0_genomic.gff

