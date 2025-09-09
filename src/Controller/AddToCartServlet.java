package Controller;

import entity.Plant;
import entity.CartItem;
import DAO.PlantDAO;
import JDBC.Util.jdbcUtilClass;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false); // Don't create a new session

        // ✅ 1. Check if user is logged in
        if (session == null || session.getAttribute("user") == null) {
            // User not logged in
            response.sendRedirect("login.jsp");
            return;
        }

        // ✅ 2. Proceed to add to cart if user is logged in
        int plantId = Integer.parseInt(request.getParameter("plantId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        PlantDAO dao = new PlantDAO();
        Plant plant = null;
        try {
            plant = dao.getPlantById(plantId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        cart.add(new CartItem(plant, quantity));
        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}
