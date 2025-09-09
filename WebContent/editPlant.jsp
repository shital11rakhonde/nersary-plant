<%@ page import="DAO.PlantDAO, entity.Plant" %>
<%@ include file="partials/adminHeader.jsp" %>

<%
    int plantId = Integer.parseInt(request.getParameter("id"));
    Plant plant = new PlantDAO().getPlantById(plantId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Plant</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .edit-container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .img-preview {
            width: 150px;
            height: auto;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        .form-label {
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="edit-container">
        <h2 class="text-center mb-4">Edit Plant Details</h2>

        <form action="updatePlant" method="post" enctype="multipart/form-data" class="row g-4">
            <input type="hidden" name="id" value="<%= plant.getId() %>">

            <!-- Name -->
            <div class="col-md-6">
                <label class="form-label">Plant Name</label>
                <input type="text" name="name" class="form-control" value="<%= plant.getName() %>" required>
            </div>

            <!-- Category -->
            <div class="col-md-6">
                <label class="form-label">Category</label>
                <input type="text" name="category" class="form-control" value="<%= plant.getCategory() %>" required>
            </div>

            <!-- Price -->
            <div class="col-md-6">
                <label class="form-label">Price (₹)</label>
                <input type="number" step="0.01" name="price" class="form-control" value="<%= plant.getPrice() %>" required>
            </div>

            <!-- Description -->
            <div class="col-md-6">
                <label class="form-label">Description</label>
                <input type="text" name="description" class="form-control" value="<%= plant.getDescription() %>">
            </div>

            <!-- Current Image & Upload -->
            <div class="col-md-12 text-center">
                <label class="form-label mb-2">Current Image</label>
                <div>
                    <img src="<%= plant.getImage() %>" alt="Plant Image" class="img-preview mb-3">
                </div>
                <input type="file" name="image" class="form-control" accept="image/*">
                <input type="hidden" name="oldImage" value="<%= plant.getImage() %>">
            </div>

            <!-- Buttons -->
            <div class="col-md-12 text-center mt-4">
                <button class="btn btn-success px-4 me-2">
                    <i class="bi bi-check-circle"></i> Update
                </button>
                <a href="managePlants.jsp" class="btn btn-secondary px-4">
                    <i class="bi bi-x-circle"></i> Cancel
