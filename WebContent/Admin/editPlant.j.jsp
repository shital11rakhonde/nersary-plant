<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../partials/header.jsp" %>
<div class="container">
    <h3 class="text-center my-4">Edit or Delete Plants</h3>
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Example row -->
            <tr>
                <td>1</td>
                <td>Aloe Vera</td>
                <td>₹150</td>
                <td><a href="updatePlant.jsp?id=1" class="btn btn-warning btn-sm">Edit</a></td>
                <td><a href="DeletePlantServlet?id=1" class="btn btn-danger btn-sm">Delete</a></td>
            </tr>
            <!-- More rows dynamically -->
        </tbody>
    </table>
</div>
<%@ include file="../partials/footer.jsp" %>
