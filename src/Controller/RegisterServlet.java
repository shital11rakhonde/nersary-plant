package Controller;



import DAO.UserDAO;
import JDBC.Util.jdbcUtilClass;
import entity.User;





import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);

        try (Connection conn = jdbcUtilClass.openconnection()) {
            UserDAO userDAO = new UserDAO();
            boolean success = userDAO.registerUser(user);

            if (success) {
                request.setAttribute("message", "Registration successful. Please login.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed. Try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Internal error");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
