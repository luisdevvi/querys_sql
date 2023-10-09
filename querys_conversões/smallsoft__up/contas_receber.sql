select
cast(r.registro as numeric) +1 as CODIGO,
'DP' as TIPO,
'AB' as STATUS,
cast(c.registro as numeric) +1 as "CLIENTE (CODIGO ou CPF/CNPJ)",
replace(cast(r.emissao as date),'.','/') as "DATA EMISSAO",
replace(cast(r.vencimento as date),'.','/') as "DATA VENCIMENTO",
r.documento as "NUMERO DOCUMENTO",
replace(cast(r.valor_dupl as numeric(7,2)),'.',',') as VALOR,
null as "VALOR DESCONTO", --campo não encontrado
null as "VALOR ACRESCIMO", --campo não encontrado
r.conta as "OBSERVAÇÃO",
null as "JUROS (%)", --campo não encontrado
null as "VALOR JUROS", --campo não encontrado
null as "MULTA (%)", --campo não encontrado
null as "VALOR MULTA", --campo não encontrado
replace(cast(r.valor_rece as numeric(7,2)),'.',',') as "VALOR PAGO",
null as PARCELA, --usar a conversão do excel pra transformar a letra no fim do número do documento em números
null as "NRO PARCELA" --usar a conversão do excel pra transformar a letra no fim do número do documento em números
from receber R
left join clifor C on c.nome = r.nome
where r.valor_dupl > r.valor_rece
and c.registro is not null
order by r.registro