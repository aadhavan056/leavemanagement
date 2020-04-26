package leave_management;

import leave_management.student;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import java.sql.*;

@WebServlet(urlPatterns = {"/studentTest"})
public class StrudentTest extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
            {
				String sid=request.getParameter("username");
				String pass = request.getParameter("pass");
				String name=request.getParameter("name");
		
		
				String cpass=request.getParameter("cpass");
				String cap=request.getParameter("cap");
				String recap=request.getParameter("captcha");
				PrintWriter out = response.getWriter();
				
				if((pass.equals(cpass)))
				{
					if(cap.equals(recap))
					{
						try {
							
						student s=new student();
						s.setSid(sid);
						s.setName(name);
						SessionFactory sessionFactory= new Configuration().configure().buildSessionFactory();
						Session session=sessionFactory.openSession();
						session.beginTransaction();
						session.save(s);
						session.getTransaction().commit(); 
						session.close();
						out.print("added successfully");
						}
						catch(Exception e) {
							e.printStackTrace();
						
						
						}
						
						
					
					
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
				
				
            }
				

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException
		 processRequest(request, response);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException
	{
		 processRequest(request, response);
		
	}
}
