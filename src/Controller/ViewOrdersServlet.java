package Controller;

import DAO.OrderDAO;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/viewOrders")
public class ViewOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            OrderDAO orderDAO = new OrderDAO();
            List<Order> orders = orderDAO.getAllOrders();

            request.setAttribute("orders", orders);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=DatabaseError");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=UnknownError");
        }
    }
}
