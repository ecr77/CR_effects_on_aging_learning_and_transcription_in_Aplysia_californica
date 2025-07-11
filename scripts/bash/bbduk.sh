for SAMPLE in `cat ../raw_reads/lFieber/samples.txt`
do


echo "making BBDuk script for ${SAMPLE}"
echo '#!/bin/bash' > bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo '#BSUB -P 'fieberlab'' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo '#BSUB -J '$SAMPLE'_clean' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo '#BSUB -e '$SAMPLE'_clean_report.txt' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo '#BSUB -o '$SAMPLE'_clean.out' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo '#BSUB -W 12:00' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo '#BSUB -n 8' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo '#BSUB -R "span[ptile=8]"' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo '#BSUB -u ecr77@miami.edu' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh

echo 'module load java' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh
echo 'bbduk.sh \
-Xmx512m \
in1=../../raw_reads/lFieber/'${SAMPLE}'_R1_001.fastq \
in2=../../raw_reads/lFieber/'${SAMPLE}'_R2_001.fastq \
out1=../../trimmed_reads/'${SAMPLE}'_clean_1.fa \
out2=../../trimmed_reads/'${SAMPLE}'_clean_2.fa \
ref=~/software/local/bbmap/resources/adapters.fa \
ktrim=r \
k=23 \
mink=11 \
hdist=1 \
tpe \
tbo \
ftm=5' >> bbduk_per_sample_scripts/${SAMPLE}_BBDuk.sh

done
