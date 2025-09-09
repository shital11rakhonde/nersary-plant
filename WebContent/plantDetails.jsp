<%@ page import="entity.Plant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/header.jsp" %>
 <!-- ✅ Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ✅ Bootstrap Icons (for cart, heart, etc.) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- ✅ Custom styles (optional) -->
   
<%
    Plant plant = (Plant) request.getAttribute("plant");
    if (plant == null) {
%>
    <div class="container mt-5">
        <div class="alert alert-warning text-center" role="alert">
            🌱 Plant details not available.
        </div>
    </div>
<%
    } else {
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card shadow-lg border-0 rounded-4 p-4">
                <div class="row g-4">
                    <div class="col-md-5 text-center">
                        <img src="<%= plant.getImage() %>" class="img-fluid rounded" alt="<%= plant.getName() %>" style="max-height: 300px; object-fit: contain; background-color: #f8f9fa;">
                    </div>
                    <div class="col-md-7">
                        <h2 class="text-success mb-3"><%= plant.getName() %></h2>
                        <h4 class="text-muted mb-3">₹<%= plant.getPrice() %></h4>
                        <p class="mb-4"><strong>Description:</strong><br><%= plant.getDescription() %></p>

                        <form method="post" action="<%= request.getContextPath() %>/AddToCartServlet">

                            <input type="hidden" name="plantId" value="<%= plant.getId() %>">
                            <div class="mb-3">
                                <label for="quantity" class="form-label">Quantity</label>
                                <input type="number" name="quantity" id="quantity" value="1" class="form-control" style="width: 100px;" min="1" required>
                            </div>
                            <button type="submit" class="btn btn-success btn-lg px-4">
                                <i class="bi bi-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    }
%>

<%@ include file="partials/footer.jsp" %>
