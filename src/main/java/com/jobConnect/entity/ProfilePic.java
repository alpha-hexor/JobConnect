package com.jobConnect.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "ProfilePic")
public class ProfilePic {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "candidate_id")
    private CandidatesDetails candidate;

    private String profilePicPath; // Store the image file name here

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public CandidatesDetails getCandidate() {
		return candidate;
	}

	public void setCandidate(CandidatesDetails candidate) {
		this.candidate = candidate;
	}

	public String getProfilePicPath() {
		return profilePicPath;
	}

	public void setProfilePicPath(String profilePicPath) {
		this.profilePicPath = profilePicPath;
	}
    
    
	
}
