<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import = "javax.servlet.*, javax.servlet.http.*, java.sql.*, java.util.*, java.io.*" %>
<%

response.setContentType("application/vnd.ms-excel"); 
response.setHeader("Content-Disposition","inline; filename="+ "attendance.xls");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
int id=(int)session.getAttribute("subid");	

PreparedStatement stmt=con.prepareStatement("select student.sid, student.name, attendance.attd from student, attendance where attendance.subjectid=? and attendance.studentid=student.sid");
stmt.setInt(1,id);

ResultSet rs=stmt.executeQuery();




%>
<center>
<table border=2>
<tr>
<th>student id</th>
<th>student name</th>
<th>attendance</th>

</tr>
<%
while(rs.next())
{
				out.print("<tr>");
            	out.println("<td>"+rs.getInt("sid")+"</td>");
        		out.println("<td>"+rs.getString("name")+"</td>");
        		out.println("<td>"+rs.getString("attd")+"</td>");
        		
        		out.println("</tr>");
	
}


%>

</center>
</table>
</body>
</html>