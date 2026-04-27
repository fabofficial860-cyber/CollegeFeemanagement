<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
</head>

<body>

<h2>Dashboard</h2>

<!-- TOTAL STUDENTS -->
<p>Total Students: <b><%=request.getAttribute("totalStudents")%></b></p>

<!-- TOTAL AMOUNT -->
<p>Total Collection: ₹ <b><%=request.getAttribute("totalAmount")%></b></p>

<hr>

<h3>Fee Type Summary</h3>

<table border="1">
<tr>
<th>Fee Type</th>
<th>Count</th>
</tr>

<%
Map<String,Integer> map = (Map<String,Integer>)request.getAttribute("feeTypeData");

if(map != null){
    for(String key : map.keySet()){
%>

<tr>
<td><%=key%></td>
<td><%=map.get(key)%></td>
</tr>

<%
    }
}
%>

</table>

<br>
<a href="index.jsp">Back</a>

</body>
</html>