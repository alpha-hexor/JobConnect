package com.jobConnect.entity;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "job_post")
public class JobPost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String companyName;
    private String jobRole;
    private String salaryRange;
    private String experience;
    @Lob
    @Column(columnDefinition = "TEXT")
    private String skills;
    
    @Lob
    @Column(columnDefinition = "TEXT")
    private String jobDescription;

    // Field to store the image file name
    private String companyLogo;

    private String companyUrl;
    private String jobLocation;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date jobPostedDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date lastDate;

    @ManyToOne
    @JoinColumn(name = "recruiter_id", nullable = false)
    private Recruiter recruiter; // This is the recruiter object, linking to the recruiter table

 
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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

	public String getCompanyLogo() {
		return companyLogo;
	}

	public void setCompanyLogo(String companyLogo) {
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

	public Recruiter getRecruiter() {
		return recruiter;
	}

	public void setRecruiter(Recruiter recruiter) {
		this.recruiter = recruiter;
	}

	public JobPost(Long id, String companyName, String jobRole, String salaryRange, String experience, String skills,
			String jobDescription, String companyLogo, String companyUrl, String jobLocation, Date jobPostedDate,
			Date lastDate, Recruiter recruiter) {
		super();
		this.id = id;
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
		this.recruiter = recruiter;
	}

	public JobPost() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "JobPost [id=" + id + ", companyName=" + companyName + ", jobRole=" + jobRole + ", salaryRange="
				+ salaryRange + ", experience=" + experience + ", skills=" + skills + ", jobDescription="
				+ jobDescription + ", companyLogo=" + companyLogo + ", companyUrl=" + companyUrl + ", jobLocation="
				+ jobLocation + ", jobPostedDate=" + jobPostedDate + ", lastDate=" + lastDate + ", recruiter="
				+ recruiter + "]";
	}
	
    
    
}
