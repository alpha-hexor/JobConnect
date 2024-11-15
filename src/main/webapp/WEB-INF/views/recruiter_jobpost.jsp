<%@ page import="java.util.List"%>
<%@ page import="com.jobConnect.entity.JobRole"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="/css/recruiter_jobpost.css">

<title>List of Job Roles</title>
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

<%-- Display success message if available --%>
<%
    String successMessage = (String) session.getAttribute("successMessage");
    if (successMessage != null) {
%>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="bi bi-check-circle-fill"></i> <%= successMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        // Remove the message from session after displaying
        session.removeAttribute("successMessage");
    }
%>




	<div class="container mt-4">
		<!-- Search Bar -->
		<div class="search-bar mb-3">
			<input type="text" id="searchInput" class="form-control"
				placeholder="Search by Job Role" />
			<button id="searchButton" class="btn btn-primary mt-2">Search</button>
		</div>
		<div class="table-container mt-4">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Job ID</th>
						<th>Job Role</th>
						<th>Job Description</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody id="jobRoleTableBody">
					<%
					// Retrieve the list of job roles from the model
					List<JobRole> jobRoles = (List<JobRole>) request.getAttribute("jobRoles");

					if (jobRoles != null) {
						for (JobRole jobrole : jobRoles) {
					%>
					<tr id="jobrole-<%=jobrole.getId()%>" class="jobRoleRow">
						<td><%=jobrole.getId()%></td>
						<td><%=jobrole.getJobrole()%></td>
						<td><%=jobrole.getDescription()%></td>
						<td>
							<button class="btn post-job" data-id="<%=jobrole.getId()%>"
								data-role="<%=jobrole.getJobrole()%>" data-toggle="modal"
								data-target="#postJobModal">Post Job</button>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="4">No job roles available.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<!-- Post Job Modal -->
		<div class="modal fade" id="postJobModal" tabindex="-1" role="dialog"
			aria-labelledby="postJobModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="postJobModalLabel">Post a Job</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="postJobForm" enctype="multipart/form-data"
							action="/recruiter/create-job" method="POST">
							<div class="form-group">
								<label for="companyName">Company Name</label> <input type="text"
									class="form-control" id="companyName" name="companyName"
									required>
							</div>
							<div class="form-group">
								<label for="jobRole">Job Role</label> <input type="text"
									class="form-control" id="jobRole" name="jobRole" value=""
									readonly required>
							</div>
							<div class="form-group">
								<label for="salaryRange">Salary Range</label> 
								<select class="form-control" id="salaryRange" name="salaryRange" required>
									<option value="" disabled selected>Select Salary Range</option>
									<option value="2 LPA to 3 LPA">2 LPA to 3 LPA</option>
									<option value="3 LPA to 5 LPA">3 LPA to 5 LPA</option>
									<option value="3.6 LPA to 5.6 LPA">3.6 LPA to 5.6 LPA</option>
									<option value="4 LPA to 6 LPA">4 LPA to 6 LPA</option>
									<option value="4.5 LPA to 6.5 LPA">4.5 LPA to 6.5 LPA</option>
									<option value="5 LPA to 7 LPA">5 LPA to 7 LPA</option>
									<option value="5 LPA to 8 LPA">5 LPA to 8 LPA</option>
									<option value="6 LPA to 8 LPA">6 LPA to 8 LPA</option>
									<option value="6 LPA to 10 LPA">6 LPA to 10 LPA</option>
									<option value="7 LPA to 9 LPA">7 LPA to 9 LPA</option>
									<option value="7 LPA to 12 LPA">7 LPA to 12 LPA</option>
									<option value="8 LPA to 10 LPA">8 LPA to 10 LPA</option>
									<option value="8 LPA to 15 LPA">8 LPA to 15 LPA</option>
									<option value="9 LPA to 12 LPA">9 LPA to 12 LPA</option>
									<option value="9 LPA to 13 LPA">9 LPA to 13 LPA</option>
									<option value="10 LPA to 12 LPA">10 LPA to 12 LPA</option>
									<option value="10 LPA to 15 LPA">10 LPA to 15 LPA</option>
									<option value="10 LPA to 18 LPA">10 LPA to 18 LPA</option>
									<option value="12 LPA to 15 LPA">12 LPA to 15 LPA</option>
									<option value="12 LPA to 20 LPA">12 LPA to 20 LPA</option>
									<option value="15 LPA to 20 LPA">15 LPA to 20 LPA</option>
									<option value="15 LPA to 25 LPA">15 LPA to 25 LPA</option>
									<option value="18 LPA to 25 LPA">18 LPA to 25 LPA</option>
									<option value="20 LPA to 25 LPA">20 LPA to 25 LPA</option>
									<option value="20 LPA to 30 LPA">20 LPA to 30 LPA</option>
									<option value="25 LPA to 30 LPA">25 LPA to 30 LPA</option>
									<option value="25 LPA to 35 LPA">25 LPA to 35 LPA</option>
									<option value="30 LPA to 40 LPA">30 LPA to 40 LPA</option>
									<option value="35 LPA to 45 LPA">35 LPA to 45 LPA</option>
									<option value="40 LPA to 50 LPA">40 LPA to 50 LPA</option>
									<option value="45 LPA to 55 LPA">45 LPA to 55 LPA</option>
									<option value="50 LPA to 60 LPA">50 LPA to 60 LPA</option>
									<option value="60 LPA to 70 LPA">60 LPA to 70 LPA</option>
									<option value="70 LPA to 80 LPA">70 LPA to 80 LPA</option>
									<option value="80 LPA to 90 LPA">80 LPA to 90 LPA</option>
									<option value="90 LPA to 100 LPA">90 LPA to 100 LPA</option>
									<option value="1 Crore and above">1 Crore and above</option>
								</select>
							</div>
							<div class="form-group">
								<label for="experience">Experience Required</label> <input
									type="text" class="form-control" id="experience"
									name="experience" required>
							</div>
							<div class="form-group">
								<label for="skills">Skills Required</label> <input type="text"
									class="form-control" id="skills" name="skills" required>
							</div>
							<div class="form-group">
								<label for="jobDescription">Job Description</label>
								<textarea class="form-control" id="jobDescription"
									name="jobDescription" rows="3" required></textarea>
							</div>
							<!-- Image -->
							<!--
							<div class="form-group">
								<label for="companyLogo">Company Logo</label> 
								<input type="file" class="form-control" id="companyLogo" name="companyLogo">
							</div>  -->

							<!-- Image -->
							<div class="form-group">
								<label for="companyLogo">Company Logo</label> <input type="file"
									class="form-control" id="companyLogo" name="companyLogo"
									required>
								<!-- Message for file size limit -->
								<p id="fileSizeMessage" style="color: red;">Maximum size
									allowed: 500KB</p>
							</div>

							<div class="form-group">
								<label for="companyUrl">Company URL</label> <input type="url"
									class="form-control" id="companyUrl" name="companyUrl">
							</div>
							<div class="form-group">
								<label for="jobLocation">Job Location</label> <input type="text"
									class="form-control" id="jobLocation" name="jobLocation"
									required>
							</div>
							<div class="form-group">
								<label for="jobPostedDate">Job Posted Date</label> <input
									type="date" class="form-control" id="jobPostedDate"
									name="jobPostedDate" value="" readonly>
							</div>
							<div class="form-group">
								<label for="lastDate">Last Date for Applications</label> <input
									type="date" class="form-control" id="lastDate" name="lastDate"
									required>
							</div>
							<button type="submit" class="btn btn-primary">Post Job</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							// When a Post Job button is clicked, set the job role in the modal
							$('.post-job').on(
									'click',
									function() {
										const jobRole = $(this).data('role');
										$('#jobRole').val(jobRole);
										$('#jobPostedDate').val(
												new Date().toISOString().split(
														'T')[0]); // Set current date as posted date
									});

							// Search functionality
							$('#searchButton')
									.on(
											'click',
											function() {
												const searchTerm = $(
														'#searchInput').val()
														.toLowerCase();
												$('.jobRoleRow')
														.each(
																function() {
																	const jobRole = $(
																			this)
																			.find(
																					'td:nth-child(2)')
																			.text()
																			.toLowerCase();
																	$(this)
																			.toggle(
																					jobRole
																							.includes(searchTerm));
																});
											});
						});
	</script>
	<script>
		// Get the file input element
		const companyLogoInput = document.getElementById('companyLogo');
		const postJobForm = document.getElementById('postJobForm');

		// Add event listener for file selection
		companyLogoInput
				.addEventListener(
						'change',
						function() {
							const file = this.files[0];
							// Check if file is selected
							if (file) {
								const maxSize = 500 * 1024; // 500KB in bytes
								if (file.size > maxSize) {
									alert('The file is too large. Please upload a file smaller than 500KB.');
									this.value = ''; // Clear the file input
								}
							}
						});

		// Prevent form submission if file is too large
		postJobForm
				.addEventListener(
						'submit',
						function(e) {
							const file = companyLogoInput.files[0];
							const maxSize = 500 * 1024; // 500KB in bytes

							if (file && file.size > maxSize) {
								e.preventDefault(); // Stop form submission
								alert('The file is too large. Please upload a file smaller than 500KB.');
							}
						});
	</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const alertContainer = document.getElementById("alertMessageContainer");

        // Check if there is an alert message, if not hide the alert
        <% if (successMessage == null) { %>
            alertContainer.style.display = "none";
        <% } else { %>
            alertContainer.style.display = "flex"; // Show alert if there's a message
        <% } %>
    });
</script>

<!-- Include Bootstrap JS (for alert dismiss functionality) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
