<%@ page import="java.util.*, entity.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/header.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<%@ page import="entity.User, java.util.*, entity.CartItem" %>


<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"customer".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        session.setAttribute("message", "🪴 Your cart is empty! Please add items before checkout.");
        response.sendRedirect("cart.jsp");
        return;
    }
%>
>

<div class="container my-5">
    <div class="card shadow rounded-4 p-4">
        <h2 class="mb-4 text-center text-success"><i class="bi bi-clipboard-check"></i> Order Summary</h2>

        <form action="PlaceOrderServlet" method="post">
            <div class="mb-4">
                <label class="form-label fw-bold">Delivery Address <span class="text-danger">*</span></label>
                <textarea name="address" class="form-control rounded-3 shadow-sm" rows="3" required
                          placeholder="Enter your delivery address here..."></textarea>
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle text-center">
                    <thead class="table-success">
                        <tr>
                            <th>Plant</th>
                            <th>Price (₹)</th>
                            <th>Quantity</th>
                            <th>Total (₹)</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <%
                            double grandTotal = 0;
                            for (CartItem item : cart) {
                                double total = item.getTotalPrice();
                                grandTotal += total;
                        %>
                        <tr>
                            <td><strong><%= item.getPlant().getName() %></strong></td>
                            <td><%= item.getPlant().getPrice() %></td>
                            <td><%= item.getQuantity() %></td>
                            <td><%= total %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <div class="d-flex justify-content-end align-items-center mt-4">
                <h4 class="me-4">Total: <span class="text-success fw-bold">₹<%= grandTotal %></span></h4>
            </div>

            <div class="text-end mt-3">
                <button type="submit" class="btn btn-success btn-lg shadow">
                    <i class="bi bi-truck"></i> Place Order
                </button>
            </div>
        </form>
    </div>
</div>

<%@ include file="partials/footer.jsp" %>
