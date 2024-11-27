#!/bin/bash

#Verificar se o microambiente está ativado

# Diretório que contém os arquivos para alinhamento
diretorio=$(pwd)


# Obter o arquivo FASTA de referência
echo "Arquivo FASTA de referência: "
read fasta

# Limpar a área de trabalho
if find "$diretorio" -type f \( -name "*.sam" -o -name "*.log" -o -name "*.ebwt" \) | grep -q .; then
    echo "Arquivos encontrados. Limpando..."
    # Apagar os arquivos com as extensões .sam, .log e .ebwt no diretório e subdiretórios
    find "$diretorio" -type f \( -name "*.sam" -o -name "*.log" -o -name "*.ebwt" \) -exec rm -f {} \;
    echo "Arquivos limpos com sucesso."
else
    echo "Nenhum arquivo para limpar."
fi

# Gerar os arquivos do índice Bowtie
fasta_index="${fasta%.*}"
bowtie-build "$fasta" "$fasta_index"

#Pergunta qual o valor dos parâmetros:
echo "Quantos alinhamentos você quer por leitura? (valor de -k) "
read k
echo "Quantos mismatches são permitidos? (valor de -v) "
read v

# Percorrer os arquivos no diretório
for arquivo in "$diretorio"/*.fasta; do
    # Para cada arquivo que não seja o arquivo de referência
    if [[ -f "$arquivo" && "$(basename "$arquivo")" != "$(basename "$fasta")" ]]; then
        # Pegar o nome base do arquivo
        id=$(basename "$arquivo" .fasta)
        
        # Alinhamento
        bowtie -p 3 -f -S -k "$k" -v "$v" "$fasta_index" "$arquivo" > "$id.sam" 2> "bowtiereport_$id.log"
        
        # Limpeza 1
        samtools view -S -h -F 4 "$id.sam" > "$id_onlymapped.sam"
        
        # Montar tabela
        awk '$1 !~ /^@/ {print $3}' "$id_onlymapped.sam" | sort | uniq -c > "$id_tabelafinal.csv"
        # Remover arquivos .sam intermediários 
        rm "$id.sam"
    fi
done

