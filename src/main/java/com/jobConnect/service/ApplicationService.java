package com.jobConnect.service;
import com.jobConnect.exception.ResourceNotFoundException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.Application;
import com.jobConnect.repository.ApplicationRepository;

import jakarta.transaction.Transactional;


@Service
public class ApplicationService {

	@Autowired
	private ApplicationRepository applicationRepository;
	public void saveApplication(Application application) {
		applicationRepository.save(application); 
	}

	
	public boolean hasCandidateAppliedForJob(Long candidateId, Long jobPostId) {
	    return applicationRepository.existsByCandidateIdAndJobPostId(candidateId, jobPostId);
	}
	
	public List<Application> findApplicationsByRecruiterId(Long recruiterId) {
	    return applicationRepository.findByRecruiterId(recruiterId);
	}

	public List<Application> findApplicationsByCandidateId(Long candidateId) {
	    return applicationRepository.findByCandidateId(candidateId);
	}
	
	 @Transactional
	    public void deleteApplication(Long applicationId) {
	        applicationRepository.deleteById(applicationId); // Deletes the application by ID
	    }
	 
	 public void updateApplicationStatus(Long applicationId, String status) {
		    Application application = applicationRepository.findById(applicationId)
		            .orElseThrow(() -> new ResourceNotFoundException("Application not found with id: " + applicationId));
		    application.setStatus(status);
		    applicationRepository.save(application);
		}
	 public List<Application> getAllApplications() {
	        return applicationRepository.findAll();
	    }
}
