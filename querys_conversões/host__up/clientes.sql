select
c.id_cliente +1 as CODIGO,
c.raz_social as NOME,
c.cliente as FANTASIA,
c.contato as CONTATO,
c.cpf_cnpj as CNPJ_CNPF,
case c.ie_rg
when 'ISENTO' then null
when 'INSENTO' then null
when 'ISENTA' then null
when 'INSENTA' then null
when 'ISETO' then null
when 'MG' then null
else c.ie_rg
end as IE_RG,
replace(c.logradouro,',','') as ENDERECO,
c.numero, --NUMERO
c.complemento, --COMPLEMENTO
c.bairro, --BAIRRO
c.municipio, --CIDADE
c.uf, --UF
c.cep, --CEP
c.fone as TELEFONE,
c.celular as CELULAR,
c.email, --EMAIL
replace(cast(c.dt_cadastro as date),'.','/') as CADASTRO,
c.obs as "OBSERVAÇÃO"
from clientes C
where c.bloqueado = 'NAO'