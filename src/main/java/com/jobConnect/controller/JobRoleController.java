package com.jobConnect.controller;

import com.jobConnect.entity.JobRole;
import com.jobConnect.repository.JobRolesRepository;
import com.jobConnect.service.JobRoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class JobRoleController {

    @Autowired
    private JobRoleService jobRoleService;
    
//  @GetMapping("/admin/jobroles")
//  public String showAllJobs() {
//      return "alljobroles"; 
//  }

    @GetMapping("/admin/jobroles")
    public String listJobRoles(Model model) {
        try {
            List<JobRole> jobRoles = jobRoleService.getAllJobRoles();
            System.out.println("Job Roles: " + jobRoles);
            model.addAttribute("jobRoles", jobRoles);
            return "alljobroles"; 
        } catch (Exception e) {
            System.err.println("Error while fetching job roles: " + e.getMessage());
            e.printStackTrace();
            
            return "error"; 
        }
    }
    

    @PostMapping("/postJobRole")
    public String postJobRole(JobRole jobRole, RedirectAttributes redirectAttributes) {
        jobRoleService.saveJobRole(jobRole);
        
        // Set success message
        redirectAttributes.addFlashAttribute("success_job_post", true);
        
        return "redirect:/admin/dashboard"; 
    }


    @PostMapping("/admin/deleteJobRole")
    public String deleteJobRole(@RequestParam Long jobRoleId) {
        jobRoleService.deleteJobRole(jobRoleId);
        return "alljobroles"; // Redirect to the job roles list after deletion
    }
    
    
    
    

   
}
