<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h3 class="text-center">Login</h3>

<form action="LoginServlet" method="post" class="mt-4">

<input type="text" name="username" placeholder="Username" class="form-control mb-3" required>

<input type="password" name="password" placeholder="Password" class="form-control mb-3" required>

<button class="btn btn-primary w-100">Login</button>

</form>

<p class="text-danger text-center mt-3">
<%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
</p>

</body>
</html>