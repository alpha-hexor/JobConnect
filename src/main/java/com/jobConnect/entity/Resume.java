package com.jobConnect.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Resume")
public class Resume {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

	@OneToOne
    @JoinColumn(name = "candidate_id")
    private CandidatesDetails candidate;
	
	private String resume_name; // Store the file name here

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

	public String getResume_name() {
		return resume_name;
	}

	public void setResume_name(String resume_name) {
		this.resume_name = resume_name;
	}

	public Resume(Long id, CandidatesDetails candidate, String resume_name) {
		super();
		this.id = id;
		this.candidate = candidate;
		this.resume_name = resume_name;
	}

	public Resume() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
