SELECT
  p.Codigo as 'Produto Codigo',
  p.Nome as 'Produto Nome',
  p.Tipo as 'Produto Tipo',
  cl.Nome as 'Produto Classe',
  sc.Nome as 'Produto Subclasse',
  gr.Nome as 'Produto Grupo',
--  fa.Nome as 'Produto Familia',
  p.NCM as 'Produto NCM',
--  p.Codigo_Fabricante1 as 'Produto FAB1',
--  p.Codigo_Fabricante2 as 'Produto FAB2',
  p.Codigo_EAN as 'Produto EAN',
  (SELECT CAST(pp.Preco as DECIMAL(10, 2))
   FROM ProdutoPreco pp
   WHERE pp.TabelaPreco__Ide = '11627049-F321-42DE-A3ED-4101BADDBC32' AND pp.Produto__Codigo = p.Codigo AND pp.Status = '0') AS 'Preço Atual',
  (SELECT pp.CustoBase
   FROM ProdutoPreco pp
   WHERE pp.TabelaPreco__Ide = '1D05193A-5045-4592-AA17-E2C1EA4D9260' AND pp.Produto__Codigo = p.Codigo AND pp.Status = '0') AS 'Preço Custo',
   ea.Qtde
--  p.Data_Cadastro as 'Produto Data Cadastro',
--  p.Ultima_Alteracao as 'Produto Ultima Alteracao',
--  p.Tipo_Comissao,
--  p.Comissao_Perc,
--  p.Comissao_Valor,
FROM Produto p
LEFT JOIN Classes cl ON cl.Codigo = p.Classe
LEFT JOIN Subclasses sc ON sc.Codigo = p.Subclasse
LEFT JOIN Grupo gr ON gr.Codigo = p.Grupo
LEFT JOIN Familias fa ON fa.Codigo = p.Familia
LEFT JOIN Estoque_Atual ea ON ea.Produto__Ide = p.Ide AND ea.Filial = 1
WHERE p.Inativo = 0
ORDER BY p.Nome;