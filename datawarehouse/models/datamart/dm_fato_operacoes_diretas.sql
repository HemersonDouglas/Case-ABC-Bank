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
        -- Substituir NULL por valor padrão (0 ou outro valor válido)
        COALESCE(TRY_CAST("juros" AS decimal(10,2)), 0) AS juros,
        COALESCE(TRY_CAST("prazo_carencia_meses" AS decimal(10,2)), 0) AS prazo_carencia_meses,
        cast("prazo_amortizacao_meses" as int) as prazo_amortizacao_meses, 
        COALESCE(TRY_CAST("valor_contratado_reais" as decimal(18,2 )), 0) as valor_Contratado_Reais,
        COALESCE(TRY_CAST("valor_desembolsado_reais" as decimal(18,2 )), 0) as valor_Desembolsado_Reais
    from foperacoes_diretas
)

select * from renamed;