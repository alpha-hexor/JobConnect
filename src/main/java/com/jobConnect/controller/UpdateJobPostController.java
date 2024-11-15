package com.jobConnect.controller;

import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.entity.JobPost;
import com.jobConnect.entity.ProfilePic;
import com.jobConnect.entity.Recruiter;
import com.jobConnect.entity.Resume;
import com.jobConnect.exception.ResourceNotFoundException;
import com.jobConnect.service.CandidatesService;
import com.jobConnect.service.JobPostService;
import com.jobConnect.service.ProfilePicService;
import com.jobConnect.service.ResumeService;

@Controller
@RequestMapping("/recruiter")
public class UpdateJobPostController {
    
    @Autowired
    private JobPostService jobPostService;
    
    @Autowired
    private ProfilePicService profilePicService;
    @Autowired
    private CandidatesService candidateService;
    @Autowired
    private ResumeService resumeService;
    
    @GetMapping("/view-my-jobposts")
    public String viewMyJobPosts(Model model, HttpSession session) {
        Recruiter recruiter = (Recruiter) session.getAttribute("loggedInRecruiter");
        
        if (recruiter != null) {
            
            model.addAttribute("jobPosts", jobPostService.getJobPostsByRecruiter(recruiter.getId()));
        } else {
            
            return "redirect:/";
        }

        return "updatejobpost";
    }
    
    @GetMapping("/delete-jobpost")
    public String deleteJobPost(@RequestParam("id") Long jobId) {
        jobPostService.deleteJobPost(jobId);
        return "redirect:/recruiter/view-my-jobposts";  // Redirect to the updated list
    }
    
    @GetMapping("/view-candidate-profile")
    public String viewCandidateProfile(@RequestParam("candidateId") Long candidateId, Model model) {
        // Fetch candidate details using the candidateId
        CandidatesDetails candidate = candidateService.getCandidateById(candidateId);
        if (candidate == null) {
            throw new ResourceNotFoundException("Candidate not found with id: " + candidateId);
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
        
        // Return the view for the recruiter to see the candidate's profile
        return "candidateProfileViewByRecruiter"; // This should be the name of your JSP file
    }



}
