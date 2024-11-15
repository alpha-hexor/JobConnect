<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="/css/admin.css">
<title>Admin Dashboard - JobConnect</title>

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
					<!-- <a class="nav-link active" href="#">Home <span class="sr-only">(current)</span></a> -->
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-outline-primary me-2 mx-1"
					data-toggle="modal" data-target="#addJobModal" type="button">Post
					Job Role</button>
				<button class="btn btn-outline-primary me-2 mx-1"
					data-toggle="modal" data-target="#addAdminModal" type="button">Add
					Admin</button>
				<button class="btn btn-success my-2 my-sm-0" type="button">
					<i class="bi bi-box-arrow-right me-1"></i> Logout
				</button>
			</form>
		</div>
	</nav>

	
	<%
	String alertMessage = null;
	String alertType = null;

	// Determine which alert to show based on request attributes
	if (request.getAttribute("success") != null) {
		alertMessage = "Registration has been successfully completed.";
		alertType = "success";
	} else if (request.getAttribute("emailError") != null) {
		alertMessage = "Email Id Already Exists.";
		alertType = "danger";
	} else if (request.getAttribute("error") != null) {
		alertMessage = (String) request.getAttribute("error");
		alertType = "danger";
	} else if (request.getAttribute("success_job_post") != null) {
		alertMessage = "Job Role Posted Successfully";
		alertType = "success";
	}

	// Display alert if there is a message
	if (alertMessage != null) {
	%>
	<div class="alert alert-<%=alertType%> alert-dismissible fade show"
		role="alert">
		<div class="content">
		
			<i
				class="icon <%=alertType.equals("success") ? "fas fa-check-circle" : "fas fa-exclamation-circle"%>"></i>
			<%=alertMessage%>
		</div>
		<button type="button" class="close" data-dismiss="alert"
			id="close_button" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	}
	%>

	<div class="center-container">
		<div class="box-container">
			<div class="box">
				<i class="fas fa-briefcase"></i>
				<!-- Job Role Icon -->
				All Job Roles
				<a href="/admin/jobroles">
					<button class="view-btn">View</button>
				</a>
			</div>
			<div class="box">
				<i class="fas fa-file-alt"></i>
				<!-- Applications Icon -->
				
				All Applications
				<a href="/admin/all-applications">
				<button class="view-btn">View</button>
				</a>
			</div>
			<div class="box">
				<i class="fas fa-user-tie"></i>
				<!-- Recruiters Icon -->
				All Recruiters
				<a href="/admin/recruiter">
					<button class="view-btn">View</button>
				</a>
			</div>
			<div class="box">
				<i class="fas fa-users"></i>
				<!-- Candidates Icon     -->
				All Candidates
				<a href="/admin/candidates">
					<button class="view-btn">View</button>
				</a>
			</div>
		</div>
	</div>
	<!-- Modal for Adding Job Roles -->
	<div class="modal fade" id="addJobModal" tabindex="-1" role="dialog"
		aria-labelledby="addJobModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addJobModalLabel">Post a New Job
						Role</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="jobPostForm" method="post" action="/postJobRole">
						<div class="form-group">
							<label for="jobRole">Job Role</label> <input type="text"
								class="form-control" id="jobRole" name="jobrole"
								placeholder="Enter Job Role" required>
						</div>
						<div class="form-group">
							<label for="jobDescription">Job Description</label>
							<textarea class="form-control" id="jobDescription"
								name="description" rows="3" placeholder="Enter Job Description"
								required oninput="checkCharLimit()"></textarea>
							<!-- Character Count Display -->
							<p id="charCount">0/200</p>
							<p id="charWarning" class="text-danger" style="display: none;">Character
								limit reached!</p>
						</div>
						<button type="submit" class="btn btn-primary">Post Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Adding Admins -->
	<div class="modal fade" id="addAdminModal" tabindex="-1" role="dialog"
		aria-labelledby="addAdminModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addAdminModalLabel">Add New Admin</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="addAdminForm" name="addAdminForm" action="/adminRegister"
						method="POST">
						<div class="form-group">
							<label for="adminEmail">Admin Name</label> <input type="text"
								class="form-control" id="adminName" name="name"
								placeholder="Enter Admin Name" required>
						</div>

						<div class="form-group">
							<label for="adminEmail">Admin Email</label> <input type="email"
								class="form-control" id="adminEmail" name="email"
								placeholder="Enter Admin Email" required>
						</div>
						<div class="form-group">
							<label for="adminPassword">Admin Password</label> <input
								type="password" class="form-control" id="adminPassword"
								name="password" placeholder="Enter Admin Password" required>
						</div>
						<button type="submit" class="btn btn-primary">Add Admin</button>
					</form>
				</div>
			</div>
		</div>
	</div>

    <!-- div modal for each  -->
    <!-- Bootstrap Modal -->
<div class="modal fade" id="jobRolesModal" tabindex="-1" role="dialog" aria-labelledby="jobRolesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="jobRolesModalLabel">Job Roles</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Scrollable List Container -->
                <div class="job-roles-list-container" style="max-height: 300px; overflow-y: auto;">
                    <ul id="jobRolesList" class="list-group">
                        <!-- Job roles will be dynamically added here -->
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
		<script>
			function checkCharLimit() {
				const maxChars = 200;
				const textArea = document.getElementById('jobDescription');
				const charCount = document.getElementById('charCount');
				const charWarning = document.getElementById('charWarning');
	
				const currentLength = textArea.value.length;
	
				// Update character count display
				charCount.textContent = currentLength + "/" + maxChars;
	
				if (currentLength >= maxChars) {
					charWarning.style.display = 'block'; // Show warning if limit reached
					textArea.value = textArea.value.substring(0, maxChars); // Trim the value to maxChars
					charCount.textContent = maxChars + "/" + maxChars;
				} else {
					charWarning.style.display = 'none'; // Hide the warning
				}
			}
		</script>
	

</body>
</html>
