package com.jobConnect.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.entity.Education;
import com.jobConnect.entity.Experience;
import com.jobConnect.repository.CandidatesRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class CandidatesService {

    @Autowired
    private CandidatesRepository candidatesRepository;
    
    
    public CandidatesDetails register(CandidatesDetails candidate) {
        // Check if the email already exists
        if (candidatesRepository.existsByEmail(candidate.getEmail())) {
            throw new IllegalArgumentException("Email already exists");
        }
        
        return candidatesRepository.save(candidate);
    }
    
    public CandidatesDetails login(String email, String password) {
        CandidatesDetails candidate = candidatesRepository.findByEmailAndPassword(email, password);
        if (candidate == null) {
            throw new IllegalArgumentException("Wrong email or password.");
        }
        return candidate; // Return candidate details if successful
    }
    
    public CandidatesDetails getCandidateById(Long id) {
        return candidatesRepository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Candidate not found with id: " + id));
    }
    
  public CandidatesDetails updateCandidate(CandidatesDetails updatedCandidate) {
  return candidatesRepository.save(updatedCandidate);
}
  

  public String saveFile(MultipartFile file, String targetDirectory) throws IOException {
      Path targetLocation = Path.of(targetDirectory, file.getOriginalFilename());
      Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
      return targetLocation.toString(); // Return the file path
  }
  
  public CandidatesDetails findById(Long id) {
      return candidatesRepository.findById(id).orElse(null); // Fetch from database
  }

}