#!/bin/bash
#BSUB -J unzip_files
#BSUB -q general
#BSUB -P fieberlab
#BSUB -o /scratch/projects/fieberlab/CR_Batch4/raw_reads/S20.fastq
#BSUB -e /scratch/projects/fieberlab/CR_Batch4/raw_reads/S20.err
#BSUB -n 1

## change dir to where file is
cd /scratch/projects/fieberlab/CR_Batch4/raw_reads/lFieber/

## unzip files
gunzip *.gz
