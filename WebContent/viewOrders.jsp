<%@ page import="java.util.*, entity.Order, DAO.OrderDAO, entity.User, JDBC.Util.jdbcUtilClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/adminHeader.jsp" %>

<%
    // Check if user is logged in and is an admin
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User user = (User) session.getAttribute("user");
    if (!"admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("home");
        return;
    }

    List<Order> orders = new ArrayList<>();
   
    try {
        OrderDAO orderDAO = new OrderDAO();   // ✅ no argument
        orders = orderDAO.getAllOrders();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<div class="container mt-5">
    <h3 class="mb-4 text-center">📊 View Orders</h3>

    <table class="table table-bordered table-striped shadow-sm">
        <thead class="table-success">
            <tr>
                <th>Order ID</th>
                <th>User</th>
                <th>Date</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Details</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Order o : orders) {
        %>
            <tr>
                <td><%= o.getOrderId() %></td>
                <td><%= o.getUserName() %></td>
                <td><%= o.getOrderDate() %></td>
                <td>₹<%= o.getTotalAmount() %></td>
                <td><%= o.getStatus() %></td>
                <td>
                    <a href="orderDetails?orderId=<%= o.getOrderId() %>" class="btn btn-sm btn-info">View</a>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<%@ include file="partials/footer.jsp" %>
