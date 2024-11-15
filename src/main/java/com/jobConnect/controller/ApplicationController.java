package com.jobConnect.controller;
import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jobConnect.entity.Application;
import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.entity.JobPost;
import com.jobConnect.entity.Recruiter;
import com.jobConnect.service.ApplicationService;
import com.jobConnect.service.JobPostService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/candidate/dashboard")
public class ApplicationController {	  

    @Autowired
    private ApplicationService applicationService;
    
    @Autowired
    private JobPostService jobPostService;

    @PostMapping("/apply-job")
    public String applyForJob(Long jobPostId, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        try {
            CandidatesDetails candidate = (CandidatesDetails) session.getAttribute("loggedInCandidate");
            if (candidate == null) {
                redirectAttributes.addFlashAttribute("error", "Please log in as a candidate to apply.");
                return "redirect:/";  
            }

            Long candidateId = candidate.getId();
            boolean alreadyApplied = applicationService.hasCandidateAppliedForJob(candidateId, jobPostId);
            if (alreadyApplied) {
                redirectAttributes.addFlashAttribute("error", "You have already applied for this job.");
                return "redirect:/candidate/dashboard";
            }

            JobPost jobPost = jobPostService.getJobPostById(jobPostId);
            if (jobPost == null) {
                redirectAttributes.addFlashAttribute("error", "Job post not found.");
                return "redirect:/candidate/dashboard";
            }

            Application application = new Application();
            application.setCandidateId(candidateId);
            application.setName(candidate.getName());
            application.setCompany_name(jobPost.getCompanyName());
            application.setRole(jobPost.getJobRole());
            application.setJobPostId(jobPostId);
            application.setRecruiterId(jobPost.getRecruiter().getId());
            application.setStatus("Applied");
            application.setAppliedDate(new Date());

            applicationService.saveApplication(application);
            redirectAttributes.addFlashAttribute("message", "Application submitted successfully.");
            return "redirect:/candidate/dashboard";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "An error occurred while submitting the application.");
            return "redirect:/candidate/dashboard";
        }
    }




    @GetMapping("/view-my-applications")
       public String viewMyApplications(HttpSession session, Model model) {
           CandidatesDetails candidate = (CandidatesDetails) session.getAttribute("loggedInCandidate");
           if (candidate == null) {
               return "redirect:/"; // Redirect to login if candidate is not logged in
           }

           Long candidateId = candidate.getId();
           List<Application> applications = applicationService.findApplicationsByCandidateId(candidateId);
           model.addAttribute("applications", applications);

           return "candidateAppliedJob"; // Your JSP file to display applications
       }


    @PostMapping("/delete-application")
    public String deleteApplication(@RequestParam Long applicationId, RedirectAttributes redirectAttributes) {
        try {
            applicationService.deleteApplication(applicationId);
            redirectAttributes.addFlashAttribute("message", "Application deleted successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error occurred while deleting the application.");
        }
        return "redirect:/candidate/dashboard/view-my-applications";
    }
    


    
}
