package com.jobConnect.controller;

import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.entity.Education;
import com.jobConnect.entity.Experience;
import com.jobConnect.service.CandidatesService; // Assuming you have this service
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable; // To handle path variables
import org.springframework.web.bind.annotation.PostMapping;
import com.jobConnect.entity.JobPost;
import com.jobConnect.entity.ProfilePic;
import com.jobConnect.entity.Resume;
import com.jobConnect.service.JobPostService;
import com.jobConnect.service.ProfilePicService;
import com.jobConnect.service.ResumeService;
@Controller
public class CandidateController {

    @Autowired
    private CandidatesService candidateService; 
    
    @Autowired
    private JobPostService jobPostService; 
    
    @Autowired
    private ProfilePicService profilePicService;
    
    @Autowired
    private ResumeService resumeService;
    
    @GetMapping("/candidate/profile")
    public String showProfile(Model model, HttpSession session) {
        // Get the candidate ID from the session
        Long candidateId = (Long) session.getAttribute("loggedInCandidateId");

        if (candidateId == null) {
            return "redirect:/"; 
        }

        // Fetch candidate details (if needed for other profile info)
        CandidatesDetails candidate = candidateService.getCandidateById(candidateId);
        if (candidate == null) {
            return "redirect:/"; // Redirect if candidate is not found
        }

        // Initialize the default profile picture path
        String profilePicPath = "/uploads/photos/default-picture.png";

        // Check if a profile picture exists in the ProfilePic table for this candidate ID
        ProfilePic profilePic = profilePicService.getProfilePicByCandidateId(candidateId);
        if (profilePic != null && profilePic.getProfilePicPath() != null) {
            // Use the profile picture path from ProfilePic table
            profilePicPath = "/uploads/photos/" + profilePic.getProfilePicPath();
        }
        
        

        // Default resume path to null
        String resumePath = null;

        // Fetch the resume for the candidate
        Resume resume = resumeService.getResumeByCandidateId(candidateId);
        if (resume != null && resume.getResume_name() != null) {
            // Assuming resume files are saved in a directory named "uploads/files"
            resumePath = "/uploads/files/" + resume.getResume_name();
        }
        
        // Add candidate details and profilePicPath to the model
        model.addAttribute("candidate", candidate);
        model.addAttribute("profilePicPath", profilePicPath);
        model.addAttribute("resumePath", resumePath); // Pass the resume path

        return "candidateProfile"; // Render the JSP page
    }


    
    
    
    @GetMapping("/candidate/profile/updateCandidate/{id}")
    public String showUpdateForm(@PathVariable("id") Long candidateId, Model model, HttpSession session) {
        // Ensure the candidate is logged in by checking the session
        CandidatesDetails loggedInCandidate = (CandidatesDetails) session.getAttribute("loggedInCandidate");

        if (loggedInCandidate == null) {
            return "redirect:/"; 
        }

        CandidatesDetails candidate = candidateService.getCandidateById(candidateId);

        if (candidate == null) {
            return "redirect:/candidate/profile"; 
        }

        model.addAttribute("candidate", candidate);  
        return "candidateprofileupdate"; 
    }
    


    
    @PostMapping("/candidate/profile/updateCandidate")
    public String updateCandidateProfile(CandidatesDetails updatedCandidate, HttpSession session, Model model) {
        CandidatesDetails loggedInCandidate = (CandidatesDetails) session.getAttribute("loggedInCandidate");

        if (loggedInCandidate == null) {
            return "redirect:/";  
        }
       
        CandidatesDetails existingCandidate = candidateService.getCandidateById(loggedInCandidate.getId());

        existingCandidate.setName(updatedCandidate.getName());
        existingCandidate.setEmail(updatedCandidate.getEmail());
        existingCandidate.setPhone(updatedCandidate.getPhone());
        existingCandidate.setAddress(updatedCandidate.getAddress());
        existingCandidate.setHighestQualification(updatedCandidate.getHighestQualification());
        existingCandidate.setDob(updatedCandidate.getDob());
        existingCandidate.setGender(updatedCandidate.getGender());
        existingCandidate.setSkills(updatedCandidate.getSkills());
        existingCandidate.setPassword(updatedCandidate.getPassword());
        
        updateCollection(existingCandidate.getEducation(), updatedCandidate.getEducation(), existingCandidate);

        updateCollection(existingCandidate.getExperience(), updatedCandidate.getExperience(), existingCandidate);

        CandidatesDetails updated = candidateService.updateCandidate(existingCandidate);

        session.setAttribute("loggedInCandidate", updated);

        model.addAttribute("candidate", updated);
        model.addAttribute("educations", updated.getEducation());
        model.addAttribute("experiences", updated.getExperience());

        return "redirect:/candidate/profile";
    }
    
    private <T> void updateCollection(List<T> existingCollection, List<T> updatedCollection, CandidatesDetails candidate) {
        if (updatedCollection == null || updatedCollection.isEmpty()) {
            existingCollection.clear(); 
        } else {
            existingCollection.clear();
            for (T updatedEntity : updatedCollection) {
                if (updatedEntity instanceof Education) {
                    ((Education) updatedEntity).setCandidate(candidate);
                } else if (updatedEntity instanceof Experience) {
                    ((Experience) updatedEntity).setCandidate(candidate);
                } 
                existingCollection.add(updatedEntity); 
            }
        }        
        
    }
   

    @GetMapping("/candidate-dashboard")
    public String showCandidateDashboard(Model model) {
        List<JobPost> jobPosts = jobPostService.getAllJobPosts(); 
        model.addAttribute("jobPosts", jobPosts);
        return "candidatedashboard";
    }
}