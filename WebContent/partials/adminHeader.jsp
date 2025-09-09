<%@ page import="entity.User" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<%
    User currentUser = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold text-warning" href="adminDashboard.jsp">
      <i class="bi bi-flower2"></i> Admin Panel
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#adminNavbar" aria-controls="adminNavbar"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="adminNavbar">
      <ul class="navbar-nav ms-auto">
      
      

        <li class="nav-item">
          <a class="nav-link" href="managePlants.jsp">
            <i class="bi bi-leaf"></i> Manage Plants
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="manageUsers.jsp">
            <i class="bi bi-people"></i> Manage Users
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="viewOrders.jsp">
            <i class="bi bi-bag-check"></i> View Orders
          </a>
        </li>

 <li class="nav-item">
          <a class="nav-link" href="updateOrderStatus.jsp">
            <i class="bi bi-bag-check"></i> Update Order Status
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link text-danger fw-bold" href="logout">
            <i class="bi bi-box-arrow-right"></i> Logout
          </a>
        </li>

      </ul>
    </div>
  </div>
</nav>
