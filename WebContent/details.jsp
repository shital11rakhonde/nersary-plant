<%@ page import="java.util.*, entity.Order, entity.OrderItem, entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/adminHeader.jsp" %>


<%
    // Check login + admin
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User user = (User) session.getAttribute("user");
    if (!"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("home");
        return;
    }

    Order order = (Order) request.getAttribute("order");
    List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");
%>

<div class="container mt-5">
    <h3 class="text-center mb-4">📦 Order Details</h3>

    <% if (order != null) { %>
        <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <h5 class="card-title">Order #<%= order.getOrderId() %></h5>
                <p><strong>User:</strong> <%= order.getUserName() %></p>
                <p><strong>Date:</strong> <%= order.getOrderDate() %></p>
                <p><strong>Status:</strong> <%= order.getStatus() %></p>
                <p><strong>Total Amount:</strong> ₹<%= order.getTotalAmount() %></p>
            </div>
        </div>

        <h5>🪴 Ordered Plants</h5>
        <table class="table table-bordered table-striped shadow-sm">
            <thead class="table-light">
                <tr>
                    <th>Plant</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <% for (OrderItem item : items) { %>
                    <tr>
                        <td><%= item.getPlantName() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td>₹<%= item.getPrice() %></td>
                        <td>₹<%= item.getQuantity() * item.getPrice() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <a href="viewOrders.jsp" class="btn btn-secondary mt-3">⬅ Back to Orders</a>
    <% } else { %>
        <div class="alert alert-danger">Order not found or invalid orderId!</div>
    <% } %>
</div>

<%@ include file="partials/footer.jsp" %>
