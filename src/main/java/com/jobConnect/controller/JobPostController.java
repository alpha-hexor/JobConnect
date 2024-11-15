package com.jobConnect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jobConnect.entity.JobPost;
import com.jobConnect.entity.Recruiter;
import com.jobConnect.service.JobPostService;

import jakarta.servlet.http.HttpSession;

import javax.validation.Valid;
import java.io.IOException;

@Controller
@RequestMapping("/recruiter")
public class JobPostController {

    @Autowired
    private JobPostService jobPostService;
    
//    @GetMapping("/post-job")
//    public String showJobPostForm(Model model) {
//        model.addAttribute("jobPost", new JobPost()); // Changed to match the model attribute name
//        return "recruiter_jobpost";  // Return the view (post-job.html or post-job.jsp)
//    }

    @PostMapping("/create-job")
    public String submitJobPost(@Valid @ModelAttribute("jobPost") JobPost jobPost,
                                BindingResult result,
                                @RequestParam("companyLogo") MultipartFile companyLogo, 
                                Model model,
                                HttpSession session) throws IOException {

        Recruiter recruiter = (Recruiter) session.getAttribute("loggedInRecruiter");
        if (recruiter == null) {
            model.addAttribute("error", "Recruiter not found in session");
            return "redirect:/"; // Redirect to login page or handle as needed
        }

        jobPost.setRecruiter(recruiter); // Associate the job post with the logged-in recruiter
        if (result.hasErrors()) {
            result.getAllErrors().forEach(error -> {
                System.out.println("Validation error: " + error.toString());
            });
            
        }

        // Save the job post if no validation errors
        jobPostService.createJobPost(jobPost, companyLogo,session);
        session.setAttribute("successMessage", "Job posted successfully!");
        return "redirect:/recruiter/jobroles/postjob"; // Redirect after successful creation
    }

}
