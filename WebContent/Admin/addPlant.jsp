<meta charset="UTF-8">
<%@ include file="../partials/header.jsp" %>
<div class="container">
    <h3 class="text-center my-4">Add New Plant</h3>
    <form method="post" action="AddPlantServlet" enctype="multipart/form-data" class="mx-auto" style="max-width: 600px;">
        <div class="form-group mb-2">
            <label>Plant Name:</label>
            <input type="text" class="form-control" name="plantName" required>
        </div>
        <div class="form-group mb-2">
            <label>Price:</label>
            <input type="number" class="form-control" name="price" required>
        </div>
        <div class="form-group mb-2">
            <label>Description:</label>
            <textarea class="form-control" name="description"></textarea>
        </div>
        <div class="form-group mb-3">
            <label>Image:</label>
            <input type="file" class="form-control" name="image">
        </div>
        <button type="submit" class="btn btn-success">Add Plant</button>
    </form>
</div>
<%@ include file="../partials/footer.jsp" %>
