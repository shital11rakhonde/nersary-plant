<%@ page import="entity.User" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">
<style>
  .navbar {
    background: linear-gradient(90deg, #2e7d32, #66bb6a);
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  }
  .navbar-brand {
    font-weight: bold;
    font-size: 1.5rem;
    color: white !important;
  }
  .navbar-brand i {
    margin-right: 8px;
    color: #c8e6c9;
  }
  .nav-link {
    color: white !important;
    font-weight: 500;
    margin-left: 10px;
    transition: all 0.3s ease;
    border-radius: 20px;
    padding: 6px 12px;
  }
  .nav-link:hover {
    background: rgba(255,255,255,0.2);
    transform: scale(1.05);
  }
  .btn-logout {
    background: #f44336;
    color: white !important;
    border-radius: 20px;
    padding: 6px 15px;
    transition: 0.3s;
  }
  .btn-logout:hover {
    background: #d32f2f;
  }
</style>

<%
    User currentUser = (User) session.getAttribute("user");
    int cartCount = 0;

    if (session != null && session.getAttribute("cart") != null) {
        java.util.List<entity.CartItem> cartItems = (java.util.List<entity.CartItem>) session.getAttribute("cart");
        cartCount = cartItems.size();
    }
%>

<nav class="navbar navbar-expand-lg sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="plants">
      <i class="bi bi-flower3"></i> Plant Nursery
    </a>
    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto align-items-center">

        <li class="nav-item">
          <a class="nav-link" href="plants"><i class="bi bi-house-door"></i> Home</a>
        </li>
        
        <li>
        
        </li>

        <% if (currentUser != null) { %>
            <!-- Only customer links -->
            <li class="nav-item">
              <a class="nav-link" href="cart.jsp">
                <i class="bi bi-cart3"></i> Cart 
                <% if (cartCount > 0) { %>
                    <span class="badge bg-warning text-dark"><%= cartCount %></span>
                <% } %>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="order.jsp"><i class="bi bi-receipt"></i> Orders</a>
            </li>

            <li class="nav-item">
              <a class="nav-link btn-logout" href="logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
            </li>

        <% } else { %>
            <li class="nav-item">
              <a class="nav-link" href="login.jsp"><i class="bi bi-box-arrow-in-right"></i> Login</a>
            </li>
        <% } %>

      </ul>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
