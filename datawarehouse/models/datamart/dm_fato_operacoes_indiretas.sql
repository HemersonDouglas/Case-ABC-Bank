with foperacoes_indiretas as (
    select 
        "data_da_Contratacao",
        "cpf_cnpj",
        "municipio_codigo",
        "juros",
        "prazo_carencia_meses",
        "prazo_amortizacao_meses",
        "valor_da_operacao_em_reais",
        "valor_desembolsado_reais"
    from {{ ref('stg_operacoes_indiretas') }}
),

renamed as (
    select
        cast("data_da_Contratacao" as date) as data_da_Contratacao,
        cast("cpf_cnpj" as varchar(18)) as cnpj,
        cast("municipio_codigo" as int) as municipio_codigo,
        cast("juros" AS varchar(255)) as juros,
        cast("prazo_carencia_meses" AS decimal(10,2)) as prazo_carencia_meses,
        cast("prazo_amortizacao_meses" as int) as prazo_amortizacao_meses, 
        COALESCE(TRY_CAST(REPLACE(REPLACE("valor_da_operacao_em_reais", '.', ''), ',', '.') AS DECIMAL(18,2)),0) AS valor_da_operacao_em_reais,
        COALESCE(TRY_CAST(REPLACE(REPLACE("valor_desembolsado_reais", '.', ''), ',', '.') AS DECIMAL(18,2)),0) AS valor_desembolsado_reais
    from foperacoes_indiretas
)

select * from renamed;