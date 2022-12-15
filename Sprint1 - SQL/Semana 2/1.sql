(SELECT 
		LIVRO.Cod `CÒDIGO DO LIVRO`, 
		LIVRO.Titulo `TÍTULO`, 
		LIVRO.Autor `CÓDIGO DO AUTOR`, 
		AUTOR.Nome `NOME DO AUTOR`, 
		LIVRO.Valor VALOR , 
		LIVRO.Editora `CÓDIGO DA EDITORA`, 
		EDITORA.Nome `NOME DA EDITORA` 
FROM LIVRO
	INNER JOIN AUTOR 
		ON LIVRO.Autor = AUTOR.CodAutor
	INNER JOIN EDITORA
		ON LIVRO.Editora = EDITORA.CodEditora
ORDER BY Valor DESC 
LIMIT 10)
UNION ALL
(SELECT 
		LIVRO.Cod `CÒDIGO DO LIVRO`, 
		LIVRO.Titulo `TÍTULO`, 
		LIVRO.Autor `CÓDIGO DO AUTOR`, 
		AUTOR.Nome `NOME DO AUTOR`, 
		LIVRO.Valor VALOR , 
		LIVRO.Editora `CÓDIGO DA EDITORA`, 
		EDITORA.Nome `NOME DA EDITORA`
FROM LIVRO 
	INNER JOIN AUTOR 
		ON LIVRO.Autor = AUTOR.CodAutor
	INNER JOIN EDITORA
		ON LIVRO.Editora = EDITORA.CodEditora 
	INNER JOIN (
		SELECT 
				EDITORA.Nome, 
				LIVRO.Editora Cod, 
				COUNT(LIVRO.Editora)  
        FROM LIVRO
			INNER JOIN EDITORA
				ON EDITORA.CodEditora = LIVRO.Editora
		GROUP BY LIVRO.EDITORA
		ORDER BY COUNT(LIVRO.Editora) DESC
		LIMIT 5) X
		ON X.Cod = LIVRO.Editora)
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/teste.csv'
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n'        
;
