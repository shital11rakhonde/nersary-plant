package Controller;

import entity.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int plantId = Integer.parseInt(request.getParameter("plantId"));
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(item -> item.getPlant().getId() == plantId);
            session.setAttribute("cart", cart);
            session.setAttribute("message", "Item removed from cart.");
        }

        response.sendRedirect("cart.jsp");
    }
}
