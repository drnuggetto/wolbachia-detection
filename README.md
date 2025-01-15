# Detecção de Wolbachia em Bibliotecas de Pequenos RNAs

## Introdução


Mosquitos _Aedes aegypti_ são vetores de arboviroses como Dengue, Zika e Chikungunya. A infecção pelo endossimbionte _Wolbachia pipientis_ pode interferir na replicação viral dentro desses mosquitos, reduzindo a transmissão de patógenos. Embora não haja evidências de vias reguladas de pequenos RNAs derivadas especificamente de Wolbachia, a presença de fragmentos do genoma bacteriano em bibliotecas de pequenos RNAs pode indicar a degradação enzimática do material genético da bactéria. 

Pequenos RNAs (até 50 nt) têm funções regulatórias e de defesa antiviral. Apesar de _Wolbachia spp._ não gerar esses RNAs de forma regulada, sequências correspondentes à bactéria podem ser detectadas em bibliotecas de pequenos RNAs, refletindo a interação do endossimbionte com o hospedeiro.


## Objetivo do Projeto

Esse projeto tem como objetivo analisar diferentes cepas de _Wolbachia spp._ em bibliotecas de RNA infectadas e não infectadas pelo endossimbionte, buscando detectar e quantificar a bactéria nessas bibliotecas de pequenos RNAs.

## Descrição das Atividades Práticas

As etapas principais do projeto incluem:

1. **Preparação dos Dados:** Importar as bibliotecas de pequenos RNAs para análise.
2. **Limpeza de Dados:** Realizar a limpeza de sequências de baixa qualidade, adaptadores e bases indefinidas utilizando TrimGalore
3. **Construção do Índice de Referência:** Utilizar Bowtie para criar índices de referência a partir de sequências de Wolbachia.
4. **Alinhamento das Sequências:** Executar alinhamentos usando Bowtie para identificar a presença de Wolbachia nas bibliotecas de RNAs.
5. **Análise de Resultados:** Interpretação dos dados de alinhamento e visualização dos resultados.

## Requisitos

- Importar as bibliotecas de pequeno RNAs
- Criar e adentrar o ambiente micromamba/conda com os kits (SRA, Bowtie...)
- Ferramenta para visualização de dados em bioinformática (opcional)
