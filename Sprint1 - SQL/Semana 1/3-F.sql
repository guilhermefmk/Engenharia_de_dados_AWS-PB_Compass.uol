SELECT AUTOR.CodAutor,AUTOR.Nome, COUNT(LIVRO.Autor)
FROM LIVRO 
INNER JOIN AUTOR
ON AUTOR.CodAutor = LIVRO.Autor
GROUP BY AUTOR.CodAutor
HAVING COUNT(LIVRO.AUTOR)=(
SELECT MAX(Mycount)
FROM (
SELECT LIVRO.Autor, COUNT(LIVRO.Autor) Mycount
FROM LIVRO
GROUP BY LIVRO.Autor)AS X);
