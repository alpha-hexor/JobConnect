<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="/css/recruiterdashboard.css">
<title>Recruiter Dashboard</title>

</head>
<body>
	<!-- Navbar -->
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
				<li class="nav-item"><a class="nav-link" href="/recruiter/view-my-jobposts">Manage
						Job Posts</a></li>
				<li class="nav-item"><a class="nav-link" href="/recruiter/view-applicants">View
						Applicants</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">

				<a href="/recruiter/jobroles/postjob">
					<button class="btn btn-outline-primary me-2 mx-1" type="button">View
						Jobs & Post job</button>
				</a> <a href="/logout">
					<button class="btn btn-success my-2 my-sm-0" type="button">
						<i class="bi bi-box-arrow-right me-1"></i> Logout
					</button>
				</a>
			</form>
		</div>
	</nav>

	<!-- Dashboard Content -->
	<div class="container dashboard-content">
		<h1 class="text-center mb-4">Recruiter Dashboard</h1>

		<!-- Dashboard Cards -->
		<div class="row">
			<div class="col-md-4">
				<div class="card text-white bg-primary">
					<div class="card-body">
						<h5 class="card-title">Manage Job Posts</h5>
						<p class="card-text">Create, update, and manage your job
							listings.</p>
						<a href="/recruiter/view-my-jobposts" class="btn btn-light">Go to Job Posts</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-success">
					<div class="card-body">
						<h5 class="card-title">View Applicants</h5>
						<p class="card-text">Review and manage applicants for your job
							postings.</p>
						<a href="/recruiter/view-applicants" class="btn btn-light">View Applicants</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-info">
					<div class="card-body">
						<h5 class="card-title">Post a Job</h5>
						<p class="card-text">Create a new job posting to attract
							applicants.</p>
						<a href="/recruiter/jobroles/postjob" class="btn btn-light">Post
							a Job</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and Dependencies -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j5AxHj9BLKK5fWvC3MGJ"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>
