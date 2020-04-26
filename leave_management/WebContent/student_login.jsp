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
String name=request.getParameter("username");
String pass = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
PreparedStatement stmt=con.prepareStatement("select * from student_login where sid= ? and pwd= ?");

stmt.setString(1,name);
stmt.setString(2, pass);

 ResultSet rs=stmt.executeQuery();
 
 boolean check=rs.next();
 
 if(check)
 {
    
    
   	 String id=rs.getString("sid");
   	 session.setAttribute("sid", id);
     response.sendRedirect("student.jsp");
     
     
 
 }
 else
 {
	 response.sendRedirect("student_login.html");
 }



%>
</body>
</html>