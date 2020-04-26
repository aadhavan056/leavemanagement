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
<center><h1 style="font-family:verdana; font-size:300%;">Student Section</h1>
 <table cellspacing="20" cellpadding="3" border =2>
<tr>
<th>subject</th>
<th>attendance</th>
</tr>
 <%
 
        Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
        String id=(String) session.getAttribute("sid");
        PreparedStatement stmt=con.prepareStatement("select name from student where sid=?");
        stmt.setString(1, id);
		
        ResultSet rs=stmt.executeQuery();
        
        while(rs.next())
        {
        	String name=rs.getString("name");
       	 	
	       	out.print("Name:"+name+"<br>"+"student id:"+id+"<br><br>");
	       	
        }
        
        
		stmt=con.prepareStatement("select subject.subname, attendance.attd from attendance, subject where attendance.studentid=? and subject.subid=attendance.subjectid");
		stmt.setString(1, id);
		rs=stmt.executeQuery();
		int i=1;
		int div=45;
		while(rs.next())
		{
			int temp=rs.getInt("attd");
			if(i>6)
			{
				div=60;
			}
			i++;
			float attd;
			attd=(temp*100)/div;
			
			
			out.print("<tr>");
			out.print("<td>"+rs.getString("subname")+"</td>");
			out.print("<td>"+attd+"</td>");
			out.print("</tr>");
		}
		%>
		</table>
		<br>
		<br>
<form action="od.jsp" method="post">
    <input type="submit" name="od form" value="od form">
</form>
</center>

</body>
</html>