<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Total Collection</title>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h3>Total Collection</h3>

<h4 class="text-success">
    ₹ <%= request.getAttribute("total") %>
</h4>

<a href="index.jsp" class="btn btn-primary mt-3">Back to Home</a>

</body>
</html>