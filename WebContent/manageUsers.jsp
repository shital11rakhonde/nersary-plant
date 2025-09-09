
<%@ page import="java.util.*, entity.User, DAO.UserDAO, JDBC.Util.jdbcUtilClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/adminHeader.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

  //  User currentUser = (User) session.getAttribute("user");  // <-- Line 14
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    if (!"admin".equalsIgnoreCase(currentUser.getRole())) {
        response.sendRedirect("home");
        return;
    }

    List<User> userList = new ArrayList<>();
    try {
        UserDAO userDAO = new UserDAO(jdbcUtilClass.openconnection());
        userList = userDAO.getAllUsers();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>



<div class="container mt-5">
    <h3 class="mb-4 text-center">👥 Manage Users</h3>

    <table class="table table-bordered table-hover shadow-sm">
        <thead class="table-success">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th class="text-center">Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (User u : userList) {
        %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getRole() %></td>
                <td class="text-center">
                    <%
                        boolean isSelf = (currentUser.getId() == u.getId());

                        if (!isSelf) {
                    %>
                        <form action="manageUsers" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');" style="display:inline;">
                            <input type="hidden" name="userId" value="<%= u.getId() %>">
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    <%
                        } else {
                    %>
                        <span class="text-muted">You (admin)</span>
                    <%
                        }
                    %>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<%@ include file="partials/footer.jsp" %>
