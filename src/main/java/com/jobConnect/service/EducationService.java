package com.jobConnect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.Education;
import com.jobConnect.repository.EducationRepository;

@Service
public class EducationService {

	@Autowired
	private EducationRepository educationRepository;

	public void addEducation(Education education) {
		educationRepository.save(education);
	}

	public void deleteEducation(Long id) {
		educationRepository.deleteById(id);
	}
	
	public List<Education> getAllEducationByCandidateId(Long candidateId) {
        return educationRepository.findByCandidateId(candidateId);
    }

}
