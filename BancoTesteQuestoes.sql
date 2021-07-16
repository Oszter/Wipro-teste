--1
SELECT 
	s.dsStatus AS status, 
	COUNT(P.idProcesso) AS qtd 
FROM 
	tb_Processo p 
	INNER JOIN tb_Status s ON s.idStatus = p.idStatus 
WHERE 
	p.idStatus IN (SELECT idStatus FROM tb_Status) 
	GROUP BY 
		s.dsStatus

		
--2 
SELECT
    p.idProcesso AS processo, p.dtEncerramento as data,
FROM 
    tbProcesso p
WHERE 
    data =
    (
        SELECT MAX
        (
        SELECT s.dtEncerramento  - s.dtEntrada 
        FROM tbProcesso s
        )
FROM 
    tbProcesso
WHERE 
    data LIKE 2013%)
GROUP BY 
    processo


--3
SELECT t1.* 
FROM (
	SELECT 
		DISTINCT COUNT(p.dtEncerramento) AS qtd, 
		p.dtEncerramento AS Data 
	FROM 
		tb_Processo p 
	GROUP BY 
		p.DtEncerramento
	) AS t1 
	WHERE 
		t1.qtd >= 5

--4
SELECT REPLICATE('0', 12 - LEN(nroProcesso)) + RTrim(nroProcesso) FROM tb_Processo;
