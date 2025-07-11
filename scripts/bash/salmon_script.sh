
for SAMPLE in `cat ../raw_reads/lFieber/samples.txt`
do


echo "making SALMON script for ${SAMPLE}"
echo '#!/bin/bash' > Salmon_per_sample_scripts/${SAMPLE}_salmon.sh
echo '#BSUB -P 'fieberlab'' >> Salmon_per_sample_scripts/${SAMPLE}_salmon.sh
echo '#BSUB -J '$SAMPLE'_clean' >> Salmon_per_sample_scripts/${SAMPLE}_salmon.sh
echo '#BSUB -e '$SAMPLE'_clean_report.txt' >> Salmon_per_sample_scripts/${SAMPLE}_salmon.sh
echo '#BSUB -o '$SAMPLE'_clean.out' >> Salmon_per_sample_scripts/${SAMPLE}_salmon.sh
echo '#BSUB -W 12:00' >> Salmon_per_sample_scripts/${SAMPLE}_salmon.sh
echo '#BSUB -n 8' >> Salmon_per_sample_scripts/${SAMPLE}_salmon.sh
echo '#BSUB -R "span[ptile=8]"' >> Salmon_per_sample_scripts/${SAMPLE}_salmon.sh
echo '#BSUB -u ecr77@miami.edu' >> Salmon_per_sample_scripts/${SAMPLE}_salmon.sh

echo '/nethome/ecr77/software/local/salmon-1.5.1_linux_x86_64/bin/salmon quant \
-l ISR \
-t ../../genome/transcriptome/transcripts.fa \
-a ../../starAligned/'${SAMPLE}'/Aligned.toTranscriptome.out.bam \
-p 8 \
-o ../../quants/'${SAMPLE}' \
--seqBias \
--gcBias' >>  Salmon_per_sample_scripts/${SAMPLE}_salmon.sh

done
