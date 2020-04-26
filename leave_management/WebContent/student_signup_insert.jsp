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
String sid=request.getParameter("username");
String pass = request.getParameter("pass");
String name=request.getParameter("name");


String cpass=request.getParameter("cpass");
String cap=request.getParameter("cap");
String recap=request.getParameter("captcha");






if((pass.equals(cpass)))
{
	if(cap.equals(recap))
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
		PreparedStatement stmt=con.prepareStatement("insert into student values(?,?)");
		PreparedStatement stmt2=con.prepareStatement("insert into student_login values(?,?)");
	
		stmt.setString(1, sid);
		stmt.setString(2, name);
		
		stmt2.setString(1,sid);
		stmt2.setString(2, pass);
		int i=stmt.executeUpdate();
		i=stmt2.executeUpdate();
		out.print("successfully signed in go back to login");
		int attd=45;
		for(int j=1;j<=9;j++)
		{
			if(j>6)
			{
				attd=60;
			}
			stmt=con.prepareStatement("INSERT INTO attendance values(?,?,?)");
			stmt.setString(1, sid);
			stmt.setInt(2, j);
			stmt.setInt(3, attd);
			i=stmt.executeUpdate();
		}
		out.print("successfully added attendance also");
	
	}
	else
	{
		response.sendRedirect("student_signup.jsp");
	}
	
}



else
{
	response.sendRedirect("student_signup.jsp");
}

%>
<br>
<a href="student_login.html">login</a>
</body>
</html>