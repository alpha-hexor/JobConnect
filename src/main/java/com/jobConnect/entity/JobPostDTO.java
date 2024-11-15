
package com.jobConnect.entity;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.format.annotation.DateTimeFormat;

public class JobPostDTO {

	 private String companyName;
	    private String jobRole;
	    private String salaryRange;
	    private String experience;
	    private String skills;
	    private String jobDescription;
	    
	    // To handle the image file upload
	    private MultipartFile companyLogo;

	    private String companyUrl;
	    private String jobLocation;
	    private Date jobPostedDate;
	    private Date lastDate;
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public String getJobRole() {
			return jobRole;
		}
		public void setJobRole(String jobRole) {
			this.jobRole = jobRole;
		}
		public String getSalaryRange() {
			return salaryRange;
		}
		public void setSalaryRange(String salaryRange) {
			this.salaryRange = salaryRange;
		}
		public String getExperience() {
			return experience;
		}
		public void setExperience(String experience) {
			this.experience = experience;
		}
		public String getSkills() {
			return skills;
		}
		public void setSkills(String skills) {
			this.skills = skills;
		}
		public String getJobDescription() {
			return jobDescription;
		}
		public void setJobDescription(String jobDescription) {
			this.jobDescription = jobDescription;
		}
		public MultipartFile getCompanyLogo() {
			return companyLogo;
		}
		public void setCompanyLogo(MultipartFile companyLogo) {
			this.companyLogo = companyLogo;
		}
		public String getCompanyUrl() {
			return companyUrl;
		}
		public void setCompanyUrl(String companyUrl) {
			this.companyUrl = companyUrl;
		}
		public String getJobLocation() {
			return jobLocation;
		}
		public void setJobLocation(String jobLocation) {
			this.jobLocation = jobLocation;
		}
		public Date getJobPostedDate() {
			return jobPostedDate;
		}
		public void setJobPostedDate(Date jobPostedDate) {
			this.jobPostedDate = jobPostedDate;
		}
		public Date getLastDate() {
			return lastDate;
		}
		public void setLastDate(Date lastDate) {
			this.lastDate = lastDate;
		}
		@Override
		public String toString() {
			return "JobPostDTO [companyName=" + companyName + ", jobRole=" + jobRole + ", salaryRange=" + salaryRange
					+ ", experience=" + experience + ", skills=" + skills + ", jobDescription=" + jobDescription
					+ ", companyLogo=" + companyLogo + ", companyUrl=" + companyUrl + ", jobLocation=" + jobLocation
					+ ", jobPostedDate=" + jobPostedDate + ", lastDate=" + lastDate + "]";
		}
		public JobPostDTO(String companyName, String jobRole, String salaryRange, String experience, String skills,
				String jobDescription, MultipartFile companyLogo, String companyUrl, String jobLocation,
				Date jobPostedDate, Date lastDate) {
			super();
			this.companyName = companyName;
			this.jobRole = jobRole;
			this.salaryRange = salaryRange;
			this.experience = experience;
			this.skills = skills;
			this.jobDescription = jobDescription;
			this.companyLogo = companyLogo;
			this.companyUrl = companyUrl;
			this.jobLocation = jobLocation;
			this.jobPostedDate = jobPostedDate;
			this.lastDate = lastDate;
		}
		public JobPostDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
	    
	    
	    
}



