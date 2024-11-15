<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.jobConnect.entity.CandidatesDetails"%>
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

<title>All Candidates</title>

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
					<th>Candidate ID</th>
					<th>Full Name</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				// Retrieve the list of candidates from the request attribute
				List<CandidatesDetails> candidates = (List<CandidatesDetails>) request.getAttribute("candidates_value");

				if (candidates != null) {
					for (CandidatesDetails candidate : candidates) {
				%>
				<tr>
					<td><%=candidate.getId()%></td>
					<td><%=candidate.getName()%></td>
					<td><%=candidate.getEmail()%></td>
					<td><%=candidate.getPhone()%></td>
					<td>
						<button class="btn btn-danger delete-candidate"
							data-id="<%=candidate.getId()%>">Delete</button>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6">No candidates available.</td>
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
    $(document).on('click', '.delete-candidate', function() {
        const candidateId = $(this).data('id');
        const row = $(this).closest('tr');

        $.ajax({
            url: '/admin/deleteCandidate', // Update the URL to your delete endpoint
            type: 'POST',
            data: { candidateId: candidateId },
            success: function(response) {
                // Remove the row from the table
                row.remove();
            },
            error: function(xhr, status, error) {
                alert('Error deleting candidate: ' + error);
            }
        });
    });
</script>
</body>
</html>
