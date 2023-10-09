select
f.id_fornecedor + 3000 as CODIGO,
f.raz_social as NOME,
f.fantasia as FANTASIA,
f.contato, --CONTATO
f.cnpj as CNPJ_CNPF,
case f.ie
when 'ISENTO' then null
else f.ie
end as IE_RG,
f.endereco, --ENDERECO
f.numero, --NUMERO
f.complemento, --COMPLEMENTO
f.bairro, --BAIRRO
f.municipio as CIDADE,
f.uf, --UF
f.cep, --CEP
f.fone as TELEFONE,
f.fax, --FAX
f.email as EMAIL
from fornecedor F
where f.raz_social is not null