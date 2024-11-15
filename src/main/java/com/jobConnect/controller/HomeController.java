package com.jobConnect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.jobConnect.entity.Admin;
import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.service.CandidatesService;

@Controller
public class HomeController {

    @Autowired
    private CandidatesService candidatesService;

    @GetMapping("/")
    public String showHomePage() {
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @PostMapping("/registerCandidate")
    public ModelAndView registerCandidate(@ModelAttribute CandidatesDetails candidate) {
        ModelAndView modelAndView = new ModelAndView("index");
        
        try {
            CandidatesDetails registeredCandidate = candidatesService.register(candidate);
            modelAndView.addObject("success", true); // Registration successful
        } catch (IllegalArgumentException e) {
            modelAndView.addObject("emailError", true); // Email already exists
        }
        
        return modelAndView;
    }
    






}
