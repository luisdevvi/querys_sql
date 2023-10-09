select
null as CODIGO, --criar sequência no excel
case p.tipo_doc
when 'PZ' then 'DP'
when 'CH' then 'CR'
when 'BO' then 'BR' --BR foi criado manualmente para Boleto Recebido
else p.tipo_doc
end as TIPO,
case p.situacao
when 'ABERTO' then 'AB'
when 'QUITADO' then 'BX'
else p.situacao
end as STATUS,
p.id_fornecedor +3000 as "FORNECEDOR (CODIGO ou CPF/CNPJ)",
replace(cast(p.dt_conta as date),'.','/') as "DATA EMISSAO",
replace(cast(p.dt_venc as date),'.','/') as "DATA VENCIMENTO",
p.numero_documento as "NUMERO DOCUMENTO",
cast(p.vlr_conta as numeric(7,2)) as "VALOR",
cast(p.vlr_desconto as numeric(7,2)) as "VALOR DESCONTO",
cast(0 as numeric(7,2)) as "VALOR ACRESCIMO",
p.historico as "OBSERVAÇÃO",
cast(p.vlr_quitacao as numeric(7,2)) as "VALOR PAGO",
p.parcela as PARCELA,
null as "NRO PARCELA"
from contas_pagar P
where p.situacao = 'ABERTO'
and p.id_fornecedor is not null