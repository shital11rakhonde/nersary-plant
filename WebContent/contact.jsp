<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/header.jsp" %>

<div class="container my-5">
    <h2 class="text-center text-success mb-4">Contact Us</h2>
    
    <div class="row">
        <!-- Contact Info -->
        <div class="col-md-5 mb-4">
            <h4 class="text-success">Get in Touch</h4>
            <p><i class="fa-solid fa-location-dot"></i> Pune, Maharashtra</p>
            <p><i class="fa-solid fa-phone"></i> +91 9812345670</p>
            <p><i class="fa-solid fa-envelope"></i> plant_nursery_info@greenleaf.com</p>
        </div>

        <!-- Contact Form -->
        <div class="col-md-7">
            <form action="ContactServlet" method="post" class="p-4 border rounded bg-light shadow">
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Message</label>
                    <textarea name="message" rows="4" class="form-control" required></textarea>
                </div>
                <button type="submit" class="btn btn-success w-100">Send Message</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="partials/footer.jsp" %>
