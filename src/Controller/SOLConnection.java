package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
/**
 * Servlet implementation class SOLConnection
 */
@WebServlet("/SOLConnection")
public class SOLConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SOLConnection() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username="root";
		String password="swami@123";
		String JDBC_URL="jdbc:mysql://localhost:3306/plant_nursery";
		String Driver="com.mysql.jdbc.Driver";
		
		try
		{
			PrintWriter writer =response.getWriter();
			writer.println("Connecting to the mysql"+JDBC_URL);	
				
				Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(JDBC_URL,username,password);	
			writer.println("coonection successful!!!!!");
				con.close();
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
