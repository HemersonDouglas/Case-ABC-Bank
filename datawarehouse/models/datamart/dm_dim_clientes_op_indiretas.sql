with dclientes as (
    select
        "cliente",
        "cpf_cnpj",
        "uf",
        "municipio",
        "modalidade_de_apoio",
        "forma_de_apoio",
        "produto"
    from {{ ref('stg_operacoes_indiretas') }}
),

renamed as (
    select
        cast("cliente" as nvarchar(255)) as cliente,
        cast("cpf_cnpj" as varchar(18)) as cnpj,
        cast("uf" as nvarchar(3)) as uf,
        cast("municipio" as nvarchar(255)) as municipio,
        cast("modalidade_de_apoio" as nvarchar(255)) as modalidade_de_apoio,
        cast("forma_de_apoio" as nvarchar(255)) as forma_de_apoio,
        cast("produto" as nvarchar(255)) as produto
    from dclientes
)

select * from renamed;