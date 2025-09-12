SELECT e.Ename AS EmployeeName,
       dpt.Dname AS DepartmentName,
       e.Salary,
       e.Experience,
       c.Cname AS City,
       dist.Dname AS District,
       st.Sname AS State,
       ctr.Cname AS Country
FROM Emp_info e
JOIN Dept_info dpt ON e.Did = dpt.Did
JOIN City_info c ON e.Cid = c.Cid
JOIN District dist ON c.Did = dist.Did
JOIN State st ON dist.Sid = st.Sid
JOIN Country ctr ON st.Cid = ctr.Cid;
