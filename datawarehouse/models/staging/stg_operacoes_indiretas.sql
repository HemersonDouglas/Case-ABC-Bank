with source as (
    select
        "data_da_Contratacao",
        "cliente",
        "cpf_cnpj",
        "uf",
        "municipio",
        "municipio_codigo",
        "modalidade_de_apoio",
        "forma_de_apoio",
        "produto",
        "juros",
        "prazo_carencia_meses",
        "prazo_amortizacao_meses",
        "valor_da_operacao_em_reais",
        "valor_desembolsado_reais"
    from {{ source('case-abc-bank', 'operacoes-indiretas') }}
),

renamed as (
    select
        cast("data_da_Contratacao" as date) as data_da_Contratacao,
        cast("cliente" as nvarchar(255)) as cliente,
        cast("cpf_cnpj" as varchar(18)) as cpf_cnpj,
        cast("uf" as nvarchar(3)) as uf,
        cast("municipio" as nvarchar(255)) as municipio,
        cast("municipio_codigo" as int) as municipio_codigo,
        cast("modalidade_de_apoio" as nvarchar(255)) as modalidade_de_apoio,
        cast("forma_de_apoio" as nvarchar(255)) as forma_de_apoio,
        cast("produto" as nvarchar(255)) as produto,
        cast("juros" AS varchar(255)) as juros,
        cast("prazo_carencia_meses" AS int) as prazo_carencia_meses,
        cast("prazo_amortizacao_meses" as int) as prazo_amortizacao_meses, 
        COALESCE(TRY_CAST(REPLACE(REPLACE("valor_da_operacao_em_reais", '.', ''), ',', '.') AS DECIMAL(18,2)),0) AS valor_da_operacao_em_reais,
        COALESCE(TRY_CAST(REPLACE(REPLACE("valor_desembolsado_reais", '.', ''), ',', '.') AS DECIMAL(18,2)),0) AS valor_desembolsado_reais
    from source
)

select * from renamed;

