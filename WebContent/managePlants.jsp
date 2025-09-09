<%@ page import="java.util.List" %>
<%@ page import="DAO.PlantDAO" %>
<%@ page import="entity.Plant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/adminHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Plants</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h3 class="text-center mb-4">🌿 Manage Plants</h3>

    <!-- Add New Plant Form -->
    <form action="addplant" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label>Plant Name</label>
        <input type="text" name="name" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Category</label>
        <input type="text" name="category" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Description</label>
        <textarea name="description" class="form-control" required></textarea>
    </div>

    <div class="mb-3">
        <label>Price</label>
        <input type="number" step="0.01" name="price" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Image</label>
        <input type="file" name="image" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-success">Add Plant</button>
</form>


    <!-- Plants Table -->
    <table class="table table-bordered table-hover">
        <thead class="table-success">
        <tr>
            <th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Description</th><th>Image</th><th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            PlantDAO dao = new PlantDAO();
            List<Plant> plants = dao.getAllPlants();
            for (Plant p : plants) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getCategory() %></td>
            <td>₹<%= p.getPrice() %></td>
            <td><%= p.getDescription() %></td>
            <td><img src="<%= p.getImage() %>" alt="Plant Image" style="width:150px;height:150px;">
</td>
            
            
            
            
            <td>
                <a href="editPlant.jsp?id=<%= p.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="deletePlant?id=<%= p.getId() %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Are you sure to delete this plant?')">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
<%@ include file="partials/footer.jsp" %>
</html>
