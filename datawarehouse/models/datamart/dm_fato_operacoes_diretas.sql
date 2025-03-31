with foperacoes_diretas as (
    select 
        "data_da_Contratacao",
        "cnpj",
        "municipio_codigo",
        "juros",
        "prazo_carencia_meses",
        "prazo_amortizacao_meses",
        "valor_contratado_reais",
        "valor_desembolsado_reais"
    from {{ ref('stg_operacoes_diretas') }}
),

renamed as (
    select
        cast("data_da_Contratacao" as date) as data_da_Contratacao,
        cast("cnpj" as varchar(18)) as cnpj,
        cast("municipio_codigo" as int) as municipio_codigo,
        cast("juros" as varchar(18)) as juros,
        cast("prazo_carencia_meses" as int) as prazo_carencia_meses,
        cast("prazo_amortizacao_meses" as int) as prazo_amortizacao_meses, 
        COALESCE(TRY_CAST(REPLACE(REPLACE("valor_contratado_reais", '.', ''), ',', '.') AS DECIMAL(18,2)),0) AS valor_Contratado_Reais,
        COALESCE(TRY_CAST(REPLACE(REPLACE("valor_desembolsado_reais", '.', ''), ',', '.') AS DECIMAL(18,2)),0) AS valor_desembolsado_reais
    from foperacoes_diretas
)

select * from renamed;