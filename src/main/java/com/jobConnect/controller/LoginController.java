package com.jobConnect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jobConnect.entity.Admin;
import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.entity.JobPost;
import com.jobConnect.entity.Recruiter;
import com.jobConnect.service.AdminService;
import com.jobConnect.service.CandidatesService;
import com.jobConnect.service.JobPostService;
import com.jobConnect.service.RecruiterService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	 @Autowired
	 private JobPostService jobPostService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private CandidatesService candidatesService;

    @Autowired
    private RecruiterService recruiterService; 
    
    @PostMapping("/login")
    public String login(String email, String password, String role, Model model, HttpSession session) {
        try {
          
          
            if (role.equalsIgnoreCase("admin")) {
                Admin admin = adminService.login(email, password);
                if (admin != null) {
                    session.setAttribute("loggedInAdmin", admin);
                    return "redirect:/admin/dashboard";
                } else {
                    model.addAttribute("error", "Invalid admin credentials.");
                }
            }

         
            else if (role.equalsIgnoreCase("candidate")) {
                CandidatesDetails candidate = candidatesService.login(email, password);
                if (candidate != null) {
                    session.setAttribute("loggedInCandidate", candidate);
                    session.setAttribute("loggedInCandidateId", candidate.getId()); // Add candidate ID to session
                    return "redirect:/candidate/dashboard";
                } else {
                    model.addAttribute("error", "Invalid candidate credentials.");
                }
            }

        
            else if (role.equalsIgnoreCase("recruiter")) {
                Recruiter recruiter = recruiterService.login(email, password);
                if (recruiter != null) {
                    session.setAttribute("loggedInRecruiter", recruiter);
                    return "redirect:/recruiter/dashboard";
                } else {
                    model.addAttribute("error", "Invalid recruiter credentials.");
                }
            }

           
            else {
                model.addAttribute("error", "Invalid role selected. Please choose a valid role.");
            }
            return "index";

        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "index";
        }
    }


    // Admin Dashboard
    @GetMapping("/admin/dashboard")
    public String adminDashboard(Model model) {
        // Add logic to retrieve admin info if needed
        return "admindashboard"; // Ensure this resolves to the correct JSP path
    }

    // Candidate Dashboard
    @GetMapping("/candidate/dashboard")
    public String candidateDashboard(Model model) {
    	List<JobPost> jobPosts = jobPostService.getAllJobPosts(); // Fetch job posts from the service
        model.addAttribute("jobPosts", jobPosts);
        return "candidatedashboard"; // Ensure this resolves to the correct JSP path
    }
    
    // Recruiter Dashboard
    @GetMapping("/recruiter/dashboard")
    public String recruiterDashboard(Model model) {
        
        return "recruiterdashboard"; 
    }
    
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Get session if it exists
        if (session != null) {
            session.invalidate(); // Invalidate the session to log out
        }
        return "redirect:/"; // Redirect to home or login page
    }
}




