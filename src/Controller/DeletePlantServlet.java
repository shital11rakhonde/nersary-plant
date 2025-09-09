package Controller;

import DAO.PlantDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deletePlant")
public class DeletePlantServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int plantId = Integer.parseInt(request.getParameter("id"));

        try {
            PlantDAO.deletePlant(plantId);
            response.sendRedirect("managePlants.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
