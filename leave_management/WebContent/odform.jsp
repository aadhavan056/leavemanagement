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
			String sid=(String)session.getAttribute("sid");
			String reason=request.getParameter("reason");
			String fdate =request.getParameter("fdate");
			String note=request.getParameter("note");
			String f1=request.getParameter("f1");
			String temp=request.getParameter("period");
			int period=Integer.parseInt(temp);
			String day=request.getParameter("day");
			int id=1;
            File file = new File(f1);
            FileInputStream fs = new FileInputStream(f1);
	     
	   
	     
		    Class.forName("com.mysql.jdbc.Driver");
		   	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
		   	
		    PreparedStatement stmt2=con.prepareStatement("select * from leave1");
			ResultSet rs=stmt2.executeQuery();
			while(rs.next())
			{
				id++;
				
			}
	
			PreparedStatement stmt=con.prepareStatement("insert into leave1( `studentid`, `reason`, `note`, `file`, `date`) values(?,?,?,?,?)");
			//PreparedStatement stmt2=con.prepareStatement("select leaveid from leave1 where");
			
			stmt.setString(1, sid);
			stmt.setString(2, reason);
			stmt.setString(3, note);	
			stmt.setBinaryStream(4, fs, (int)file.length());
			stmt.setString(5, fdate);
			
			int i=stmt.executeUpdate();
			
			
			
			
			stmt2=con.prepareStatement("select * from timetable where day=?");
			stmt2.setString(1, day);
			int subid=0;
			rs=stmt2.executeQuery();
			while(rs.next())
			{
				subid=rs.getInt(period+1);
				
				
			}
			
			
			stmt2=con.prepareStatement("insert into leave2 values(?,?,?,?)");
			stmt2.setInt(1, id);
			stmt2.setInt(2, subid);
			stmt2.setInt(3, period);
			stmt2.setString(4, day);
			
			i=stmt2.executeUpdate();
			out.println("inserted successfully");
			
			if(reason.equals("leave"))
			{
				stmt=con.prepareStatement("select attd from attendance where studentid=? and subjectid=?");
				stmt.setString(1, sid);
				stmt.setInt(2, subid);
				rs=stmt.executeQuery();
				int temp_attd=0;
				while(rs.next())
				{
					temp_attd=rs.getInt("attd");
					
				}
				out.print("<br>attd:"+temp_attd);
				temp_attd--;
				
				stmt=con.prepareStatement("update attendance set attd=? where studentid=? and subjectid=?");
				stmt.setInt(1, temp_attd);
				stmt.setString(2, sid);
				stmt.setInt(3, subid);
				i=stmt.executeUpdate();
				
				out.print("<br/>attendance detected");
				
			}
			
			
			
			
			
			%>

</body>
</html>