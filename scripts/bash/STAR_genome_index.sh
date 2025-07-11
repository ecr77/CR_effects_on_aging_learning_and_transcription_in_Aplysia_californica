#!/bin/bash
#BSUB -P 
#BSUB -J genome allignment
#BSUB -e /scratch/projects/fieberlab/CR_Batch4/starIndex/Index.err
#BSUB -o /scratch/projects/fieberlab/CR_Batch4/starIndex/Index.out
#BSUB -W 12:00
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -u ecr77@miami.edu

STAR \
--runThreadN 16 \
--genomeSAindexNbases 13 \
--runMode genomeGenerate \
--genomeDir ../starIndex \
--genomeFastaFiles ../genome/fna/GCF_000002075.1_AplCal3.0_genomic.fna \
--sjdbGTFtagExonParentTranscript Parent \
--sjdbGTFfile ../genome/gff/GCF_000002075.1_AplCal3.0_genomic.gff
