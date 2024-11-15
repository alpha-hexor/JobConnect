package com.jobConnect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


import com.jobConnect.entity.Recruiter;
import com.jobConnect.service.RecruiterService;

@Controller

public class RecruiterController {
	
	@Autowired
	private RecruiterService recruiterService;
	
	@PostMapping("/registerRecruiter")
	public ModelAndView registerRecruiter(@ModelAttribute Recruiter recruiter) {
		ModelAndView modelAndView = new ModelAndView("index");
		
		try {
			Recruiter registeredRecruiter = recruiterService.register(recruiter);
			  modelAndView.addObject("success", true);
		} catch(IllegalArgumentException e) {
			 modelAndView.addObject("emailError", true);
		}
		return modelAndView;
    }
	
	 @GetMapping("/recruiter/postjob")
	 public String PostJob() {
		 return "recruiter_jobpost";
	 }
}
	

