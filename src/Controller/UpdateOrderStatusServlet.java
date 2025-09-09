package Controller;

import DAO.OrderDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String status = request.getParameter("status");

            OrderDAO dao = new OrderDAO(); // ✅ no conn argument
            boolean updated = dao.updateOrderStatus(orderId, status);

            if (updated) {
                response.sendRedirect(request.getContextPath() + "/updateOrderStatus.jsp?success=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/updateOrderStatus.jsp?error=1");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/updateOrderStatus.jsp?error=invalidOrderId");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/updateOrderStatus.jsp?error=sql");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/updateOrderStatus.jsp?error=unknown");
        }
    }
}
