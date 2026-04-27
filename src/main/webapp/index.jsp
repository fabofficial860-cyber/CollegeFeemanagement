<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>College Fee System</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h2 class="text-center text-primary">College Fee Payment System</h2>

<div class="list-group mt-4">
    <a href="feepaymentadd.jsp" class="list-group-item list-group-item-action">Add Payment</a>
    <a href="DisplayFeePaymentsServlet" class="list-group-item list-group-item-action">View Payments</a>
    <a href="feepaymentupdate.jsp" class="list-group-item list-group-item-action">Update Payment</a>
    <a href="feepaymentdelete.jsp" class="list-group-item list-group-item-action">Delete Payment</a>
    <a href="report_form.jsp" class="list-group-item list-group-item-action">Reports</a>
    
    
    <a href="LogoutServlet" class="btn btn-danger">Logout</a>
    
    
</div>

</body>
</html>