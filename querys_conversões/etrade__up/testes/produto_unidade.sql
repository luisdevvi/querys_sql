select
p.Nome,
p.Codigo,
und.Codigo as UND
from Produto P
INNER JOIN UNIDADEMEDIDA und ON und.Ide = p.Unidade_Venda__Ide
WHERE Inativo = 0
order by Codigo