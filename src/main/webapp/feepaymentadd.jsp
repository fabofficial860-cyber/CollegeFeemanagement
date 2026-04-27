<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Payment</title>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<script>
function validateForm() {
    let id = document.forms["form"]["studentId"].value;
    let name = document.forms["form"]["studentName"].value;
    let amount = document.forms["form"]["amount"].value;

    if (id=="" || name=="" || amount=="") {
        alert("All fields are required");
        return false;
    }
    return true;
}
</script>
<script>
function validateForm() {
    let amount = document.forms["form"]["amount"].value;

    if (amount < 0) {
        alert("Amount cannot be negative!");
        return false;
    }
    return true;
}
</script>

</head>

<body class="container mt-5">

<h3 class="text-success">Add Fee Payment</h3>

<form name="form" action="AddFeePaymentServlet" method="post" onsubmit="return validateForm()">

<input class="form-control mb-2" name="studentId" placeholder="Student ID" required>
<input class="form-control mb-2" name="studentName" placeholder="Student Name" required>
<input class="form-control mb-2" type="date" name="paymentDate" required>
<input class="form-control mb-2" 
       name="amount" 
       type="number" 
       min="0" 
       placeholder="Enter Amount" 
       required>
<select class="form-control mb-2" name="status">
<option value="Paid">Paid</option>
<option value="Overdue">Overdue</option>
<option value="Pending">Pending</option>
</select>

<select class="form-control mb-2" name="feeType" required>
    <option value="">Select Fee Type</option>
    <option value="College Fee">College Fee</option>
    <option value="Course Fee">Course Fee</option>
    <option value="Hostel Fee">Hostel Fee</option>
    <option value="Exam Fee">Exam Fee</option>
</select>

<button class="btn btn-success">Submit</button>

</form>

<div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
</div>

</body>
</html>