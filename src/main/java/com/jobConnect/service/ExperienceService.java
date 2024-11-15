package com.jobConnect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.Experience;

import com.jobConnect.repository.ExperienceRepository;

@Service
public class ExperienceService {

	@Autowired
	private ExperienceRepository experienceRepository;
	
	public void addExperience(Experience experience) {
		experienceRepository.save(experience);
	}
	
	public void deleteExperience(Long id) {
		experienceRepository.deleteById(id);
	}
	
	 public List<Experience> getAllExperienceByCandidateId(Long candidateId) {
	        return experienceRepository.findByCandidateId(candidateId);
	    }
}
