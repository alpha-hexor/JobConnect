<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.jobConnect.entity.Application"%>
<%@ page import="com.jobConnect.service.ApplicationService"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<title>All Applications</title>
<style>
#jobconnect {
	color: rgb(119, 129, 27);
	border: 2px solid rgb(230, 230, 230);
	border-radius: 10px;
	padding: 0 18px;
	background-color: rgb(0, 0, 0);
	font-size: large;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	
}

h2 {

	text-align: center;
	color:#4CAF50;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;

}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/" id="jobconnect">JobConnect</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<!-- Placeholder for additional nav links if needed -->
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="/logout">
					<button class="btn btn-success my-2 my-sm-0" type="button">
						<i class="bi bi-box-arrow-right me-1"></i> Logout
					</button>
				</a>
			</form>
		</div>
	</nav>


	<h2>All Applications</h2>
	<table>
		<thead>
			<tr>
				<th>Application ID</th>
				<th>Candidate Name</th>
				<th>Company Name</th>
				<th>Role</th>
				<th>Status</th>
				<th>Applied Date</th>
			</tr>
		</thead>
		<tbody>
			<%
			// Fetch the applications from the request
			List<Application> applications = (List<Application>) request.getAttribute("applications");
			if (applications != null) {
				for (Application app : applications) {
			%>
			<tr>
				<td><%=app.getApplicationId()%></td>
				<td><%=app.getName()%></td>
				<td><%=app.getCompany_name()%></td>
				<td><%=app.getRole()%></td>
				<td><%=app.getStatus()%></td>
				<td><%=app.getAppliedDate()%></td>
				<!-- Ensure you have this method in your Application class -->
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="6" style="text-align: center;">No applications
					found.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>
