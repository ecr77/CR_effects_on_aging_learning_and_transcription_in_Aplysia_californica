for SAMPLE in `cat ../raw_reads/lFieber/samples.txt`
do


echo "making STAR script for ${SAMPLE}"
echo '#!/bin/bash' > STAR_per_sample_scripts/${SAMPLE}_STAR.sh
echo '#BSUB -P 'fieberlab'' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh
echo '#BSUB -J '$SAMPLE'_clean' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh
echo '#BSUB -e '$SAMPLE'_clean_report.txt' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh
echo '#BSUB -o '$SAMPLE'_clean.out' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh
echo '#BSUB -W 12:00' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh
echo '#BSUB -n 8' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh
echo '#BSUB -R "span[ptile=8]"' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh
echo '#BSUB -u ecr77@miami.edu' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh

echo 'STAR \
--runThreadN 16 \
--genomeDir ../../starIndex \
--readFilesIn ../../trimmed_reads/'${SAMPLE}'_clean_1.fa ../../trimmed_reads/'${SAMPLE}'_clean_2.fa \
--outFileNamePrefix ../../starAligned/'${SAMPLE}'/ \
--outSAMtype BAM SortedByCoordinate \
--limitBAMsortRAM 5000000000 outReadsUnmapped Fastx \
--quantMode TranscriptomeSAM GeneCounts \
--twopassMode Basic' >> STAR_per_sample_scripts/${SAMPLE}_STAR.sh

done
