package com.jobConnect.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.entity.Resume;
import com.jobConnect.service.CandidatesService;
import com.jobConnect.service.ResumeService;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService resumeService;

	@Autowired
	private CandidatesService candidateService;

	private static final String UPLOAD_DIRECTORY = "C:\\uploads\\files";

	@PostMapping("/candidate/uploadResume")
	public String updateResume(@RequestParam("resumeFile") MultipartFile file, // Changed "resume" to "resumeFile"
	                           @RequestParam("candidateId") Long candidateId,
	                           RedirectAttributes redirectAttributes) {

	    if (file.isEmpty()) {
	        redirectAttributes.addFlashAttribute("message", "Please select a file to upload.");
	        return "redirect:/candidate/profile";
	    }

	    try {
	        // Ensure upload directory exists
	        File uploadDir = new File(UPLOAD_DIRECTORY);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }

	        // Save file to the upload directory
	        String fileName = candidateId + "_" + file.getOriginalFilename();
	        Path filePath = Paths.get(UPLOAD_DIRECTORY, fileName);
	        Files.write(filePath, file.getBytes());

	        // Update Resume in the database
	        Resume resume = resumeService.getResumeByCandidateId(candidateId);
	        if (resume == null) {
	            resume = new Resume();
	            CandidatesDetails candidate = candidateService.getCandidateById(candidateId);
	            resume.setCandidate(candidate);
	        }
	        resume.setResume_name(fileName);
	        resumeService.saveResume(resume);

	        redirectAttributes.addFlashAttribute("message", "Resume updated successfully.");
	    } catch (IOException e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("message", "File upload failed.");
	    }

	    return "redirect:/candidate/profile";
	}

}
