<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 2px solid #ccc;}
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 20%;
}
button:hover {
  opacity: 0.2;
}
.container {
  padding: 16px;

}

</style>
<%@page import = "javax.servlet.*, javax.servlet.http.*, java.sql.*, java.util.*, java.io.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
int id=(int)session.getAttribute("staffid");	

PreparedStatement stmt=con.prepareStatement("select staff.name, staff.subid, subject.subname from staff, subject where staffid=? and staff.subid=subject.subid");
stmt.setInt(1, id);

ResultSet rs=stmt.executeQuery();
int subid=0;
while(rs.next())
{
	String name=rs.getString("name");
	 subid=rs.getInt("subid");
	String subject=rs.getString("subname");
	out.print("Name:"+name+"<br>"+"subject ID:"+subid+"<br>"+"Subject name:"+subject);
	session.setAttribute("subid", subid);
}

stmt=con.prepareStatement("select student.sid, student.name, attendance.attd from student, attendance where attendance.subjectid=? and attendance.studentid=student.sid");
stmt.setInt(1,subid);
rs=stmt.executeQuery();
%>
<center>
<table border=2>
<tr>
<th>student id</th>
<th>student name</th>
<th>attendance</th>

</tr>
<%
int div=0;
if(subid>6)
{
	div=60;
}
else
{
	div=45;
}
	
while(rs.next())
{
				int temp=rs.getInt("attd");
				float attd;
				attd=(temp*100)/div;
				out.print("<tr>");
            	out.println("<td>"+rs.getInt("sid")+"</td>");
        		out.println("<td>"+rs.getString("name")+"</td>");
        		out.println("<td>"+attd+"</td>");
        		
        		out.println("</tr>");
	
}


%>

</center>
</table>
<div class="container" align="center">

<form method="GET" action="graph.jsp">
<button type="submit">Graph</button>
</form>
<br>

<form method="GET" action="report.jsp">
<button type="submit">Report</button>
</form>

<form method="GET" action="leave.jsp">
<button type="submit">Check Leave</button>
</form>

</div>
</body>
</html>