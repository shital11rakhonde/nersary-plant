package Controller;

import DAO.UserDAO;
import JDBC.Util.jdbcUtilClass;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = jdbcUtilClass.openconnection()) {
            UserDAO userDAO = new UserDAO(conn);
            User user = userDAO.login(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                System.out.println("Logged in as: " + user.getRole());


                // ✅ Redirect based on role
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect("adminDashboard.jsp");
                } else {
                    // ✅ Redirect to home servlet (not index.jsp directly)
                	response.sendRedirect(response.encodeRedirectURL("home"));
                }
               
            } else {
                request.setAttribute("error", "Invalid email or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Internal server error");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
