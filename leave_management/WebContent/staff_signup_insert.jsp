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
String uname=request.getParameter("username");
String pass = request.getParameter("pass");
String name=request.getParameter("name");
String temp=request.getParameter("staffid");
String subj=request.getParameter("subj");
String cpass=request.getParameter("cpass");
String cap=request.getParameter("cap");
String recap=request.getParameter("captcha");
int subid=0;
int staffid=Integer.parseInt(temp);
if(subj.equals("IP"))
{
	subid=1;
}
else if(subj.equals("IS"))
{
	subid=2;
}
else if(subj.equals("MC"))
{
	subid=3;
}
else if(subj.equals("PDS"))
{
	subid=4;
}
else if(subj.equals("PE"))
{
	subid=5;
}
else if(subj.equals("OE"))
{
	subid=6;
}
else if(subj.equals("IPLAB"))
{
	subid=7;
}
else if(subj.equals("ISLAB"))
{
	subid=8;
}
else if(subj.equals("CIP"))
{
	subid=9;
}


if((pass.equals(cpass)))
{
	if(cap.equals(recap))
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
		PreparedStatement stmt=con.prepareStatement("insert into staff values(?,?,?)");
		PreparedStatement stmt2=con.prepareStatement("insert into staff_login values(?,?,?)");
	
		stmt.setInt(1, staffid);
		stmt.setString(2, name);
		stmt.setInt(3, subid);
		stmt2.setInt(1,staffid);
		stmt2.setString(2, uname);
		stmt2.setString(3, pass);
		int i=stmt.executeUpdate();
		i=stmt2.executeUpdate();
		out.print("successfully signed in go back to login");

	
	}
	else
	{
		response.sendRedirect("staff_signup.jsp");
	}
	
}



else
{
	response.sendRedirect("staff_signup.jsp");
}

%>
</body>
</html>