<%@ page import="java.util.List"%>
<%@ page import="com.jobConnect.entity.Application"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<link rel="stylesheet" href="/css/candidateappliedjob.css">
<title>My Job Applications</title>

</head>
<body>
	<h1>My Job Applications</h1>
	<table>
		<thead>
			<tr>
				<th>Application ID</th>
				<th>Company Name</th>
				<th>Role</th>
				<th>Status</th>
				<th>Applied Date</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Application> applications = (List<Application>) request.getAttribute("applications");
			if (applications != null) {
				for (Application app : applications) {
					String statusClass = "";
					switch (app.getStatus()) {
					case "Applied":
				statusClass = "status-applied";
				break;
					case "Sort-Listed":
				statusClass = "status-approved";
				break;
					case "Pending":
				statusClass = "status-denied";
				break;
					case "Canceled":
				statusClass = "status-canceled";
				break;
					}
			%>
			<tr>
				<td><%=app.getApplicationId()%></td>
				<td><%=app.getCompany_name()%></td>
				<td><%=app.getRole()%></td>
				<td class="status-cell <%=statusClass%>"><%=app.getStatus()%></td>
				<td><%=app.getAppliedDate()%></td>
				<td class="action-buttons" >
					<form
						action="${pageContext.request.contextPath}/candidate/dashboard/delete-application"
						method="post" style="display: inline;">
						  <input type="hidden" name="applicationId" value="<%= app.getApplicationId() %>">
						<button type="submit" class="delete-button"
							onclick="return confirm('Are you sure you want to delete this application?');">Delete</button>
					</form>
				</td>


			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="6">No applications found.</td>
			</tr>
			<%
			}
			%>
		</tbody>

	</table>
</body>
</html>
