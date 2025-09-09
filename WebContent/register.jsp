<%@ include file="partials/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow rounded">
                <div class="card-header bg-success text-white text-center">
                    <h4>Create Account</h4>
                </div>
                <div class="card-body">
                    <form action="RegisterServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Name:</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Email:</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Password:</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        
                        <!-- ✅ Fixed role as "customer" -->
                        <input type="hidden" name="role" value="customer">

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <p>Already have an account? <a href="login.jsp">Login here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="partials/footer.jsp" %>
