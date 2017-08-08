-- (vi)
-- First find all professor
-- Secondly, except those professor who have a class with 10 students or less
-- Thirdly, we only get the pname now. to get all info we need INNER JOIN with professor, class, and t1(to calculate the avg)
-- Finally select all the rows that meet the requirements

SELECT t.pname, t1.cno, t1.term, t1.section, t1.cap, t1.avg_mark
FROM	(SELECT DISTINCT p.pname
	 FROM	(SELECT  cno, term, section, COUNT(sno) AS cap
		 FROM	 enrollment
		 GROUP BY cno,term,section)t1,
		 professor p,
		 class c
	 Where	 c.cno=t1.cno AND c.term=t1.term AND c.instructor=p.eid
	 EXCEPT
	 SELECT DISTINCT p.pname
	 FROM	 (SELECT cno,term,section, COUNT(sno) AS cap
		  FROM	 enrollment
		  GROUP BY cno,term,section)t1,
		  professor p,
		  class c
	 WHERE 	c.cno=t1.cno AND c.term = t1.term AND c.instructor=p.eid AND cap < 10)t,
	(Select	cno,term,section,COUNT(sno) AS cap, AVG(mark) AS avg_mark
	 FROM	enrollment
	 Group BY cno,term,section)t1,
	 professor p,
	 class c
Where c.cno=t1.cno AND c.term=t1.term AND c.instructor=p.eid AND p.pname=t.pname;
