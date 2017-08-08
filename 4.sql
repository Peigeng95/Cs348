-- (iv)
-- First, create a table that contains the avgmark
-- Secondly, INNER join with enrollment to get each student's info
-- Finally, select those students that meet the requirement(mark over 98)

SELECT		e.sno, e.cno, e.mark - avg_mark
FROM		 	(SELECT 			cno, term, AVG(mark) AS avg_mark
			    	 FROM 				enrollment
			  	 GROUP BY 		cno, term) t,
			   	 enrollment e
WHERE		t.cno = e.cno AND t.term = e.term AND e.mark > 98
ORDER BY    	e.sno, t.cno;
