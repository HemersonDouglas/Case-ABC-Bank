with source as (
    select
        "data_da_contratacao",
        "cliente",
        "cnpj",
        "uf",
        "municipio",
        "municipio_codigo",
        "modalidade_de_apoio",
        "forma_de_apoio",
        "produto",
        "juros",
        "prazo_carencia_meses",
        "prazo_amortizacao_meses",
        "valor_contratado_reais",
        "valor_desembolsado_reais"
    from {{ source('case-abc-bank', 'operacoes-diretas') }}
),

renamed as (
    select
        cast("data_da_Contratacao" as date) as data_da_Contratacao,
        cast("cliente" as nvarchar(255)) as cliente,
        cast("cnpj" as varchar(18)) as cnpj,
        cast("uf" as nvarchar(2)) as uf,
        cast("municipio" as nvarchar(255)) as municipio,
        cast("municipio_codigo" as int) as municipio_codigo,
        cast("modalidade_de_apoio" as nvarchar(255)) as modalidade_de_apoio,
        cast("forma_de_apoio" as nvarchar(255)) as forma_de_apoio,
        cast("produto" as nvarchar(255)) as produto,
        -- Substituir NULL por valor padrão (0 ou outro valor válido)
        COALESCE(TRY_CAST("juros" AS decimal(10,2)), 0) AS juros,
        COALESCE(TRY_CAST("prazo_carencia_meses" AS decimal(10,2)), 0) AS prazo_carencia_meses,
        cast("prazo_amortizacao_meses" as int) as prazo_amortizacao_meses, 
        COALESCE(TRY_CAST("valor_contratado_reais" as decimal(18,2 )), 0) as valor_Contratado_Reais,
        COALESCE(TRY_CAST("valor_desembolsado_reais" as decimal(18,2 )), 0) as valor_Desembolsado_Reais
    from source
)

select * from renamed;



