#!/bin/bash
#BSUB -J unzip_files
#BSUB -q general
#BSUB -P fieberlab
#BSUB -o /scratch/projects/fieberlab/CR_Batch4/fastqc/S20.fastq
#BSUB -e /scratch/projects/fieberlab/CR_Batch4/fastqc/S20.err
#BSUB -n 1

## Make a list of sample names
#Make a list of sample names
SAMPLES=`ls /scratch/projects/fieberlab/CR_Batch4/raw_reads/lFieber`

echo "samples being aligned"

module load fastqc

for SAMPLE in $SAMPLES
do
echo "$SAMPLE"
fastqc ../raw_reads/lFieber/${SAMPLE} --outdir=../fastqc
done

