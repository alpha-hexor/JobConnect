package com.jobConnect.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jobConnect.entity.CandidatesDetails;

public interface AllCandidatesRepository extends JpaRepository<CandidatesDetails, Long>{

}
