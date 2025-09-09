<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Order" %>
<%@ page import="DAO.OrderDAO" %>
<%@ include file="partials/adminHeader.jsp" %>

<%
    OrderDAO orderDAO = new OrderDAO();
    List<Order> orderList = orderDAO.getAllOrders();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Order Status</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Update Order Status</h2>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
          <th>User Name</th>
<th>Email</th>
<th>Address</th>
            <th>Date</th>
            <th>Total</th>
            <th>Current Status</th>
            <th>Update</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Order o : orderList) {
        %>
        <tr>
            <td><%= o.getOrderId() %></td>
            <td><%= o.getUserName() %></td>
            <td><%= o.getUserEmail() %></td>
            <td><%= o.getAddress() %></td>
            
            
            <td><%= o.getOrderDate() %></td>
            <td>₹ <%= o.getTotalAmount() %></td>
            <td><span class="badge bg-info"><%= o.getStatus() %></span></td>
            <td>
<form action="<%= request.getContextPath() %>/UpdateOrderStatusServlet" method="post" class="d-flex">
                    <input type="hidden" name="orderId" value="<%= o.getOrderId() %>"/>
                    <select name="status" class="form-select form-select-sm me-2">
                        <option value="Pending" <%= o.getStatus().equals("Pending")?"selected":"" %>>Pending</option>
                        <option value="Shipped" <%= o.getStatus().equals("Shipped")?"selected":"" %>>Shipped</option>
                        <option value="Delivered" <%= o.getStatus().equals("Delivered")?"selected":"" %>>Delivered</option>
                        <option value="Cancelled" <%= o.getStatus().equals("Cancelled")?"selected":"" %>>Cancelled</option>
                    </select>
                    <button type="submit" class="btn btn-success btn-sm">Update</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
<%@ include file="partials/footer.jsp" %>
</html>
