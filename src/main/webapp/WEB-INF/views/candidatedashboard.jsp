<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.jobConnect.entity.JobPost"%>
<%@ page import="com.jobConnect.entity.CandidatesDetails"%>
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
<link rel="stylesheet" href="/css/candidates.css">
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<title>JobConnect</title>
</head>
<body>
	<a href="/candidate/profile" class="candidate-profile-link"> <i
		class="bi bi-person-circle candidate-profile-icon"></i>
	</a>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/" id="jobconnect">JobConnect</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto"></ul>
			<form class="form-inline my-2 my-lg-0">
			<a href="/candidate/dashboard/view-my-applications"><button class="btn btn-outline-primary me-2 mx-1 add-class"
					type="button">View Applications</button></a>	
			<a href="#view-jobs">	<button class="btn btn-outline-primary me-2 mx-1 add-class"
					type="button">View Jobs</button> </a>
				<a href="/logout">
					<button class="btn btn-success my-2 my-sm-0" type="button">
						<i class="bi bi-box-arrow-right me-1"></i> Logout
					</button>
				</a>
			</form>
		</div>
	</nav>

	<%-- Success message --%>
	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<div class="alert alert-success">
		<div class="content">
			<span class="icon">✔️</span>
			<%=message%>
		</div>
		<button class="close"
			onclick="this.parentElement.style.display='none';">&times;</button>
	</div>
	<%
	}
	%>

	<%-- Error message --%>
	<%
	String error = (String) request.getAttribute("error");
	if (error != null) {
	%>
	<div class="alert alert-danger">
		<div class="content">
			<span class="icon">❌</span>
			<%=error%>
		</div>
		<button class="close"
			onclick="this.parentElement.style.display='none';">&times;</button>
	</div>
	<%
	}
	%>
	
<section id="view-jobs">
	<div class="container text-center my-5">
		<h1>Find Your Dream Job Now!</h1>
		<p>Accelerate your job search here.</p>
	</div>

	<div class="search-container">
		<input type="text" id="jobRoleSearch" placeholder="Search by Job Role" />
		<input type="text" id="locationSearch"
			placeholder="Search by Location" />
		<button onclick="filterJobs()">Search</button>
	</div>

	<div class="job-container">
    <%
    List<JobPost> jobPosts = (List<JobPost>) request.getAttribute("jobPosts");
    if (jobPosts != null && !jobPosts.isEmpty()) {
        for (JobPost jobPost : jobPosts) {
    %>
    <div class="job-card" 
         data-job-role="<%=jobPost.getJobRole()%>"
         data-location="<%=jobPost.getJobLocation()%>"
         data-last-date="<%=jobPost.getLastDate() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(jobPost.getLastDate()) : ""%>"
         onclick="openModal('<%=jobPost.getCompanyName()%>', '<%=request.getContextPath()%>/uploads/<%=jobPost.getCompanyLogo()%>', '<%=jobPost.getJobRole()%>', '<%=jobPost.getSalaryRange()%>', '<%=jobPost.getExperience()%>', '<%=jobPost.getSkills()%>', '<%=jobPost.getJobDescription()%>', '<%=jobPost.getJobLocation()%>', '<%=jobPost.getLastDate() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(jobPost.getLastDate()) : "N/A"%>', '<%=jobPost.getId()%>')">
        <div class="job-header">
            <img src="<%=request.getContextPath()%>/uploads/<%=jobPost.getCompanyLogo()%>" alt="<%=jobPost.getCompanyName()%> Logo">
            <div>
                <div class="company-name"><%=jobPost.getCompanyName()%></div>
                <div class="job-role"><%=jobPost.getJobRole()%></div>
            </div>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p>No job postings available.</p>
    <%
    }
    %>
</div>
</section>
	<!-- Modal -->
	<div id="jobModal" class="modal">
		<div class="modal-content">
			<span class="close-modal" onclick="closeModal()">&times;</span>
			<div class="modal-header">
				<img id="modalLogo" src="" alt="Company Logo">
				<div>
					<h2 id="modalCompanyName"></h2>
					<p id="modalJobRole"></p>
				</div>
			</div>
			<div class="modal-body">
				<p>
					<strong>Salary Range:</strong> <span id="modalSalaryRange"></span>
				</p>
				<p>
					<strong>Experience:</strong> <span id="modalExperience"></span>
				</p>
				<p>
					<strong>Skills:</strong> <span id="modalSkills"></span>
				</p>
				<p>
					<strong>Description:</strong> <span id="modalDescription"></span>
				</p>
				<p>
					<strong>Location:</strong> <span id="modaljobLocation"></span>
				</p>
				<p>
					<strong>Last Date:</strong> <span id="modalLastDate"></span>
				</p>
			</div>

			<div class="modal-footer">
				<form action="/candidate/dashboard/apply-job" method="post">
					<input type="hidden" name="jobPostId" id="modalJobPostId">
					<button type="submit" class="apply-btn" id="applyBtn-{jobPostId}"
						onclick="applyForJob({jobPostId}, this)">Apply</button>
				</form>
			</div>
		</div>
	</div>

	<!-- Include necessary JS files -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

	<script>
        // Open the modal with the job post details
        function openModal(companyName, logo, jobRole, salaryRange, experience, skills, description, jobLocation, lastDate, jobPostId) {
            document.getElementById('modalCompanyName').innerText = companyName;
            document.getElementById('modalLogo').src = logo;
            document.getElementById('modalJobRole').innerText = jobRole;
            document.getElementById('modalSalaryRange').innerText = salaryRange;
            document.getElementById('modalExperience').innerText = experience;
            document.getElementById('modalSkills').innerText = skills;
            document.getElementById('modalDescription').innerText = description;
            document.getElementById('modaljobLocation').innerText = jobLocation;  
            document.getElementById('modalLastDate').innerText = lastDate;
            document.getElementById('modalJobPostId').value = jobPostId;
            document.getElementById('jobModal').style.display = 'flex';
        }

        // Close the modal
        function closeModal() {
            document.getElementById('jobModal').style.display = 'none';
        } 
    </script>
	<script>
    function filterJobs() {
        // Get the values from the search input fields
        const jobRoleSearch = document.getElementById("jobRoleSearch").value.toLowerCase();
        const locationSearch = document.getElementById("locationSearch").value.toLowerCase();

        // Get all the job cards
        const jobCards = document.querySelectorAll(".job-card");

        // Loop through each job card and check if it matches the search terms
        jobCards.forEach(function(card) {
            const jobRole = card.getAttribute("data-job-role").toLowerCase();
            const jobLocation = card.getAttribute("data-location").toLowerCase();

            // Check if both job role and location match (or if the input is empty)
            if ((jobRole.includes(jobRoleSearch) || jobRoleSearch === "") &&
                (jobLocation.includes(locationSearch) || locationSearch === "")) {
                card.style.display = "block"; // Show matching job cards
            } else {
                card.style.display = "none";  // Hide non-matching job cards
            }
        });
    }
</script>
	<script>
    // Function to check and update button status on page load
    document.addEventListener("DOMContentLoaded", () => {
        const jobPostIds = [...document.querySelectorAll(".apply-btn")].map(btn => btn.id.split('-')[1]);
        
        jobPostIds.forEach(jobPostId => {
            fetch(`/candidate/dashboard/check-application-status?jobPostId=${jobPostId}`)
                .then(response => response.json())
                .then(hasApplied => {
                    const button = document.getElementById(`applyBtn-${jobPostId}`);
                    if (hasApplied) {
                        button.classList.add("applied-btn");
                        button.textContent = "✓ Applied";
                        button.disabled = true;
                    }
                });
        });
    });

    // Apply for job function when button is clicked
    function applyForJob(jobPostId, button) {
        fetch(`/candidate/dashboard/apply-job`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ jobPostId })
        })
        .then(response => {
            if (response.ok) {
                button.classList.add("applied-btn");
                button.textContent = "✓ Applied";
                button.disabled = true;
            }
        })
        .catch(error => console.error("Error:", error));
    }
</script>
	<script>
        document.addEventListener("DOMContentLoaded", function() {
            // Display alerts if they exist
            var successAlert = document.querySelector('.alert-success');
            if (successAlert) {
                successAlert.style.display = 'flex'; // Make sure it's displayed as flex
            }

            var errorAlert = document.querySelector('.alert-danger');
            if (errorAlert) {
                errorAlert.style.display = 'flex'; // Make sure it's displayed as flex
            }
        });
    </script>
<script>
    // Hide jobs that have expired based on lastDate
    document.addEventListener("DOMContentLoaded", function() {
        const jobCards = document.querySelectorAll(".job-card");
        const today = new Date();

        jobCards.forEach(card => {
            const lastDate = card.getAttribute("data-last-date");
            if (lastDate) {
                const jobLastDate = new Date(lastDate);

                // If the last date is before today, hide the job card
                if (jobLastDate < today) {
                    card.style.display = "none";
                }
            }
        });
    });
</script>
</body>
</html>