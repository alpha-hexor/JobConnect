package com.jobConnect.service;
import com.jobConnect.entity.ProfilePic;
import com.jobConnect.repository.ProfilePicRepository;
import com.jobConnect.service.ProfilePicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfilePicService {
	 @Autowired
	    private ProfilePicRepository profilePicRepository;


	    public ProfilePic getProfilePicByCandidateId(Long candidateId) {
	        return profilePicRepository.findByCandidateId(candidateId).orElse(null);
	    }


	    public ProfilePic saveProfilePic(ProfilePic profilePic) {
	        return profilePicRepository.save(profilePic);
	    }
	}

