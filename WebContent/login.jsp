<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/header.jsp" %>
<%@ page import="java.util.*" %>

<!-- Bootstrap CSS CDN (if not included in header.jsp) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-lg border-0">
                <div class="card-body">
                    <h3 class="text-center mb-4">🔐 User Login</h3>

                    <!-- Display error message from servlet -->
                    <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <%= error %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <%
                        }
                    %>

                    <form method="post" action="LoginServlet">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address:</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Login</button>
                        </div>
                    </form>

                    <div class="text-center mt-3">
                        <small>Don’t have an account? <a href="register.jsp">Register here</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="partials/footer.jsp" %>
