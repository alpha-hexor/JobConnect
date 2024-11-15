package com.jobConnect.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jobConnect.entity.Recruiter;
import com.jobConnect.service.AllRecruiterService;
import org.springframework.ui.Model;

@Controller
public class AllRecruiterControler {

    @Autowired
    private AllRecruiterService allRecruiterService; 

    @GetMapping("/admin/recruiter")
    public String showAllRecruiter(Model model) {
        try {
            List<Recruiter> allRecruiters = allRecruiterService.getAllRecruiter();
            System.out.println("Job Roles: " + allRecruiters);
            model.addAttribute("recruiter_value", allRecruiters);
            return "allrecruiter";
        } catch (Exception e) {
            System.err.println("Error while fetching job roles: " + e.getMessage());
            e.printStackTrace();   
            return "error";   
        }
    }    
    
    @PostMapping("/admin/deleteRecruiter")
    public String deleteJobRole(@RequestParam Long recruiterId) {
    	allRecruiterService.deleteRecruiter(recruiterId);
        return "allrecruiter"; 
    }
}
