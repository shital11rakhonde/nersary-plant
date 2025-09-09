package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PlantDAO;
import JDBC.Util.jdbcUtilClass;
import entity.Plant;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = jdbcUtilClass.openconnection()) {
        	String category = request.getParameter("category");

        	PlantDAO plantDAO = new PlantDAO();
        	List<Plant> plants;  // ✅ Declare the variable first

        	if (category == null || category.isEmpty() || category.equalsIgnoreCase("all")) {
        	    plants = plantDAO.getAllPlants();
        	} else {
        	    plants = plantDAO.getPlantsByCategory(category);
        	}


            request.setAttribute("plants", plants);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load plants");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
