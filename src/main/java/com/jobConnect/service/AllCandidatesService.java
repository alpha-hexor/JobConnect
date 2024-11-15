package com.jobConnect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.repository.AllCandidatesRepository;

@Service
public class AllCandidatesService {
	
	@Autowired
	private AllCandidatesRepository allCandidatesRepository;
	
	public List<CandidatesDetails> getAllCandidates() {
        return allCandidatesRepository.findAll();
    }
	
	public void addCandidate(CandidatesDetails candidate) {
		allCandidatesRepository.save(candidate);
    }

	public CandidatesDetails getRecruiterById(Long id) {
        return allCandidatesRepository.findById(id).orElse(null);
    }

    public void removeCandidate(Long candidateId) {
    	allCandidatesRepository.deleteById(candidateId);
    }
	
}
