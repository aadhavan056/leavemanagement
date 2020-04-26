<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%@ page import ="java.sql.*"%>
        <%@ page import ="java.io.*"%>
        
        <% 
        String temp=request.getParameter("id");
        int id=Integer.parseInt(temp);
        String filename="C:\\Users\\nandha\\Downloads\\file.pdf";
        String selectSQL = "SELECT file FROM leave1 WHERE leaveid=?";
        ResultSet rs = null;
        String connectionURL = "jdbc:mysql://localhost:3306/leave";
         Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection(connectionURL,"root", "");
        PreparedStatement pstmt = conn.prepareStatement(selectSQL);
            // set parameter;
            pstmt.setInt(1,id);
            rs = pstmt.executeQuery();
 
            // write binary stream into file
            File file = new File(filename);
            FileOutputStream output = new FileOutputStream(file);
 
            System.out.println("Writing to file " + file.getAbsolutePath());
            while (rs.next()) {
                InputStream input = rs.getBinaryStream("file");
                byte[] buffer = new byte[1024];
                while (input.read(buffer) > 0) {
                    output.write(buffer);
                }
            }
            
            out.print("download successfully to "+filename);
          
 
        %>
        

</body>
</html>