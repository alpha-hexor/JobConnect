package com.jobConnect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.Recruiter;
import com.jobConnect.repository.RecruiterRepository;

@Service
public class RecruiterService {
	
	@Autowired
	private RecruiterRepository recruiterRepository;
	
	public Recruiter register(Recruiter recruiter) {
        
        if (recruiterRepository.existsByEmail(recruiter.getEmail())) {
            throw new IllegalArgumentException("Email already exists");
        }
        return recruiterRepository.save(recruiter);
    }
	
	public Recruiter login(String email, String password) {
		Recruiter recruiter = recruiterRepository.findByEmailAndPassword(email, password);
        if (recruiter == null) {
            throw new IllegalArgumentException("Wrong email or password.");
        }
        return recruiter; 
    }
	
	
}
