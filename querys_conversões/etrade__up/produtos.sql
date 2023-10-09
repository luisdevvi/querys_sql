SELECT
  p.Codigo as 'ID', -- Definir pela planilha
  p.Codigo_EAN as 'BARRAS',
  p.Nome as 'DESCRICAO',
  und.Codigo as 'UND',
  cl.Nome as 'Produto Classe', --Grupo
  sc.Nome as 'Produto Subclasse', -- Sub grupo
  CAST(ea.Qtde AS INT) as 'Quantidade',
  (SELECT pp.CustoBase
   FROM ProdutoPreco pp
   WHERE pp.TabelaPreco__Ide = '1D05193A-5045-4592-AA17-E2C1EA4D9260' AND pp.Produto__Codigo = p.Codigo AND pp.Status = '0') AS 'Preço Custo',
  (SELECT CAST(pp.Preco as DECIMAL(10, 2))
   FROM ProdutoPreco pp
   WHERE pp.TabelaPreco__Ide = '11627049-F321-42DE-A3ED-4101BADDBC32' AND pp.Produto__Codigo = p.Codigo AND pp.Status = '0') AS 'Preço Atual',
  p.NCM as 'Produto NCM',
  p.Tipo as 'Produto Tipo'
--  gr.Nome as 'Produto Grupo'
FROM Produto p
LEFT JOIN Classes cl ON cl.Codigo = p.Classe
LEFT JOIN Subclasses sc ON sc.Codigo = p.Subclasse
LEFT JOIN Grupo gr ON gr.Codigo = p.Grupo
LEFT JOIN Estoque_Atual ea ON ea.Produto__Ide = p.Ide AND ea.Filial = 1
INNER JOIN UNIDADEMEDIDA und ON und.Ide = p.Unidade_Venda__Ide
WHERE p.Inativo = 0
ORDER BY p.Nome;
