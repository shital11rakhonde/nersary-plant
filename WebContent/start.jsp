<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- start.jsp --%>
<form action="plants" method="get" id="autoSubmitForm">
    <input type="hidden" name="action" value="load">
</form>

<script>
    // Auto-submit form when page loads
    document.getElementById("autoSubmitForm").submit();
</script>

</body>
</html>