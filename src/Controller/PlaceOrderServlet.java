package Controller;

import DAO.OrderDAO;
import entity.CartItem;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        String address = request.getParameter("address");

        Integer userId = (user != null) ? user.getId() : null;

        if (cart == null || cart.isEmpty() || address == null || address.trim().isEmpty() || userId == null) {
            session.setAttribute("message", "Cart is empty or invalid order details.");
            response.sendRedirect("cart.jsp");
            return;
        }

        try {
            OrderDAO orderDAO = new OrderDAO();
            boolean success = orderDAO.placeOrder(userId, address, cart);

            if (success) {
                session.removeAttribute("cart");
                session.setAttribute("message", "✅ Order placed successfully!");
                response.sendRedirect("success.jsp");
            } else {
                session.setAttribute("message", "❌ Failed to place order. Please try again.");
                response.sendRedirect("cart.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "❌ An error occurred while placing the order.");
            response.sendRedirect("cart.jsp");
        }
    }
}
