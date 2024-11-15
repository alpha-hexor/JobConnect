package com.jobConnect.entity;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "recruiter")
public class Recruiter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "fullName", nullable = false)
    private String fullName;

    @Column(name = "companyName", nullable = false)
    private String companyName;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "phoneNumber", nullable = false)
    private String phoneNumber;

    @Column(name = "companyWebsite", nullable = false)
    private String companyWebsite;

    @Column(name = "industry", nullable = false)
    private String industry;

    @Column(name = "password", nullable = false)
    private String password;
    
   
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCompanyWebsite() {
		return companyWebsite;
	}

	public void setCompanyWebsite(String companyWebsite) {
		this.companyWebsite = companyWebsite;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Recruiter(String fullName, String companyName, String email, String phoneNumber, String companyWebsite,
			String industry, String password) {
		super();
		this.fullName = fullName;
		this.companyName = companyName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.companyWebsite = companyWebsite;
		this.industry = industry;
		this.password = password;
	}

	public Recruiter(Long id, String fullName, String companyName, String email, String phoneNumber,
			String companyWebsite, String industry, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.companyName = companyName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.companyWebsite = companyWebsite;
		this.industry = industry;
		this.password = password;
	}

	public Recruiter() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Recruiter [id=" + id + ", fullName=" + fullName + ", companyName=" + companyName + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", companyWebsite=" + companyWebsite + ", industry=" + industry
				+ ", password=" + password + "]";
	}
    
    

}