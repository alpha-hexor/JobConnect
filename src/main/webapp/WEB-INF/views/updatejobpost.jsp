<%@ page import="java.util.List"%>
<%@ page import="com.jobConnect.entity.JobPost"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Job Posts</title>
<link rel="stylesheet" href="/css/updatejobpost.css">
<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
</head>
<body>

	<h1>Your Job Posts</h1>
	<div class="job-table-container">
		<table class="job-table">
			<thead>
				<tr>
					<th>Logo</th>
					<th>Company Name</th>
					<th>Job Role</th>
					<th>Salary Range</th>
					<th>Experience</th>
					<th>Skills</th>
					<th>Description</th>
					<th>Location</th>
					<th>Last Date</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%-- JSP code to loop through job posts --%>
				<%
				List<JobPost> jobPosts = (List<JobPost>) request.getAttribute("jobPosts");
				if (jobPosts != null && !jobPosts.isEmpty()) {
					for (JobPost jobPost : jobPosts) {
				%>
				<tr>
					<td><img
					src="<%=request.getContextPath()%>/uploads/<%=jobPost.getCompanyLogo()%>"
					alt="<%=jobPost.getCompanyName()%> Logo" class="logo-img"></td>
					<td><%=jobPost.getCompanyName()%></td>
					<td><%=jobPost.getJobRole()%></td>
					<td><%=jobPost.getSalaryRange()%></td>
					<td><%=jobPost.getExperience()%></td>
					<td class="skills-col"><%=jobPost.getSkills()%></td>
					<td class="description-col"><%=jobPost.getJobDescription()%></td>
					<td><%=jobPost.getJobLocation()%></td>
					<td><%=jobPost.getLastDate() != null
		? new java.text.SimpleDateFormat("yyyy-MM-dd").format(jobPost.getLastDate())
		: "N/A"%></td>
					<td class="action-buttons">
					
						<a
						href="<%=request.getContextPath()%>/recruiter/delete-jobpost?id=<%=jobPost.getId()%>"
						class="btn btn-delete"
						onclick="return confirm('Are you sure you want to delete this job post?');">Delete</a>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="10" class="no-jobs-message">No job postings
						available.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>


	



</body>
</html>
