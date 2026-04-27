<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%><%@ page import="java.util.*, com.model.FeePayment" %>

<!DOCTYPE html>
<html>
<head>
<title>Display Payments</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h3 class="text-primary">All Payments</h3>

<table class="table table-bordered">
<tr>
<th>PaymentID</th>
<th>Student ID</th>
<th>Name</th>
<th>Date</th>
<th>Amount</th>
<th>Fee Type</th>
<th>Status</th>
</tr>

<%
List<FeePayment> list = (List<FeePayment>)request.getAttribute("paymentList");

if(list != null){
    for(FeePayment fp : list){
%>

<tr>
<td><%=fp.getPaymentId()%></td>
<td><%=fp.getStudentId()%></td>
<td><%=fp.getStudentName()%></td>
<td><%=fp.getPaymentDate()%></td>
<td><%=fp.getAmount()%></td>
<td><%= fp.getFeeType() %></td>
<td><%=fp.getStatus()%></td>
</tr>

<%
    }
} else {
%>

<tr>
<td colspan="6" class="text-center">No Records Found</td>
</tr>

<%
}
%>

</table>

<div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-success">🏠 Back to Home</a>
</div>

</body>
</html>