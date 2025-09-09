package Controller;

import DAO.PlantDAO;
import entity.Plant;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/updatePlant")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UpdatePlantServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");

        // Handle image upload
        Part filePart = request.getPart("image"); // file input name should be "image"
        String fileName = filePart.getSubmittedFileName();

        String imagePath = null;

        if (fileName != null && !fileName.isEmpty()) {
            // Define the upload path (WebContent/img)
            String uploadPath = getServletContext().getRealPath("") + File.separator + "img";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Save file on server
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // Save relative path in DB
            imagePath = "img/" + fileName;
        } else {
            // If no new image uploaded, keep the old image from DB
            imagePath = request.getParameter("oldImage"); // hidden field in JSP
        }

        // Create Plant object and update
        Plant plant = new Plant();
        plant.setId(id);
        plant.setName(name);
        plant.setCategory(category);
        plant.setPrice(price);
        plant.setDescription(description);
        plant.setImage(imagePath);

        try {
            PlantDAO.updatePlant(plant);
            response.sendRedirect("managePlants.jsp?msg=updated");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
