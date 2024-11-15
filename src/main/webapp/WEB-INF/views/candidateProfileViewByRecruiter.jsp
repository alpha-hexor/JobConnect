<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jobConnect.entity.Experience"%>
<%@ page import="com.jobConnect.entity.Education"%>
<%@ page import="com.jobConnect.entity.CandidatesDetails"%>
<%@ page import="com.jobConnect.entity.ProfilePic"%>
<%@ page import="com.jobConnect.entity.Resume"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<title>Candidate's Profile Who applied in your job post</title>
<link rel="stylesheet" href="/css/candidateprofile.css">
</head>
<body>
	<a href="/recruiter/dashboard" id="dashboard-btn">Go Back to
		Recruiter dashboard</a>

	<h1>Candidate Profile</h1>

	<%
	CandidatesDetails candidate = (CandidatesDetails) request.getAttribute("candidate");
	//Fetch the profile picture linked to the candidate
	String profilePicPath = (String) request.getAttribute("profilePicPath");
	%>

	<!-- Displaying profile picture -->
	<div class="profile-picture">
		<img src="<%=profilePicPath%>" alt="Profile Picture"
			class="profile-picture-img" id="profilePicture">
	</div>

	<!-- Full-Size Image Modal -->
	<div id="profileFullImageModal" class="profile-modal"
		style="display: none;">
		<span id="closeProfileImageModalBtn" class="profile-modal-close-btn">×</span>
		<img id="fullProfileImage" class="profile-modal-content">
	</div>

	<!-- Displaying candidate basic details -->
	<div class="profile-info">
		<h2>Basic Information</h2>
		<table>
			<tr>
				<th>Name</th>
				<td>${candidate.name}</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>${candidate.email}</td>
			</tr>
			<tr>
				<th>Phone</th>
				<td>${candidate.phone}</td>
			</tr>
			<tr>
				<th>Address</th>
				<td>${candidate.address}</td>
			</tr>
			<tr>
				<th>Highest Qualification</th>
				<td>${candidate.highestQualification}</td>
			</tr>
			<tr>
				<th>Date of Birth</th>
				<td>${candidate.dob}</td>
			</tr>
			<tr>
				<th>Gender</th>
				<td>${candidate.gender}</td>
			</tr>
			<tr>
				<th>Skills</th>
				<td>${candidate.skills}</td>
			</tr>
		</table>
	</div>

	<!-- Experience Section -->
	<div class="experience-section">
		<h2>Work Experience</h2>
		<%
		if (candidate.getExperience() != null && !candidate.getExperience().isEmpty()) {
		%>
		<ul>
			<%
			for (int i = 0; i < candidate.getExperience().size(); i++) {
				Experience experience = candidate.getExperience().get(i);
			%>
			<li><%=experience.getCompanyName()%> - <%=experience.getRole()%>
				(<%=experience.getStartDate()%> to <%=experience.getEndDate()%>)</li>
			<%
			}
			%>
		</ul>
		<%
		} else {
		%>
		<p>No work experience available.</p>
		<%
		}
		%>
	</div>


	<!-- Education Section -->
	<div class="education-section">
		<h2>Education</h2>
		<%
		if (candidate.getEducation() != null && !candidate.getEducation().isEmpty()) {
		%>
		<ul>
			<%
			for (int i = 0; i < candidate.getEducation().size(); i++) {
				Education education = candidate.getEducation().get(i);
			%>
			<li><%=education.getInstitutionName()%> - <%=education.getDegree()%>
				(<%=education.getStartYear()%> to <%=education.getEndYear()%>)</li>
			<%
			}
			%>
		</ul>
		<%
		} else {
		%>
		<p>No education available.</p>
		<%
		}
		%>
	</div>

<!-- Download Resume Section -->
<div class="resume-section">
    <h2>Resume Section</h2>
    
    <!-- Conditionally show the download button if resumePath is available -->
    <% if (request.getAttribute("resumePath") != null && !((String)request.getAttribute("resumePath")).isEmpty()) { %>
        <a href="<%= request.getAttribute("resumePath") %>" class="download-resume-button" id="downloadResume" download>Download Resume (PDF)</a>
    <% } %>
</div>
	<script>
		// Get modal and button elements
		var modal = document.getElementById("updateProfilePicModal");
		var btn = document.getElementById("updateProfilePicBtn");
		var closeBtn = document.getElementsByClassName("close-btn")[0];

		// Open modal when the button is clicked
		btn.onclick = function() {
			modal.style.display = "flex";
		}

		// Close modal when the close button (X) is clicked
		closeBtn.onclick = function() {
			modal.style.display = "none";
		}

		// Close modal when clicking outside the modal content
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<script>
	// Get the elements
	const profilePicture = document.getElementById("profilePicture");
	const profileFullImageModal = document.getElementById("profileFullImageModal");
	const fullProfileImage = document.getElementById("fullProfileImage");
	const closeProfileImageModalBtn = document.getElementById("closeProfileImageModalBtn");

	// Open modal when image is clicked
	profilePicture.addEventListener("click", () => {
	    fullProfileImage.src = profilePicture.src; // Set full image source
	    profileFullImageModal.style.display = "flex"; // Show modal
	});

	// Close modal when close button is clicked
	closeProfileImageModalBtn.addEventListener("click", () => {
	    profileFullImageModal.style.display = "none";
	});

	// Close modal when clicking outside the image
	profileFullImageModal.addEventListener("click", (event) => {
	    if (event.target === profileFullImageModal) {
	        profileFullImageModal.style.display = "none";
	    }
	});

	</script>
<script>
    // Get the form and file input elements with unique IDs
    var form = document.getElementById('profilePicUploadForm');
    var fileInput = document.getElementById('newProfilePic');

    // Handle the form submission
    form.onsubmit = function(event) {
        var file = fileInput.files[0]; // Get the selected file

        // Check if a file is selected and its size
        if (file) {
            var fileSize = file.size / 1024; // Size in KB

            if (fileSize > 500) { // If file is larger than 500KB
                event.preventDefault(); // Prevent form submission
                alert('File size must be less than 500KB. Please choose a smaller image.');
            }
        }
    };
</script>
</body>
</html>
