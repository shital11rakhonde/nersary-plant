package Controller;

import DAO.PlantDAO;
import entity.Plant;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addplant")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddPlantServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        // Handle image upload
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        // Define the upload path (WebContent/img)
        String uploadPath = getServletContext().getRealPath("") + File.separator + "img";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save the file on server
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Save only relative path in DB
        String imagePath = "img/" + fileName;

        // Create Plant object and save
        Plant plant = new Plant();
        plant.setName(name);
        plant.setCategory(category);
        plant.setDescription(description);
        plant.setPrice(price);
        plant.setImage(imagePath);
        PlantDAO dao = new PlantDAO();
        boolean result = dao.addPlant(plant);

        if (result) {
            response.sendRedirect("managePlants.jsp?msg=success");
        } else {
            response.sendRedirect("managePlants.jsp?msg=error");
        }
    }
}
