<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<link rel="stylesheet" href="/css/index.css">

<title>Contact Us - JobConnect</title>
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
				<li class="nav-item"><a class="nav-link " href="/">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="/about">About
						Us</a></li>
				<li class="nav-item"><a class="nav-link active" href="/contact">Contact
						Us</a></li>
			</ul>

		</div>
	</nav>
	
	
	<%
    String alertMessage = null;
    String alertType = null;

    // Check for success or error messages passed from the controller
    if (request.getAttribute("success") != null) {
        alertMessage = (String) request.getAttribute("success");
        alertType = "success";
    } else if (request.getAttribute("error") != null) {
        alertMessage = (String) request.getAttribute("error");
        alertType = "danger";
    }

    // Display alert if there is a message
    if (alertMessage != null) {
%>
    <div class="alert alert-<%= alertType %> alert-dismissible fade show" role="alert">
        <div class="content">
            <!-- Display icon based on alert type -->
            <i class="icon <%= "success".equals(alertType) ? "bi bi-check-circle-fill" : "bi bi-exclamation-triangle-fill" %>"></i>
            <%= alertMessage %>
        </div>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
<%
    }
%>
	
	
	
	

	<div class="container mt-5">
		<h2>Contact Us</h2>
		<p>If you have any questions or need assistance, please feel free
			to reach out to us:</p>
		<p>
			Email: <a href="mailto:support@jobconnect.com">support@jobconnect.com</a>
		</p>
		<p>Phone: +1 234 567 8900</p>

		<h3>Send Us a Message</h3>
		<form action="/send-message" method="post">
			<div class="form-group">
				<label for="name">Name</label> <input type="text" name="name"
					class="form-control" id="name" placeholder="Your Name" required>
			</div>
			<div class="form-group">
				<label for="email">Email address</label> <input type="email"
					name="email" class="form-control" id="email"
					placeholder="Your Email" required>
			</div>
			<div class="form-group">
				<label for="content">Message</label>
				<textarea class="form-control" id="content" rows="5" name="content"
					placeholder="Your Message" required></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Send Message</button>
		</form>


	</div>

	<footer class="bg-dark text-white text-center mt-5 py-3">
		<div class="container">
			<p>
				&copy; 2024 JobConnect.Developed by <strong>PIYUSH</strong> .
			</p>
			<ul class="nav justify-content-center list-unstyled d-flex">
				<li class="ms-3"><a class="text-white mx-2" href="#"><i
						class="bi bi-twitter" style="font-size: 24px;"></i></a></li>
				<li class="ms-3"><a class="text-white mx-2" href="#"><i
						class="bi bi-instagram" style="font-size: 24px;"></i></a></li>
				<li class="ms-3"><a class="text-white mx-2" href="#"><i
						class="bi bi-facebook" style="font-size: 24px;"></i></a></li>
			</ul>
		</div>
	</footer>

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
</body>

</html>
