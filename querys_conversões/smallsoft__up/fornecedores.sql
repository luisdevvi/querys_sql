select
cast(c.registro as numeric) +1 as CODIGO,
c.nome, --NOME
c.nome as FANTASIA,
c.contato, --CONTATO
replace(replace(replace(c.cgc,'-',''),'/',''),'.','') as CNPJ_CNPF,
c.ie as IE_RG,
c.endere as ENDERECO,
null as NUMERO, --numero do endereço está no campo c.endere
c.comple as COMPLEMENTO,
c.comple as BAIRRO,  --o sistema não tem campo para bairro separado, bairro foi informado no campo c.comple
c.cidade, --CIDADE
coalesce(c.estado,null,'MG') as UF, --mantenha este coalesce somente se o cliente for de MG
c.cep, --CEP
replace(replace(replace(replace(replace(c.fone,'x',''),'(',''),'.',''),')',''),' ','') as TELEFONE,
replace(replace(replace(replace(replace(c.fax,'x',''),'(',''),'.',''),')',''),' ','') as FAX,
c.email, --EMAIL
from clifor C
where c.clifor is null
order by c.registro
