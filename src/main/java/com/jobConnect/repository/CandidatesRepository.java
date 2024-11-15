package com.jobConnect.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jobConnect.entity.CandidatesDetails;

@Repository
public interface CandidatesRepository extends JpaRepository<CandidatesDetails, Long> {
	boolean existsByEmail(String email);
	CandidatesDetails findByEmailAndPassword(String email, String password);
	CandidatesDetails findByEmail(String email); 
	CandidatesDetails getCandidateById(Long Id); 
}
