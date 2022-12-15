SELECT EDITORA.CodEditora,EDITORA.Nome, COUNT(LIVRO.Editora) AS Qt_livros FROM LIVRO
INNER JOIN 
EDITORA
ON EDITORA.CodEditora = LIVRO.Editora
GROUP BY EDITORA.CodEditora
ORDER BY COUNT(LIVRO.Editora) DESC;



