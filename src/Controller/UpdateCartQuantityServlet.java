package Controller;

import entity.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateCartQuantityServlet")
public class UpdateCartQuantityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int plantId = Integer.parseInt(request.getParameter("plantId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null && quantity > 0) {
            for (CartItem item : cart) {
                if (item.getPlant().getId() == plantId) {
                    item.setQuantity(quantity);
                    item.updateTotalPrice();  // If you have a method like this
                    break;
                }
            }
            session.setAttribute("message", "Cart quantity updated.");
        }

        response.sendRedirect("cart.jsp");
    }
}
