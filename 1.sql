--(i)
--First select the classes meet the requirement(term = F10, room=RCH122)  temp
--Secondly, together with course where cno is the same, find out the cname
--Thirdly, together with the class where cno,term,section are all the same, find out instructor(to get pname)
--Finally together with professor where eid is the same, find out pname

SELECT   t.cname, t.cno, p.pname
FROM		(SELECT	temp2.cno,temp2.cname,cl.instructor
			 FROM		(SELECT c.cno, c.cname, temp.term, temp.section
					 	 FROM	(SELECT cno, term, section FROM schedule WHERE term = 'F10' AND room = 'RCH122') temp ,
					 	                course c
					 	 WHERE c.cno=temp.cno) temp2,
		 				class cl
		 	WHERE cl.cno = temp2.cno AND cl.term = temp2.term AND cl.section = temp2.section) t,
			professor p
WHERE 	p.eid = t.instructor
ORDER BY t.cno;
