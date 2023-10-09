SELECT
	-- Definir código na planilha
	fc.Tipo AS 'TIPO',
	fc.Situacao AS 'STATUS',
	cf.nome AS 'Cliente',
	cf.Codigo AS 'Código Cliente',
    CONVERT(varchar, fc.Data_Criacao, 103) AS 'Emissão',
	CONVERT(varchar, fc.Vencimento, 103) AS 'Vencimento',
	fc.Sequencia AS 'Sequencia',
	fc.Valor_Final AS 'Valor',
    fc.Descricao AS 'Descricao',
    fc.NFCe AS 'NFC-e',
    fc.NFe AS 'NF-e',
    fc.Valor_Quitado as 'Quitacao',
    f.Nome AS 'Vendedor',
    cf.OsIdentificador1 AS 'Departamento'
FROM
    Financeiro_Conta fc
    LEFT JOIN Cli_For cf ON fc.Cli_For__Ide = cf.Ide
    LEFT JOIN Funcionario f ON f.Ide = fc.Vendedor__Ide
WHERE
    Pagar_Receber = 'R' AND Situacao = 'A' AND fc.Tipo = 'P';
