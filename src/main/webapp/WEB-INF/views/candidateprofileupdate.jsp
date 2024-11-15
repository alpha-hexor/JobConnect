<%@ page import="com.jobConnect.entity.CandidatesDetails"%>
<%@ page import="com.jobConnect.entity.Education"%>
<%@ page import="com.jobConnect.entity.Experience"%>
<%@ page import="java.util.List"%>
<%
CandidatesDetails candidate = (CandidatesDetails) request.getAttribute("candidate");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<link rel="stylesheet" href="/css/candidateupdateprofile.css">
<title>Candidate Profile Update</title>


</head>
<body>
	<form method="post" action="/candidate/profile/updateCandidate"
		enctype="multipart/form-data">
		<!-- Hidden field to store candidate ID -->
		<input type="hidden" name="id" value="<%=candidate.getId()%>" />

		<!-- Name -->
		<label for="name">Name:</label> <input type="text" id="name"
			name="name" value="<%=candidate.getName()%>" required />

		<!-- Email -->
		<label for="email">Email:</label> <input type="email" id="email"
			name="email" value="<%=candidate.getEmail()%>" required />

		<!-- Phone -->
		<label for="phone">Phone:</label> <input type="text" id="phone"
			name="phone" value="<%=candidate.getPhone()%>" required />

		<!-- Address -->
		<label for="address">Address:</label> <input type="text" id="address"
			name="address" value="<%=candidate.getAddress()%>" required />

		<!-- Highest Qualification -->
		<label for="highestQualification">Highest Qualification:</label> <input
			type="text" id="highestQualification" name="highestQualification"
			value="<%=candidate.getHighestQualification()%>" required />

		<!-- Date of Birth (DOB) -->
		<label for="dob">Date of Birth:</label> <input type="date" id="dob"
			name="dob" value="<%=candidate.getDob()%>" required />

		<!-- Gender -->
		<label for="gender">Gender:</label> <select id="gender" name="gender">
			<option value="Male"
				<%="Male".equals(candidate.getGender()) ? "selected" : ""%>>Male</option>
			<option value="Female"
				<%="Female".equals(candidate.getGender()) ? "selected" : ""%>>Female</option>
			<option value="Other"
				<%="Other".equals(candidate.getGender()) ? "selected" : ""%>>Other</option>
		</select>

		<!-- Password -->
		<label for="password">Password:</label> <input type="password"
			id="password" name="password" value="<%=candidate.getPassword()%>"
			required />

		<!-- Skills -->
		<label for="skills">Skills:</label> <input type="text" name="skills"
			value="<%=candidate.getSkills()%>" required />

		<!-- Education Section -->
		<div id="educationSection">
			<h3>Education</h3>

			<!-- Education 1 -->
			<div class="section-container" id="education1">
				<label for="education1_institution">Education 1 -
					Institution:</label> <input type="text" id="education1_institution"
					name="education[0].institutionName"
					value="${candidate.education[0].institutionName}" required /> <label
					for="education1_degree">Education 1 - Degree:</label> <input
					type="text" id="education1_degree" name="education[0].degree"
					value="${candidate.education[0].degree}" required /> <label
					for="education1_startYear">Education 1 - Start Year:</label> <input
					type="date" id="education1_startYear" name="education[0].startYear"
					value="${candidate.education[0].startYear}" /> <label
					for="education1_endYear">Education 1 - End Year:</label> <input
					type="date" id="education1_endYear" name="education[0].endYear"
					value="${candidate.education[0].endYear}" />
			</div>

			<!-- Education 2 -->
			<div class="section-container" id="education2">
				<label for="education2_institution">Education 2 -
					Institution:</label> <input type="text" id="education2_institution"
					name="education[1].institutionName"
					value="${candidate.education[1].institutionName}" /> <label
					for="education2_degree">Education 2 - Degree:</label> <input
					type="text" id="education2_degree" name="education[1].degree"
					value="${candidate.education[1].degree}" /> <label
					for="education2_startYear">Education 2 - Start Year:</label> <input
					type="date" id="education2_startYear" name="education[1].startYear"
					value="${candidate.education[1].startYear}" /> <label
					for="education2_endYear">Education 2 - End Year:</label> <input
					type="date" id="education2_endYear" name="education[1].endYear"
					value="${candidate.education[1].endYear}" />
				<button type="button" class="close-btn"
					onclick="hideSection('education2')">&times;</button>
			</div>

			<!-- Education 3 -->
			<div class="section-container" id="education3">
				<label for="education3_institution">Education 3 -
					Institution:</label> <input type="text" id="education3_institution"
					name="education[2].institutionName"
					value="${candidate.education[2].institutionName}" /> <label
					for="education3_degree">Education 3 - Degree:</label> <input
					type="text" id="education3_degree" name="education[2].degree"
					value="${candidate.education[2].degree}" /> <label
					for="education3_startYear">Education 3 - Start Year:</label> <input
					type="date" id="education3_startYear" name="education[2].startYear"
					value="${candidate.education[2].startYear}" /> <label
					for="education3_endYear">Education 3 - End Year:</label> <input
					type="date" id="education3_endYear" name="education[2].endYear"
					value="${candidate.education[2].endYear}" />
				<button type="button" class="close-btn"
					onclick="hideSection('education3')">&times;</button>
			</div>
		</div>


		<!-- Experience Section -->
		<div id="experienceSection">
			<h3>Experience</h3>
			<p>
				If you are freshers there just type <strong>Fresher</strong> in
				Company and <strong>Fresher</strong> Job Role *
			</p>

			<!-- Experience 1 -->
			<div class="section-container" id="experience1">
				<label for="experience1_company">Experience 1 - Company:</label> <input
					type="text" id="experience1_company"
					name="experience[0].companyName"
					value="${candidate.experience[0].companyName}" required /> <label
					for="experience1_role">Experience 1 - Role:</label> <input
					type="text" id="experience1_role" name="experience[0].role"
					value="${candidate.experience[0].role}" required /> <label
					for="experience1_startDate">Experience 1 - Start Date:</label> <input
					type="date" id="experience1_startDate"
					name="experience[0].startDate"
					value="${candidate.experience[0].startDate}" /> <label
					for="experience1_endDate">Experience 1 - End Date:</label> <input
					type="date" id="experience1_endDate" name="experience[0].endDate"
					value="${candidate.experience[0].endDate}" />
			</div>

			<!-- Experience 2 -->
			<div class="section-container" id="experience2">
				<label for="experience2_company">Experience 2 - Company:</label> <input
					type="text" id="experience2_company"
					name="experience[1].companyName"
					value="${candidate.experience[1].companyName}" /> <label
					for="experience2_role">Experience 2 - Role:</label> <input
					type="text" id="experience2_role" name="experience[1].role"
					value="${candidate.experience[1].role}" /> <label
					for="experience2_startDate">Experience 2 - Start Date:</label> <input
					type="date" id="experience2_startDate"
					name="experience[1].startDate"
					value="${candidate.experience[1].startDate}" /> <label
					for="experience2_endDate">Experience 2 - End Date:</label> <input
					type="date" id="experience2_endDate" name="experience[1].endDate"
					value="${candidate.experience[1].endDate}" />
				<button type="button" class="close-btn"
					onclick="hideSection('experience2')">&times;</button>
			</div>

			<!-- Experience 3 -->
			<div class="section-container" id="experience3">
				<label for="experience3_company">Experience 3 - Company:</label> <input
					type="text" id="experience3_company"
					name="experience[2].companyName"
					value="${candidate.experience[2].companyName}" /> <label
					for="experience3_role">Experience 3 - Role:</label> <input
					type="text" id="experience3_role" name="experience[2].role"
					value="${candidate.experience[2].role}" /> <label
					for="experience3_startDate">Experience 3 - Start Date:</label> <input
					type="date" id="experience3_startDate"
					name="experience[2].startDate"
					value="${candidate.experience[2].startDate}" /> <label
					for="experience3_endDate">Experience 3 - End Date:</label> <input
					type="date" id="experience3_endDate" name="experience[2].endDate"
					value="${candidate.experience[2].endDate}" />
				<button type="button" class="close-btn"
					onclick="hideSection('experience3')">&times;</button>
			</div>
		</div>

	<!--  	<label for="profilePic">Profile Picture:</label> 
		<input type="file" name="profilePic" id="profilePic" /> 
		<label for="resume">Resume:</label>
		<input type="file" name="resume" id="resume" /> -->
		<input type="submit" value="Save Changes" />
	</form>

	<script>
		function hideSection(sectionId) {
			var section = document.getElementById(sectionId);
			section.classList.add('hidden');
		}
	</script>
</body>
</html>
