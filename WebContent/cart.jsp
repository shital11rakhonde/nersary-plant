<%@ page import="java.util.*, entity.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/header.jsp" %>

<!-- ✅ Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<%@ page import="entity.User" %>
<%
    User user = (User) session.getAttribute("user");

    if (user == null || !"customer".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double grandTotal = 0;
    String message = (String) session.getAttribute("message");
%>

<div class="container mt-5">
    <h2 class="mb-4"><i class="bi bi-cart4"></i> Your Shopping Cart</h2>

    <%-- ✅ Success or Info Message --%>
    <% if (message != null) { %>
        <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
            <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% session.removeAttribute("message"); } %>

    <% if (cart == null || cart.isEmpty()) { %>
        <div class="alert alert-info text-center">🪴 Your cart is empty!</div>
    <% } else { %>
        <table class="table table-bordered table-hover">
            <thead class="table-success text-center">
                <tr>
                    <th>Image</th>
                    <th>Plant Name</th>
                    <th>Price (₹)</th>
                    <th>Quantity</th>
                    <th>Total (₹)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="align-middle text-center">
                <% for (CartItem item : cart) {
                    grandTotal += item.getTotalPrice();
                %>
                <tr>
                    <td>
                        <img src="<%= item.getPlant().getImage() %>" width="90" height="90" class="img-thumbnail">
                    </td>
                    <td><%= item.getPlant().getName() %></td>
                    <td>₹<%= item.getPlant().getPrice() %></td>
                    <td>
                        <form action="UpdateCartQuantityServlet" method="post" class="d-flex justify-content-center">
                            <input type="hidden" name="plantId" value="<%= item.getPlant().getId() %>">
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" 
                                   class="form-control form-control-sm me-2" style="width: 70px;">
                            <button type="submit" class="btn btn-outline-primary btn-sm">Update</button>
                        </form>
                    </td>
                    <td>₹<%= item.getTotalPrice() %></td>
                    <td>
                        <form action="RemoveFromCartServlet" method="post">
                            <input type="hidden" name="plantId" value="<%= item.getPlant().getId() %>">
                            <button class="btn btn-danger btn-sm" type="submit">
                                <i class="bi bi-trash3"></i> Remove
                            </button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="d-flex justify-content-between align-items-center mt-4">
            <h4 class="text-success">Total Amount: ₹<%= grandTotal %></h4>
            <div>
                <a href="order.jsp" class="btn btn-primary me-2">
                    <i class="bi bi-credit-card"></i> Proceed to Checkout
                </a>
                <form action="EmptyCartServlet" method="post" style="display:inline;">
                    <button type="submit" class="btn btn-outline-danger">
                        <i class="bi bi-trash-fill"></i> Empty Cart
                    </button>
                </form>
            </div>
        </div>
    <% } %>
</div>

<%@ include file="partials/footer.jsp" %>
