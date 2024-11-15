package com.jobConnect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.Recruiter;
import com.jobConnect.repository.AllRecruiterReposirory;


@Service
public class AllRecruiterService {
	
	@Autowired
	private AllRecruiterReposirory allRecruiterReposirory;
	
	 public List<Recruiter> getAllRecruiter() {
	        return allRecruiterReposirory.findAll();
	    }
	 public Recruiter getRecruiterById(Long id) {
	        return allRecruiterReposirory.findById(id).orElse(null);
	    }
	 public void saveRecruiter(Recruiter recruiter) {
		 allRecruiterReposirory.save(recruiter);
	    }

	    public void deleteRecruiter(Long id) {
	    	allRecruiterReposirory.deleteById(id);
	    }
}
