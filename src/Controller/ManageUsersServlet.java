package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import DAO.UserDAO;
import JDBC.Util.jdbcUtilClass;
import entity.User;

//Controller/ManageUsersServlet.java
@WebServlet("/manageUsers")
public class ManageUsersServlet extends HttpServlet {
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

     try (Connection conn = (Connection) jdbcUtilClass.openconnection()) {
         UserDAO userDAO = new UserDAO(conn);
         List<User> users = userDAO.getAllUsers();
         request.setAttribute("userList", users);
         request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("adminDashboard.jsp");
     }
 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     int userId = Integer.parseInt(request.getParameter("userId"));

     try (Connection conn = (Connection) jdbcUtilClass.openconnection()) {
         UserDAO userDAO = new UserDAO(conn);
         userDAO.deleteUserById(userId);
     } catch (Exception e) {
         e.printStackTrace();
     }
     response.sendRedirect("manageUsers");
 }
}
