<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Reports</title>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h3 class="text-center text-info mb-4">Reports Dashboard</h3>

<div class="card p-4 shadow">

    <!-- Buttons Section -->
    <div class="d-grid gap-3 mb-4">

        <a href="report_form.jsp" class="btn btn-primary">
            Date Range Report
        </a>

        <a href="OverdueServlet" class="btn btn-warning">
            Overdue Payments
        </a>

        <!-- ✅ ADD THIS -->
        <a href="PaidServlet" class="btn btn-success">
            Paid Students
        </a>

    </div>

    <!-- Total Collection Form -->
    <h5 class="text-success">Total Collection</h5>

    <form action="TotalCollectionServlet" method="post">

        <label>From Date:</label>
        <input type="date" name="fromDate" class="form-control mb-2" required>

        <label>To Date:</label>
        <input type="date" name="toDate" class="form-control mb-3" required>

        <button class="btn btn-success w-100">
            Calculate Total Collection
        </button>

    </form>

</div>

<!-- Back Button -->
<div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
</div>

</body>
</html>