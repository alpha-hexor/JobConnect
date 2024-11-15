package com.jobConnect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jobConnect.entity.Application;
import com.jobConnect.entity.JobRole;
import com.jobConnect.entity.Recruiter;
import com.jobConnect.service.ApplicationService;
import com.jobConnect.service.JobRoleService;

import jakarta.servlet.http.HttpSession;
@Controller
public class RecruiterJobPostContoller {
	
	@Autowired
	private JobRoleService jobRoleService;
	@Autowired
    private ApplicationService applicationService;

	@GetMapping("/recruiter/jobroles/postjob")
	public String listJobRoles(Model model) {
	    try {
	        List<JobRole> jobRoles = jobRoleService.getAllJobRoles();
	        model.addAttribute("jobRoles", jobRoles);
	        return "recruiter_jobpost"; 
	    } catch (Exception e) {
	        System.err.println("Error while fetching job roles: " + e.getMessage());
	        e.printStackTrace();
	        return "error"; 
	    }
	}
	
    @GetMapping("/recruiter/view-applicants")
    public String viewApplicants(HttpSession session, Model model) {
        Recruiter recruiter = (Recruiter) session.getAttribute("loggedInRecruiter");
        if (recruiter == null) {
            return "redirect:/"; // Redirect to login if not logged in
        }

        Long recruiterId = recruiter.getId();
        List<Application> applications = applicationService.findApplicationsByRecruiterId(recruiterId);
        model.addAttribute("applications", applications);

        return "recruiter_view_all_application"; // Your JSP file to display applicants
    }

    @PostMapping("/recruiter/dashboard/update-status")
    public String updateApplicationStatus(@RequestParam("applicationId") Long applicationId,
                                          @RequestParam("status") String status,
                                          Model model) {
        try {
            applicationService.updateApplicationStatus(applicationId, status);
            model.addAttribute("message", "Application status updated successfully.");
        } catch (Exception e) {
            model.addAttribute("error", "Error updating application status: " + e.getMessage());
        }
        return "redirect:/recruiter/view-applicants"; // Redirect back to the applicants view
    }


	
}
