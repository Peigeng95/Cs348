-- (v)
-- First, create a table that contain avg mark of a student and num of course he/her takes
-- Secondly, INNER join with student to get the sname
-- Finally, select those who meet the requirement (take 5 or more classes and has an average 80 or more)

SELECT  	 s.sname,t.avg
FROM		(SELECT 			sno, AVG(mark) AS avg, COUNT(sno) AS num
			 FROM 				enrollment e
			 GROUP BY 		sno) t,
			(SELECT 			sno
			 FROM 				enrollment e
			 EXCEPT
			 SELECT			sno
			 FROM				enrollment e
			 WHERE  			mark < 80) t2,
			 student s
WHERE	 s.sno = t.sno AND t.sno=t2.sno AND t.num >= 5
ORDER BY s.sname, t.avg ;
