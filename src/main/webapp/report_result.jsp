<%@ page import="java.util.*, com.model.FeePayment" %>

<!DOCTYPE html>
<html>
<head>
<title>Report Result</title>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h3 class="text-primary text-center">Report Result</h3>

<table class="table table-bordered table-striped mt-4">
<tr class="table-dark">
    <th>Name</th>
    <th>Amount</th>
    <th>Status</th>
    <th>Fee Type</th>
</tr>

<%
List<FeePayment> list = (List<FeePayment>)request.getAttribute("reportList");

if(list != null && !list.isEmpty()){
    for(FeePayment fp : list){
%>

<tr>
    <td><%= fp.getStudentName() %></td>
    <td><%= fp.getAmount() %></td>

    <!-- ✅ Status with color -->
    <td>
        <% if("Overdue".equalsIgnoreCase(fp.getStatus())) { %>
            <span class="text-danger fw-bold"><%= fp.getStatus() %></span>
        <% } else { %>
            <span class="text-success"><%= fp.getStatus() %></span>
        <% } %>
    </td>

    <!-- ✅ Fee Type -->
    <td><%= fp.getFeeType() %></td>
</tr>

<%
    }
} else {
%>

<tr>
    <td colspan="4" class="text-center text-danger">
        No Records Found
    </td>
</tr>

<%
}
%>

</table>

<div class="text-center mt-4">
    <a href="report_form.jsp" class="btn btn-primary">Back</a>
    <a href="index.jsp" class="btn btn-success">Home</a>
</div>

</body>
</html>