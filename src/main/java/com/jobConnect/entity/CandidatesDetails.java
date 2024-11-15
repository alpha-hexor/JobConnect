package com.jobConnect.entity;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;


import java.util.Date;
import java.util.List;
import org.springframework.web.multipart.MultipartFile; // Import for MultipartFile

@Entity
@Table(name = "candidates_details")
public class CandidatesDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "phone", nullable = false)
    private String phone;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "highest_qualification", nullable = false)
    private String highestQualification;

    @Column(name = "dob")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date dob;

    @Column(name = "gender", nullable = false)
    private String gender;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "role")
    private String role = "candidate";

    @Column(name = "skills")
    private String skills;
     
    
    @OneToMany(mappedBy = "candidate", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Education> education;
    
    // One-to-many relationship with Experience
    @OneToMany(mappedBy = "candidate", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Experience> experience;
    
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "profile_pic_id")
    private ProfilePic profilePic;



    
	public ProfilePic getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(ProfilePic profilePic) {
		this.profilePic = profilePic;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getHighestQualification() {
		return highestQualification;
	}

	public void setHighestQualification(String highestQualification) {
		this.highestQualification = highestQualification;
	}

	public Date getDob() {
		return dob;
	}


	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}


	public String getSkills() {
		return skills;
	}


	public void setSkills(String skills) {
		this.skills = skills;
	}


	public List<Education> getEducation() {
		return education;
	}


	public void setEducation(List<Education> education) {
		this.education = education;
	}


	public List<Experience> getExperience() {
		return experience;
	}


	public void setExperience(List<Experience> experience) {
		this.experience = experience;
	}



	public CandidatesDetails(Long id, String name, String email, String phone, String address,
			String highestQualification, Date dob, String gender, String password, String role, String skills,
			List<Education> education, List<Experience> experience, ProfilePic profilePic) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.highestQualification = highestQualification;
		this.dob = dob;
		this.gender = gender;
		this.password = password;
		this.role = role;
		this.skills = skills;
		this.education = education;
		this.experience = experience;
		this.profilePic = profilePic;
	}

	
	
	
	@Override
	public String toString() {
		return "CandidatesDetails [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", address="
				+ address + ", highestQualification=" + highestQualification + ", dob=" + dob + ", gender=" + gender
				+ ", password=" + password + ", role=" + role + ", skills=" + skills + ", education=" + education
				+ ", experience=" + experience + ", profilePic=" + profilePic + "]";
	}

	public CandidatesDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
    


    
}


