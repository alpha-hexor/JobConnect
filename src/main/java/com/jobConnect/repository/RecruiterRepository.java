package com.jobConnect.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jobConnect.entity.Recruiter;

public interface RecruiterRepository extends JpaRepository<Recruiter, Long>{
	 boolean existsByEmail(String email);
	 Recruiter findByEmailAndPassword(String email, String password);
	 Recruiter findByEmail(String email);
}
