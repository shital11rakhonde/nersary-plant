<meta charset="UTF-8">
<%@ include file="../partials/header.jsp" %>
<div class="container">
    <h3 class="text-center my-4">Manage Orders</h3>
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Address</th>
                <th>Status</th>
                <th>Update</th>
            </tr>
        </thead>
        <tbody>
            <!-- Example order -->
            <tr>
                <td>101</td>
                <td>Shital Wankhade</td>
                <td>Nagpur, MH</td>
                <td>Pending</td>
                <td><button class="btn btn-success btn-sm">Mark as Delivered</button></td>
            </tr>
            <!-- More rows -->
        </tbody>
    </table>
</div>
<%@ include file="../partials/footer.jsp" %>
