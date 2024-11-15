package com.jobConnect.controller;

import com.jobConnect.entity.Admin;
import com.jobConnect.entity.Application;
import com.jobConnect.entity.Recruiter;
import com.jobConnect.service.AdminService;
import com.jobConnect.service.AllRecruiterService;
import com.jobConnect.service.ApplicationService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
    
    @Autowired
    private AdminService adminService; // Injecting the service
    
    @Autowired
    private ApplicationService applicationService; // Injecting the service

    @PostMapping("/adminRegister")
    public ModelAndView registerAdmin(@ModelAttribute Admin admin) {
        ModelAndView modelAndView = new ModelAndView("admindashboard");

        try {
            Admin registeredAdmin = adminService.register(admin);
            modelAndView.addObject("success", true);
        } catch (IllegalArgumentException e) {
            modelAndView.addObject("emailError", true);
        }       
        return modelAndView;
    }
    
    @GetMapping("/admin/all-applications")
    public String viewAllApplications(Model model) {
        List<Application> applications = applicationService.getAllApplications(); // Get all applications
        model.addAttribute("applications", applications); // Add applications to model
        return "allapplications"; // JSP page name
    }

   
}
