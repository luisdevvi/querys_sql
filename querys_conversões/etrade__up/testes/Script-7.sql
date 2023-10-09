SELECT 
--  p.codigo,
  p.nome as 'produto',
  und.Codigo as 'unid',
  p.ncm,
  ce.Codigo,
  ci.Nome as 'ClasseImposto',
--  Cfop.Codigo 'CFOP',
--  co.IcmsCst,
--  co.IcmsPerc,
--  co.PisCofinsTipo,
--  co.PisPerc,
--  co.CofinsPerc,
--  co.IpiCst,
--  co.IpiPerc,
  p.Inativo,
  p.Codigo_EAN
FROM
  produto p
  LEFT JOIN CEST ce ON ce.Ide = p.CEST
  LEFT JOIN ClasseImposto Ci ON ci.Ide = p.ClasseImposto__Ide
--  LEFT JOIN ClasseImpostoOperacao co ON co.ClasseImposto__Ide = ci.Ide
  INNER JOIN UNIDADEMEDIDA und ON und.Ide = p.Unidade_Venda__Ide
--  INNER JOIN ClasseImpostoOperacaoUf cuf ON cuf.ClasseImpostoOperacao__Ide = co.Ide
  LEFT JOIN classes ON Classes.codigo = p.Classe
  LEFT JOIN Subclasses ON Subclasses.Codigo = p.Subclasse
--  LEFT JOIN FIlial as FL ON cuf.uf = fl.uf
--  LEFT JOIN Cfop ON co.Cfop__Codigo = Cfop.Codigo
