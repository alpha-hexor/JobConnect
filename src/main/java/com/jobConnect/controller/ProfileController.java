package com.jobConnect.controller;

import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.entity.ProfilePic;
import com.jobConnect.service.CandidatesService;

import com.jobConnect.service.ProfilePicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class ProfileController {

    private static final String UPLOAD_DIRECTORY = "C:\\uploads\\photos";

    @Autowired
    private ProfilePicService profilePicService;

    @Autowired
    private CandidatesService candidateService;

    @PostMapping("/candidate/updateProfilePicture")
    public String updateProfilePicture(@RequestParam("profilePic") MultipartFile file,
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

            // Update ProfilePic in the database
            ProfilePic profilePic = profilePicService.getProfilePicByCandidateId(candidateId);
            if (profilePic == null) {
                profilePic = new ProfilePic();
                CandidatesDetails candidate = candidateService.getCandidateById(candidateId);
                profilePic.setCandidate(candidate);
            }
            profilePic.setProfilePicPath(fileName);
            profilePicService.saveProfilePic(profilePic);

            redirectAttributes.addFlashAttribute("message", "Profile picture updated successfully.");
        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "File upload failed.");
        }

        return "redirect:/candidate/profile";
    }
}
