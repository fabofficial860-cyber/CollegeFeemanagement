<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Payment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h3 class="text-danger">Delete Payment</h3>

<form action="DeleteFeePaymentServlet" method="post">

<input class="form-control mb-2" name="paymentId" placeholder="Enter Payment ID">

<button class="btn btn-danger">Delete</button>

</form>

<div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
</div>

</body>
</html>