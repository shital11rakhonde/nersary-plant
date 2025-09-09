<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8" %>
<%@ include file="partials/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg border-danger">
                <div class="card-body text-center">
                    <h1 class="display-4 text-danger">⚠ Oops!</h1>
                    <p class="lead">Something went wrong while processing your request.</p>

                    <div class="alert alert-warning mt-3">
                        <strong>Error Details:</strong><br>
                        <%= exception != null ? exception.getMessage() : "Unexpected error occurred." %>
                    </div>

                    <a href="home" class="btn btn-success mt-3">🏡 Back to Home</a>
                    <a href="viewOrders.jsp" class="btn btn-primary mt-3">📦 View Orders</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="partials/footer.jsp" %>
