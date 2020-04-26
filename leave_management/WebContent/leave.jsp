<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave</title>
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
input[type=text]{
  width: 25%;
  padding: 8px 20px;
  margin: 10px 0;
  display: inline-block;
  border: 2px solid #ccc;
  box-sizing: border-box;
}
button:hover {
  opacity: 0.2;
}
.container {
  padding: 16px;

}

</style>
<%@page import="javax.servlet.*, javax.servlet.http.*, java.sql.*, java.util.*, java.io.*, java.text.*" %>
<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
	
	int subid=(int)session.getAttribute("subid");
	PreparedStatement stmt=con.prepareStatement("select leave1.leaveid, student.sid, student.name, leave1.reason, leave1.note, leave1.date from student, leave1, leave2 where leave2.subid=? and leave1.leaveid=leave2.leaveid and student.sid=leave1.studentid");
	stmt.setInt(1, subid);
	
	ResultSet rs=stmt.executeQuery();
	
	
	
	%>

	
	
	<table border=2>
	<tr>
	<th>Leave id</th>
	<th>student id</th>
	<th>name</th>
	<th>Reason</th>
	<th>Note</th>
	<th>date</th>
	</tr>
	
	<%
		
	
		while(rs.next())
			
		{
			
			out.print("<tr>");
			out.print("<td>"+rs.getInt("leaveid")+"</td>");
			out.print("<td>"+rs.getInt("sid")+"</td>");
			out.print("<td>"+rs.getString("name")+"</td>");
			out.print("<td>"+rs.getString("reason")+"</td>");
			out.print("<td>"+rs.getString("note")+"</td>");			
			out.println("<td>"+rs.getDate("date")+"</td>");
			
			out.print("</tr>");
		
		}
	
	
	
	
	%>

	</table>
	
<br>
<form action="download.jsp">
<div class="container" align="center">
<label for="leaveid"><b>Enter leave id to download the file:</b></label>
<input type="text" name="id"><br/>
        
<button type="submit">Login</button>
</div>
</form>


</body>
</html>