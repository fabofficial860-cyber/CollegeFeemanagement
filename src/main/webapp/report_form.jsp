<!DOCTYPE html>
<html>
<head>
<title>Reports</title>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<script>
function validateReport() {
    let from = document.forms["form"]["fromDate"].value;
    let to = document.forms["form"]["toDate"].value;

    if (from == "" || to == "") {
        alert("Please select both dates");
        return false;
    }

    if (from > to) {
        alert("From Date cannot be greater than To Date");
        return false;
    }

    return true;
}
</script>

</head>

<body class="container mt-5">

<h3 class="text-primary text-center">Reports Dashboard</h3>

<!-- DATE RANGE REPORT -->
<div class="card p-4 mt-4 shadow">
    <h5 class="text-success">Generate Report (Date Range)</h5>

    <form name="form" action="ReportServlet" method="post" onsubmit="return validateReport()">

        <label>From Date:</label>
        <input type="date" name="fromDate" class="form-control mb-2" required>

        <label>To Date:</label>
        <input type="date" name="toDate" class="form-control mb-3" required>

        <button class="btn btn-primary">Generate Report</button>
    </form>
</div>

<!-- QUICK REPORT BUTTONS -->
<div class="mt-4 text-center">

    <a href="OverdueServlet" class="btn btn-warning m-2">
        Overdue Payments
    </a>

   <a href="PaidServlet" class="btn btn-success">
    Paid Payments
</a>

</div>

<!-- TOTAL COLLECTION -->
<div class="card p-4 mt-4 shadow">
    <h5 class="text-success">Total Collection</h5>

    <form action="TotalCollectionServlet" method="post">

        <input type="date" name="fromDate" class="form-control mb-2" required>
        <input type="date" name="toDate" class="form-control mb-3" required>

        <button class="btn btn-success">Calculate Total</button>
    </form>
</div>

<!-- BACK BUTTON -->
<div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
</div>

</body>
</html>