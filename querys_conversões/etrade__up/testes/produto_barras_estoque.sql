SELECT
  p.Codigo AS 'Codigo do Produto',
  p.Codigo_EAN AS 'Codigo EAN',
  p.Nome AS 'Nome do Produto',
  CAST(ea.Qtde AS INT) AS 'Estoque Atual',
  ea.Estoque_Minimo AS 'Estoque Minimo'
FROM
  Produto p
LEFT JOIN
  Estoque_Atual ea ON ea.Produto = p.Codigo
WHERE
  Inativo = 0
ORDER BY
  Codigo
