
# Teste prático processo seletivo Ibrowse

> Desafio prático relacionado ao processo seletivo para ANALISTA DE DADOS 
> Candidato: Hemerson Douglas Alves Godinho
> E-mail: douglas_godinho@hotmail.com
> Data Execução: 31/03/2025

## Pré-requisitos 

Projeto ABC BANK

Este projeto foi desenvolvido para a ABC Bank e utiliza DBT (Data Build Tool) e Python para gerenciar e transformar os dados de um Data Warehouse (DW). O banco de dados SQL Server é utilizado para armazenar as informações relacionadas às operações financeiras da empresa. Para análise e visualização, o Power BI foi empregado na criação de dashboards interativos, possibilitando uma tomada de decisão mais estratégica baseada em dados precisos.

## Estrutura do Projeto

```mermaid
graph TD
    A[Início] --> B[Extração de Dados das Planilhas CSVs]
    B --> C[Transformação dos Dados com Python e DBT]
    C --> D[Armazenamento no SQL Server]
    D --> E[Criação de Modelos e Dashboards no Power BI]
    E --> F[Fim]

    subgraph Extração
        B1[Ler Arquivos CSV]
        B2[Normalizar Dados]
    end

    subgraph Transformação
        C1[Limpeza e Tratamento]
        C2[Modelagem com DBT]
    end

    subgraph Armazenamento
        D1[Gravar Dados Processados no SQL Server]
    end

    subgraph Visualização
        E1[Criar Medidas e Relatórios]
        E2[Construir Dashboards]
    end

    B --> B1
    B1 --> B2
    B2 --> C
    C --> C1
    C1 --> C2
    C2 --> D
    D --> D1
    D1 --> E
    E --> E1
    E1 --> E2




1. Seeds
Os seeds são dados estáticos carregados no Data Warehouse a partir de arquivos CSV. Neste projeto, usamos seeds para carregar dados de operações financeiras.




