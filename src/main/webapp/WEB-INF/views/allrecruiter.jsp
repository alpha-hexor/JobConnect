<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.jobConnect.entity.Recruiter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="/css/allrecruiter.css">


<title>All Recruiters</title>

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

	<div class="table-container mt-4">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Recruiter ID</th>
					<th>Full Name</th>
					<th>Company Name</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>Company Website</th>
					<th>Industry</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				// Retrieve the list of recruiters from the request attribute
				List<Recruiter> recruiters = (List<Recruiter>) request.getAttribute("recruiter_value");

				if (recruiters != null) {
					for (Recruiter recruiter : recruiters) {
				%>
				<tr>
					<td><%=recruiter.getId()%></td>
					<td><%=recruiter.getFullName()%></td>
					<td><%=recruiter.getCompanyName()%></td>
					<td><%=recruiter.getEmail()%></td>
					<td><%=recruiter.getPhoneNumber()%></td>
					<td><%=recruiter.getCompanyWebsite()%></td>
					<td><%=recruiter.getIndustry()%></td>
					<td>
						<button class="btn btn-danger delete-recruiter"
							data-id="<%=recruiter.getId()%>">Delete</button>
					</td>

				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="8">No recruiters available.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		crossorigin="anonymous"></script>
		<script>
    $(document).on('click', '.delete-recruiter', function() {
        const recruiterId = $(this).data('id');
        const row = $(this).closest('tr');

        $.ajax({
            url: '/admin/deleteRecruiter', // Update the URL to your delete endpoint
            type: 'POST',
            data: { recruiterId: recruiterId },
            success: function(response) {
                // Remove the row from the table
                row.remove();
            },
            error: function(xhr, status, error) {
                alert('Error deleting recruiter: ' + error);
            }
        });
    });
</script>	

</body>
</html>
