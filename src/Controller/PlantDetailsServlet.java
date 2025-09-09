package Controller;

import DAO.PlantDAO;
import entity.Plant;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/plantDetails")
public class PlantDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String plantIdStr = request.getParameter("plantId");

        if (plantIdStr != null && !plantIdStr.isEmpty()) {
            try {
                int plantId = Integer.parseInt(plantIdStr);
                PlantDAO dao = new PlantDAO();
                Plant plant = dao.getPlantById(plantId);

                if (plant != null) {
                    request.setAttribute("plant", plant);
                    request.getRequestDispatcher("plantDetails.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Plant not found.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }

            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid plant ID format.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Database error occurred.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Plant ID is missing.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
