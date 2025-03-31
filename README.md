
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
graph LR  
    A[📂 Extrair CSVs] -->|Ler Arquivos| B[🧹 Limpar Dados]  
    B -->|Transformar com DBT| C[⚙️ Modelagem]  
    C -->|Armazenar Dados| D[💾 SQL Server]  
    D -->|Gerar Relatórios| E[📊 Power BI]  


