<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<link rel="stylesheet" href="/css/index.css">


<title>JobConnect</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.html" id="jobconnect">JobConnect</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link active" href="/">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/about">About
						Us</a></li>
				<li class="nav-item"><a class="nav-link" href="/contact">Contact
						Us</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<!-- Login Button triggers modal -->
				<button class="btn btn-success my-2 my-sm-0 ml-2" type="button"
					data-toggle="modal" data-target="#loginModalAdmin">Login as Admin</button>
				
				
				<button class="btn btn-success my-2 my-sm-0 ml-2" type="button"
					data-toggle="modal" data-target="#loginModal">Login as candidate/Recruiter</button>
				<button class="btn btn-danger my-2 my-sm-0 ml-2" type="button"
					data-toggle="modal" data-target="#registrationModal">Candidate
					Register</button>
				<button class="btn btn-danger my-2 my-sm-0 ml-2" type="button"
					data-toggle="modal" data-target="#recruiterRegistrationModal">Recruiter
					Register</button>
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
		alertMessage = "Email already exists. Please use a different email.";
		alertType = "danger";
	} else if (request.getAttribute("error") != null) {
		alertMessage = (String) request.getAttribute("error");
		alertType = "danger";
	}

	// Display alert if there is a message
	if (alertMessage != null) {
	%>
	<div class="alert alert-<%=alertType%> alert-dismissible fade show"
		role="alert">
		<div class="content">
			<!-- Add an icon depending on the alert type -->
			<i
				class="icon <%=alertType.equals("success") ? "bi bi-check-circle-fill" : "bi bi-exclamation-triangle-fill"%>"></i>

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


	<!-- Main Content -->
	<div class="container mt-5">
		<div class="jumbotron text-center custom-jumbotron">
			<h1 class="display-4  ">Welcome to JobConnect!</h1>
			<p class="lead">Connecting job seekers with their dream jobs and
				recruiters with top talent.</p>
			<div id="logo-container"></div>
			<img src="/images/job3.jpeg" alt="Job Search"
				class="img-fluid rounded large-image" />
		</div>

		<div class="row text-center mt-5 ">
			<div class="col-md-6  ">
				<h2>For Job Seekers</h2>
				<p>Explore a variety of job listings, create your profile, and
					land your dream job!</p>
			</div>
			<div class="col-md-6  ">
				<h2>For Recruiters</h2>
				<p>Post job openings, manage applications, and find the best
					candidates for your company!</p>
			</div>


		</div>
	</div>
	<!--footer -->
	<footer class="footer">
		<div class="container">
			<p>
				&copy; 2024 JobConnect.Developed by <strong>PIYUSH</strong> .
			</p>
			<ul class="nav justify-content-center list-unstyled d-flex">
				<li class="ms-3"><a class="text-white mx-2" href="#"><i
						class="bi bi-twitter" style="font-size: 24px; color: white;"></i></a>
				</li>
				<li class="ms-3"><a class="text-white mx-2" href="#"><i
						class="bi bi-instagram" style="font-size: 24px; color: white;"></i></a>
				</li>
				<li class="ms-3"><a class="text-white mx-2" href="#"><i
						class="bi bi-facebook" style="font-size: 24px; color: white;"></i></a>
				</li>
			</ul>

		</div>
	</footer>
	
	
	
	
	<!-- Login Modal -->
	<div class="modal fade" id="loginModalAdmin" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Login Form -->
					<form action="/login" method="POST">
						<div class="form-group">
							<label for="roleSelect">Login as:</label> <select
								class="form-control" id="roleSelect" name="role">
								<option value="admin">Admin</option>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								name="email" placeholder="Enter email" required>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								name="password" placeholder="Password" required>
						</div>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<!-- Login Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Login Form -->
					<form action="/login" method="POST">
						<div class="form-group">
							<label for="roleSelect">Login as:</label> <select
								class="form-control" id="roleSelect" name="role">
								<option value="candidate">Candidate</option>
								<option value="recruiter">Recruiter</option>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								name="email" placeholder="Enter email" required>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								name="password" placeholder="Password" required>
						</div>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!--Candidate Modal -->
	<div class="modal fade" id="registrationModal" tabindex="-1"
		role="dialog" aria-labelledby="registrationModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="registrationModalLabel">Candidate
						Registration</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="registrationForm" action="/registerCandidate"
						method="post">
						<!-- Full Name -->
						<div class="form-group">
							<label for="candidateName">Full Name</label> <input type="text"
								class="form-control" id="candidateName" name="name"
								placeholder="Enter your full name" required>
						</div>

						<!-- Email -->
						<div class="form-group">
							<label for="candidateEmail">Email address</label> <input
								type="email" class="form-control" id="candidateEmail"
								name="email" placeholder="Enter your email address" required>
						</div>

						<!-- Phone Number -->
						<div class="form-group">
							<label for="candidatePhone">Phone Number</label> <input
								type="tel" class="form-control" id="candidatePhone" name="phone"
								placeholder="Enter your phone number" required>
						</div>

						<!-- Address -->
						<div class="form-group">
							<label for="candidateAddress">Address</label> <input type="text"
								class="form-control" id="candidateAddress" name="address"
								placeholder="Enter your address" required>
						</div>

						<!-- Highest Qualification -->
						<div class="form-group">
							<label for="qualification">Highest Qualification</label> <select
								class="form-control" id="qualification"
								name="highestQualification" required>
								<option value="">Select qualification</option>
								<option value="High School">High School</option>
								<option value="Diploma">Diploma</option>
								<option value="Bachelor's Degree">Bachelor's Degree</option>
								<option value="Master's Degree">Master's Degree</option>
								<option value="PhD">PhD</option>
							</select>
						</div>

						<!-- Date of Birth -->
						<div class="form-group">
							<label for="dob">Date of Birth</label> <input type="date"
								class="form-control" id="dob" name="dob" required>
						</div>

						<!-- Gender -->
						<div class="form-group">
							<label>Gender</label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="genderMale" value="Male" required> <label
									class="form-check-label" for="genderMale">Male</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="genderFemale" value="Female" required> <label
									class="form-check-label" for="genderFemale">Female</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="genderOther" value="Other" required> <label
									class="form-check-label" for="genderOther">Other</label>
							</div>
						</div>

						<!-- Password -->
						<div class="form-group">
							<label for="candidatePassword">Password</label> <input
								type="password" class="form-control" id="candidatePassword"
								name="password" placeholder="Password" required>
						</div>

						<button type="submit" class="btn btn-success">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Recruiter Registration Modal -->
	<div class="modal fade" id="recruiterRegistrationModal" tabindex="-1"
		role="dialog" aria-labelledby="recruiterRegistrationModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="recruiterRegistrationModalLabel">Recruiter
						Registration</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="post" action="/registerRecruiter">
						<!-- Full Name -->
						<div class="form-group">
							<label for="recruiterName">Full Name</label> <input type="text"
								class="form-control" id="recruiterName" name="fullName"
								placeholder="Enter your full name" required>
						</div>

						<!-- Company Name -->
						<div class="form-group">
							<label for="companyName">Company Name</label> <input type="text"
								class="form-control" id="companyName" name="companyName"
								placeholder="Enter your company name" required>
						</div>

						<!-- Email -->
						<div class="form-group">
							<label for="recruiterEmail">Email Address</label> <input
								type="email" class="form-control" id="recruiterEmail"
								name="email" placeholder="Enter your business email address"
								required>
						</div>
						<!-- Phone Number -->
						<div class="form-group">
							<label for="recruiterPhone">Phone Number</label> <input
								type="tel" class="form-control" id="recruiterPhone"
								name="phoneNumber" placeholder="Enter your phone number"
								required>
						</div>

						<!-- Company Website -->
						<div class="form-group">
							<label for="companyWebsite">Company Website</label> <input
								type="url" class="form-control" id="companyWebsite"
								name="companyWebsite"
								placeholder="Enter your company website URL" required>
						</div>

						<!-- Industry -->
						<div class="form-group">
							<label for="industry">Industry</label> <select
								class="form-control" id="industry" name="industry" required>
								<option value="">Select industry</option>
								<option value="IT">Information Technology</option>
								<option value="Healthcare">Healthcare</option>
								<option value="Finance">Finance</option>
								<option value="Education">Education</option>
								<option value="Manufacturing">Manufacturing</option>
								<option value="Others">Others</option>
							</select>
						</div>

						<!-- Password -->
						<div class="form-group">
							<label for="recruiterPassword">Password</label> <input
								type="password" class="form-control" id="recruiterPassword"
								name="password" placeholder="Password" required>
						</div>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Registration Success Modal -->
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog"
		aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="successModalLabel">Registration
						Successful</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Your registration has been
					successfully completed.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
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



</body>

</html>
