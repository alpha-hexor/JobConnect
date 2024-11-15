package com.jobConnect.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "applications")
public class Application {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long applicationId;

	@Column(name = "candidate_id", nullable = false)
	private Long candidateId; // Store candidate ID

	@Column(name = "Candidate_name", nullable = false)
	private String name; // Track application status
	
	@Column(name = "Company_name", nullable = false)
	private String company_name; // Track application status
	
	@Column(name = "role", nullable = false)
	private String role; // Track application status
	
	@Column(name = "jobpost_id", nullable = false)
	private Long jobPostId; // Store job post ID

	@Column(name = "recruiter_id", nullable = false)
	private Long recruiterId; // Store recruiter ID

	@Column(name = "status", nullable = false)
	private String status; // Track application status

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "applied_date", nullable = false)
	private Date appliedDate = new Date(); // Date of application

	public Long getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(Long applicationId) {
		this.applicationId = applicationId;
	}

	public Long getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(Long candidateId) {
		this.candidateId = candidateId;
	}

	public Long getJobPostId() {
		return jobPostId;
	}

	public void setJobPostId(Long jobPostId) {
		this.jobPostId = jobPostId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Long getRecruiterId() {
		return recruiterId;
	}

	public void setRecruiterId(Long recruiterId) {
		this.recruiterId = recruiterId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getAppliedDate() {
		return appliedDate;
	}

	public void setAppliedDate(Date appliedDate) {
		this.appliedDate = appliedDate;
	}

	public Application(Long applicationId, Long candidateId, Long jobPostId, Long recruiterId, String status,
			Date appliedDate) {
		super();
		this.applicationId = applicationId;
		this.candidateId = candidateId;
		this.jobPostId = jobPostId;
		this.recruiterId = recruiterId;
		this.status = status;
		this.appliedDate = appliedDate;
	}

	public Application() {
		super();
		// TODO Auto-generated constructor stub
	}

}
