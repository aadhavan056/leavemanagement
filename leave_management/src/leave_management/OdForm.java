package leave_management;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


import java.sql.*;
import java.util.*;



/**
 *
 * @author aadhav
 */
@WebServlet(urlPatterns = {"/odform"})
public class OdForm extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            String sid=request.getParameter("s1");
            String reason=request.getParameter("reason");
            String fdate =request.getParameter("fdate");
            String note=request.getParameter("note");
            String f1=request.getParameter("f1");
            String temp=request.getParameter("period");
            int period=Integer.parseInt(temp);
            String day=request.getParameter("day");
            int id=1;
            
            
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet hibernateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>leave applied</h1>");
            
           
            
            File file = new File(f1);
        
            
       
        
        
        try {
	     FileInputStream fs = new FileInputStream(f1);
	     
	     //convert file into array of bytes
	     
	     Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave","root","");
			PreparedStatement stmt2=con.prepareStatement("select * from leave1");
			ResultSet rs=stmt2.executeQuery();
			while(rs.next())
			{
				id++;
				
			}
			
			PreparedStatement stmt=con.prepareStatement("insert into leave1( `studentid`, `reason`, `note`, `file`, `date`) values(?,?,?,?,?)");
			
			
			stmt.setString(1, sid);
			stmt.setString(2, reason);
			stmt.setString(3, note);	
			stmt.setBinaryStream(4, fs, (int)file.length());
			stmt.setString(5, fdate);
			
			stmt2=con.prepareStatement("select * from timetable where day=?");
			stmt2.setString(1, day);
			int subid=0;
			rs=stmt2.executeQuery();
			while(rs.next())
			{
				subid=rs.getInt(period);
				out.print("subid:"+subid);
				
			}
			
			
			stmt2=con.prepareStatement("insert into leave2 values(?,?,?,?");
			stmt2.setInt(1, id);
			stmt2.setInt(2, subid);
			stmt2.setInt(3, period);
			stmt2.setString(4, day);
			
			int i=stmt.executeUpdate();
			out.println("inserted successfully");
			
			con.close();
        } catch (Exception e) {
	     e.printStackTrace();
        }
        
        

			
			
        
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
