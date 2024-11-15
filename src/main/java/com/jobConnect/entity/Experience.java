package com.jobConnect.entity;

import jakarta.persistence.*;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "work_experience")
public class Experience {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "company_name", nullable = false)
    private String companyName;

    @Column(name = "role", nullable = false)
    private String role;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "start_date")
    @Temporal(TemporalType.DATE)
    private Date startDate;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;

    @ManyToOne
    @JoinColumn(name = "candidate_id", nullable = false)
    private CandidatesDetails candidate;

    // Constructors
    public Experience() {}

    public Experience(String companyName, String role, Date startDate, Date endDate, CandidatesDetails candidate) {
        this.companyName = companyName;
        this.role = role;
        this.startDate = startDate;
        this.endDate = endDate;
        this.candidate = candidate;
    }

    // Getters and Setters
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public CandidatesDetails getCandidate() {
        return candidate;
    }

    public void setCandidate(CandidatesDetails candidate) {
        this.candidate = candidate;
    }
}
