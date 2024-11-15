package com.jobConnect.service;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jobConnect.entity.JobPost;
import com.jobConnect.entity.Recruiter;
import com.jobConnect.repository.JobPostRepository;
import jakarta.transaction.Transactional;
import org.springframework.scheduling.annotation.Scheduled;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import jakarta.servlet.http.HttpSession;

@Service
public class JobPostService {

	@Autowired
	private JobPostRepository jobPostRepository;

//	@Autowired
//	private ResourceLoader resourceLoader;

	public void createJobPost(JobPost jobPost, MultipartFile companyLogo, HttpSession session) throws IOException {
		// Define an absolute directory path to store the uploaded files
		String uploadDir = "C:/uploads/";

		// Ensure the directory exists, create it if it doesn't
		File directory = new File(uploadDir);
		if (!directory.exists()) {
			if (directory.mkdirs()) {
				System.out.println("Upload directory created at: " + uploadDir);
			} else {
				System.out.println("Failed to create upload directory at: " + uploadDir);
				throw new IOException("Could not create upload directory");
			}
		}

		// Save the file if it's not empty
		if (!companyLogo.isEmpty()) {
			String filename = companyLogo.getOriginalFilename();
			File destinationFile = new File(uploadDir + filename);

			// Save the file to the target location
			try {
				companyLogo.transferTo(destinationFile); // Save the file to the folder
				jobPost.setCompanyLogo(filename); // Set the file name in the entity
				System.out.println("File uploaded successfully: " + destinationFile.getAbsolutePath());
			} catch (IOException e) {
				System.out.println("File upload failed: " + e.getMessage());
				throw e; // Re-throw exception for handling in the controller if needed
			}
		}

		// Get the logged-in recruiter from the session
		Recruiter recruiter = (Recruiter) session.getAttribute("loggedInRecruiter");
		if (recruiter != null) {
			jobPost.setRecruiter(recruiter);
		} else {
			throw new IllegalArgumentException("Recruiter not found in session");
		}

		jobPostRepository.save(jobPost);
	}

	public List<JobPost> getJobPostsByRecruiter(Long recruiterId) {
		return jobPostRepository.findByRecruiterId(recruiterId);
	}

	@Transactional
	public void deleteExpiredJobPosts() {
		Date today = new Date(); 
		jobPostRepository.deleteByLastDateBefore(today);
		System.out.println("Expired job posts deleted");
	}

	public List<JobPost> getAllJobPosts() {
		return jobPostRepository.findAll();
	}

//	 @Transactional
//	    public void updateJobPost(JobPost jobPost) {
//	        jobPostRepository.save(jobPost);
//	    }

	@Transactional
	public void deleteJobPost(Long jobId) {
		jobPostRepository.deleteById(jobId);
	}
	
	
	 public JobPost getJobPostById(Long id) {
	        return jobPostRepository.findById(id).orElse(null);
	    }

	// Schedule this method to run every day at midnight
	@Scheduled(cron = "0 0 0 * * ?") // Runs at midnight every day
	public void scheduleJobPostCleanup() {
		deleteExpiredJobPosts();
	}
}
