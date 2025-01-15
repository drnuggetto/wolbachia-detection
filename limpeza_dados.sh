#!/bin/bash

# Diretório que contém os arquivos para alinhamento
diretorio=$(pwd)

# Perguntar qual o limite de qualidade das bases
echo "Qual o limite de qualidade das bases? (valor de -q) Sugestão: 25 "
read Q

# Perguntar qual o arquivo FASTQ de referência (se necessário)
echo "Arquivo FASTQ de referência: "
read fastq

# Percorrer os arquivos no diretório
for arquivo in "$diretorio"/*.fastq; do
    # Limpeza de cada arquivo fastq
    trim_galore --fastqc -q "$Q" --trim-n --max_n 0 -j 1 --dont_gzip "$arquivo"
    
    # Conversão para FASTA
    seqtk seq -A "${arquivo%.*}_trimmed.fq" > "${arquivo%.*}_trimmed.fasta"
done






