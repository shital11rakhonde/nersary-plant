package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/EmptyCartServlet")
public class EmptyCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("cart");
        session.setAttribute("message", "Cart has been emptied.");
        response.sendRedirect("cart.jsp");
    }
}
