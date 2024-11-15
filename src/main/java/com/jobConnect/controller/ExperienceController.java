package com.jobConnect.controller;

import com.jobConnect.entity.Experience;
import com.jobConnect.service.ExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RestController
@RequestMapping("/candidate/experience")
public class ExperienceController {

    @Autowired
    private ExperienceService experienceService;

    // Add a new experience for a candidate
    @PostMapping("/add")
    public String addExperience(@RequestBody Experience experience) {
        experienceService.addExperience(experience);
        return "Experience added successfully!";
    }

    // Get all experience details for a specific candidate
    @GetMapping("/{candidateId}")
    public List<Experience> getExperienceByCandidateId(@PathVariable Long candidateId) {
        return experienceService.getAllExperienceByCandidateId(candidateId);
    }

    // Delete an experience record by its ID
    @DeleteMapping("/delete/{id}")
    public String deleteExperience(@PathVariable Long id) {
        experienceService.deleteExperience(id);
        return "Experience deleted successfully!";
    }
}
