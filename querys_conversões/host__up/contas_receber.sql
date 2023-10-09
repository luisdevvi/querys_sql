select
null as CODIGO, --crie a sequência através do Excel
case r.tipo_doc
when 'PZ' then 'DP'
when 'CH' then 'CR'
when 'BO' then 'BR' --BR foi criado manualmente para Boleto Recebido
else r.tipo_doc
end as  TIPO,
case r.situacao
when 'ABERTO' then 'AB'
else r.situacao
end as STATUS,
r.id_cliente +1 as "CLIENTE (CODIGO ou CPF/CNPJ)",
replace(cast(r.dt_conta as date),'.','/') as "DATA EMISSAO",
replace(cast(r.dt_venc as date),'.','/') as "DATA VENCIMENTO",
case r.numero_documento
when null then r.id_cliente +1
else r.numero_documento
end as "NUMERO DOCUMENTO",
cast(r.vlr_conta as numeric(7,2))as VALOR,
cast(r.vlr_desconto as numeric(7,2)) as "VALOR DESCONTO",
cast(r.vlr_acrescimo as numeric(7,2)) as "VALOR ACRESCIMO",
r.historico as "OBSERVAÇÃO",
cast(r.vlr_juros as numeric) as "JUROS (%)",
cast(r.vlr_juros_acum as numeric(7,2)) as "VALOR JUROS",
cast(r.vlr_multa as numeric) as "MULTA (%)",
cast(r.vlr_multa as numeric(7,2)) as "VALOR MULTA",
cast(r.vlr_bx_parcial as numeric(7,2)) as "VALOR PAGO",
r.parcela as PARCELA,
r.numero_parcela as "NRO PARCELA"
from contas_receber R
where r.situacao = 'ABERTO'
order by r.numero_documento