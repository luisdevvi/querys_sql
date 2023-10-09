SELECT p.codigo, p.nome,
CAST((SELECT pp.preco FROM produtopreco pp WHERE pp.produto__ide = p.ide AND pp.TabelaPreco__Ide = '1D05193A-5045-4592-AA17-E2C1EA4D9260') AS MONEY) AS 'Custo1',
CAST((SELECT pp.Preco FROM produtopreco pp WHERE pp.produto__ide = p.ide AND pp.TabelaPreco__Ide = '11627049-F321-42DE-A3ED-4101BADDBC32') AS MONEY) AS 'Preco'

FROM produto p

where p.Inativo = 0
order by Codigo