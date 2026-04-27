<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Payment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h3 class="text-warning">Update Payment</h3>

<form action="UpdateFeePaymentServlet" method="post">

<!-- USER ENTERS EVERYTHING -->
<input class="form-control mb-2" name="paymentId" placeholder="Payment ID" required>

<input class="form-control mb-2" name="studentName" placeholder="New Name" required>

<input class="form-control mb-2" name="amount" placeholder="Amount" required>

<select class="form-control mb-2" name="status">
    <option value="Paid">Paid</option>
    <option value="Overdue">Overdue</option>
</select>

<!-- ✅ FEETYPE ADDED -->
<select name="feeType" class="form-control mb-2">
    <option value="College Fee">College Fee</option>
    <option value="Course Fee">Course Fee</option>
    <option value="Hostel Fee">Hostel Fee</option>
    <option value="Exam Fee">Exam Fee</option>
</select>

<button class="btn btn-warning">Update</button>

</form>

<div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
</div>

</body>
</html>