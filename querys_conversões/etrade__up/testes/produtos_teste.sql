select
null as ID, -- definir no excel
Codigo_EAN as BARRAS,
Nome as DESCRICAO,
Unidade_Venda__Ide as UND, -- Conferir em outra tabela
Grupo as GRUPO,
CNPJ_Fabricante as FORNECEDOR, -- Conferir em outra tabela
NULL as QTD, -- Conferir em outra tabela
NULL as QTD_SALDO, -- Conferir em outra tabela
Custo1 as CUSTO_MEDIO, -- Conferir novamente
Custo1 as PRECO_CUSTO,
Preco1 as PRECO_VENDA, -- Conferir em outra tabela
NULL as CST, -- Conferir em outra tabela
NULL as CSOSN, -- Conferir em outra tabela
NCM as COD_NCM,
CEST as CEST, -- Conferir em outra tabela
Tipo as TIPO_PRODUTO,
NULL as ALIQ_ICMS, -- Conferir em outra tabela
Obs as OBS,
NULL as REFERENCIA, -- Conferir novamente
Peso_Liquido as PESOLIQUIDO,
Peso_Bruto as PESOBRUTO,
NULL as VOLUME, -- Conferir em outra tabela
NULL as CODIGO, -- Definir no Excel
NULL as 'ORIGEM CST' -- Conferir em outra tabela
FROM Produto p