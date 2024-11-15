<%@ page import="java.util.List"%>
<%@ page import="com.jobConnect.entity.Application"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="/images/job3.jpeg" type="image/x-icon">
<link rel="stylesheet" href="/css/recruiter_view_all_application.css">
    <title>Applicants for Your Job Postings</title>
   
</head>
<body>
    <h1>Applicants for Your Job Postings</h1>
    <table>
        <thead>
            <tr>
                <th>Application ID</th>
                <th>Candidate Name</th>
                <th>Company Name</th>
                <th>Role</th>
                <th>Candidate's Profile</th>
                <th>Status</th>
                <th>Applied Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            List<Application> applications = (List<Application>) request.getAttribute("applications");
            if (applications != null && !applications.isEmpty()) {
                for (Application app : applications) {
            %>
            <tr>
                <td><%= app.getApplicationId() %></td>
                <td><%= app.getName() %></td>
                <td><%= app.getCompany_name() %></td>
                <td><%= app.getRole() %></td>
                <td>
    			<a href="${pageContext.request.contextPath}/recruiter/view-candidate-profile?candidateId=<%= app.getCandidateId() %>">View Profile
    			</a>
				</td>
                <td>
                    <form action="${pageContext.request.contextPath}/recruiter/dashboard/update-status" method="post" style="display: inline;">
                        <input type="hidden" name="applicationId" value="<%= app.getApplicationId() %>">
                        <select name="status" onchange="this.form.submit();">
                            <option value="Applied" <%= app.getStatus().equals("Applied") ? "selected" : "" %>>Applied</option>
                            <option value="Sort-Listed" <%= app.getStatus().equals("Sort-Listed") ? "selected" : "" %>>Sort-Listed</option>
                            <option value="Pending" <%= app.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                            <option value="Canceled" <%= app.getStatus().equals("Canceled") ? "selected" : "" %>>Canceled</option>
                        </select>
                    </form>
                </td>
                <td><%= app.getAppliedDate() %></td>
                <td class="action-buttons">
                    <form action="${pageContext.request.contextPath}/recruiter/dashboard/delete-application" method="post" style="display: inline;">
                        <input type="hidden" name="applicationId" value="<%= app.getApplicationId() %>">
                        <button type="submit" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this application?');">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="8">No applications found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</body>
</html>
