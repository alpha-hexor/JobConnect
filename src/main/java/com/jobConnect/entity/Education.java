package com.jobConnect.entity;

import jakarta.persistence.*;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "education")
public class Education {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "institution_name", nullable = false)
    private String institutionName;

    @Column(name = "degree", nullable = false)
    private String degree;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "start_year")
    @Temporal(TemporalType.DATE)
    private Date startYear;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "end_year")
    @Temporal(TemporalType.DATE)
    private Date endYear;

    @ManyToOne
    @JoinColumn(name = "candidate_id", nullable = false)
    private CandidatesDetails candidate;

    // Constructors
    public Education() {}

    public Education(String institutionName, String degree, Date startYear, Date endYear, CandidatesDetails candidate) {
        this.institutionName = institutionName;
        this.degree = degree;
        this.startYear = startYear;
        this.endYear = endYear;
        this.candidate = candidate;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public Date getStartYear() {
        return startYear;
    }

    public void setStartYear(Date startYear) {
        this.startYear = startYear;
    }

    public Date getEndYear() {
        return endYear;
    }

    public void setEndYear(Date endYear) {
        this.endYear = endYear;
    }

    public CandidatesDetails getCandidate() {
        return candidate;
    }

    public void setCandidate(CandidatesDetails candidate) {
        this.candidate = candidate;
    }
}
