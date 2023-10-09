SELECT 
	Codigo as CODIGO,
	Nome as NOME,
	Fantasia as FANTASIA,
	Contato as CONTATO,
	replace(replace(replace(CNPJ,'-',''),'/',''),'.','') as CNPJ_CNPF,
	Inscricao as IE_RG,
	Endereco as ENDERECO,
	Numero as NUMERO,
	Complemento as COMPLEMENTO,
	Bairro as BAIRRO,
	Cidade as CIDADE,
	UF as UF,
	-- CEP as CEP,
	replace(CEP,'-','') as CEP,
	replace(replace(replace(replace(replace(replace(Fone1,'x',''),'(',''),'.',''),')',''),' ',''),'-','') as TELEFONE,
	replace(replace(replace(replace(replace(replace(Fone2,'x',''),'(',''),'.',''),')',''),' ',''),'-','') as CELULAR,
	Email as EMAIL,
	NULL as CADASTRO,
	Obs as "OBSERVAÇÃO"
FROM 
	Cli_For cf 