-- (iii)
-- First, creat a table with col contain number of students and class average named t
-- secondly, INNER JOIN with class, proffessor to get the info we need
-- Finally, find out classes that meet the requirement(10 or more students with class average over 85)

SELECT         p.pname, p.dept, t.cno, t.term, c.section, t.avg
FROM		(SELECT 		cno, term, COUNT(sno) AS num, AVG(mark) AS avg
			 FROM 			enrollment
			 GROUP BY 	cno, term) t,
			class c,
			professor p 
WHERE	t.cno = c.cno AND t.term = c.term AND p.eid = c.instructor AND t.num > 9 AND t.avg > 85
ORDER BY p.pname, p.dept, c.cno;
