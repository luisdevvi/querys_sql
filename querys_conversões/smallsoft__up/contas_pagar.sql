select
cast(p.registro as numeric) +1 as CODIGO, --usar sequência no Excel
'DP' as TIPO,
'AB' as STATUS,
replace(replace(replace(c.cgc,'-',''),'/',''),'.','') as "FORNECEDOR (CODIGO ou CPF/CNPJ)",
replace(cast(p.emissao as date),'.','/') as "DATA EMISSAO",
replace(cast(p.vencimento as date),'.','/') as "DATA VENCIMENTO",
p.documento as "NUMERO DOCUMENTO",
replace(cast(p.valor_dupl as numeric(7,2)),'.',',') as VALOR,
null as "VALOR DESCONTO",  --campo não encontrado
null as "VALOR ACRESCIMO", --campo não encontrado
p.numeronf as "OBSERVAÇÃO",
replace(cast(p.valor_pago as numeric(7,2)),'.',',') as "VALOR PAGO",
null as PARCELA,
null as "NRO PARCELA"
from pagar P
left join clifor C on c.nome = p.nome
where p.valor_dupl > p.valor_pago
and p.documento is not null
and c.cgc is not null
order by p.registro