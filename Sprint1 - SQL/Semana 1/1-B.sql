SELECT CdPro,NmPro, COUNT(CdPro)
FROM TbVendas 
WHERE (DtVen BETWEEN '2014-02-03' AND '2018-02-02') AND TbVendas.status IN ('Concluido')
GROUP BY CdPro
HAVING COUNT(CdPro)=(
SELECT MAX(CONTADOR) FROM (
SELECT CdPro,COUNT(CdPro) CONTADOR FROM TbVendas WHERE (DtVen BETWEEN '2014-02-03' AND '2018-02-02') AND TbVendas.status IN ('Concluido') GROUP BY CdPro)AS X);
