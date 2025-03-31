
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
    A[📂 Extração CSVs] --> B[⚙️ Transformação]
    B --> C[💾 Armazenamento SQL Server]
    C --> D[📊 Dashboards Power BI]

    subgraph Extração
        A1[Ler CSVs] --> A2[Limpeza]
    end

    subgraph Transformação
        B1[Modelagem DBT] --> B2[Normalização]
    end

    subgraph Armazenamento
        C1[SQL Server]
    end

    subgraph Dashboards
        D1[Power BI Relatórios]
    end

