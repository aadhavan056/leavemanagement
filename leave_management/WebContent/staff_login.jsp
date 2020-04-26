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
PreparedStatement stmt=con.prepareStatement("select * from staff_login where username= ? and pwd= ?");

stmt.setString(1,name);
stmt.setString(2, pass);
 
 ResultSet rs=stmt.executeQuery();
 
 boolean check=rs.next();
 
 if(check)
 {
    
    
   	 int id=rs.getInt("staffid");
   	 session.setAttribute("staffid", id);
     response.sendRedirect("staff.jsp");
     
     
 
 }
 else
 {
	 response.sendRedirect("staff_signin.jsp");
 }



%>
</body>
</html>