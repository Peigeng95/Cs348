-- (ii)
-- Divide into two part, find all advanced class that meet the requirement(term = S03, professor in CS department)
--                                                find all required class that meet the requirement(term = S03, professor not in CS department)
-- INNER JOIN these two table on the advanced class cno.
-- NOTE t2 select one more col prereq cuz need cno for advanced class to INNER JOIN and need return required class.


SELECT DISTINCT t1.cno, t1.pname, t2.prereq,  t2.pname
FROM		(SELECT		p.cno, pr.pname
			 FROM			(SELECT cno, term, instructor
							 FROM class
							 WHERE term = 'S03') temp1,
							 prerequisite p,
							 professor pr
			 WHERE               p.cno = temp1.cno AND temp1.instructor = pr.eid AND pr.dept = 'Computer Science') t1,
			 
			(SELECT		p2.cno, pr2.pname, p2.prereq
			 FROM			(SELECT cno, term, instructor
							 FROM class
							 WHERE term = 'S03') temp2,
							 prerequisite p2,
							 professor pr2
			 WHERE       p2.prereq = temp2.cno AND temp2.instructor = pr2.eid AND pr2.dept <> 'Computer Science') t2
WHERE 	t1.cno = t2.cno
ORDER BY t1.cno, t1.pname, t2.prereq, t2.pname;

