<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session != null && session.getAttribute("user") != null) {
        String role = ((entity.User) session.getAttribute("user")).getRole();
        if (!"admin".equalsIgnoreCase(role)) {
            response.sendRedirect("home");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Plant Nursery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">🌿 Plant Nursery Admin</a>
        <div class="d-flex">
           <span class="navbar-text text-white me-3">Welcome, <%= ((entity.User)session.getAttribute("user")).getEmail() %></span>

            <a href="logout" class="btn btn-danger btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h3 class="mb-4 text-center">Admin Panel</h3>

    <div class="row g-4">
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <h5 class="card-title">🔧 Manage Plants</h5>
                    <p class="card-text">Add, Edit, or Delete plant details.</p>
                    <a href="managePlants.jsp" class="btn btn-primary w-100">Go</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <h5 class="card-title">👥 Manage Users</h5>
                    <p class="card-text">View and remove registered users.</p>
                    <a href="manageUsers.jsp" class="btn btn-primary w-100">Go</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <h5 class="card-title">📊 View Orders</h5>
                    <p class="card-text">Check placed orders and details.</p>
                    <a href="viewOrders.jsp" class="btn btn-primary w-100">Go</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100">
                <div class="card-body text-center">
                    <h5 class="card-title">📦 Update Order Status</h5>
                    <p class="card-text">Update delivery or shipment status.</p>
                    <a href="updateOrderStatus.jsp" class="btn btn-primary w-100">Go</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
