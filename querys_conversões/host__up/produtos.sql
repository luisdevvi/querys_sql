select
p.id_produto as ID,
p.barras, --BARRAS
p.produto as DESCRICAO,
p.unidade_comecial as UND,
p.grupo, --GRUPO
null as FORNECEDOR, --campo não existe
p.estoque as QTD,
null as QTD_SALDO, --campo não existe
null as CUSTO_MEDIO, --campo não existe
replace(cast(p.custo as numeric(7,2)),'.',',') as PRECO_CUSTO,
replace(cast(p.valor_venda as numeric(7,2)),'.',',') as PRECO_VENDA,
p.cst, --CST
p.csosn, --CSOSN
p.ncm as COD_NCM,
p.cest, --CEST
case p.tipo_item
when '0' then 'N'
when '9' then 'S'
else p.tipo_item
end as TIPO_PRODUTO,
p.icms as ALIQ_ICMS,
p.obs, --OBS
p.referencia, --REFERENCIA
p.peso_liquido as PESOLIQUIDO,
p.peso_bruto as PESOBRUTO,
null as VOLUME, --campo não existe
p.id_produto as CODIGO,
p.cst_piscofins_entrada as "ORIGEM CST"
from produtos P
where p.status = 'ATIVO'