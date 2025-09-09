package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.OrderDAO;
import entity.Order;
import entity.OrderItem;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.getOrderById(orderId);
            List<OrderItem> items = orderDAO.getOrderItems(orderId);

            if (order != null) {
                request.setAttribute("order", order);
                request.setAttribute("items", items);
                request.getRequestDispatcher("details.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp?msg=OrderNotFound");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=InvalidOrderId");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=DatabaseError");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=UnknownError");
        }
    }
}
