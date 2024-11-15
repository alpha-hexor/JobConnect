package com.jobConnect.controller;

import com.jobConnect.entity.Education;
import com.jobConnect.service.EducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/candidate/education")
public class EducationController {

    @Autowired
    private EducationService educationService;

    // Add a new education for a candidate
    @PostMapping("/add")
    public String addEducation(@RequestBody Education education) {
        educationService.addEducation(education);
        return "Education added successfully!";
    }

    // Get all education details for a specific candidate
    @GetMapping("/{candidateId}")
    public List<Education> getEducationByCandidateId(@PathVariable Long candidateId) {
        return educationService.getAllEducationByCandidateId(candidateId);
    }

    // Delete an education record by its ID
    @DeleteMapping("/delete/{id}")
    public String deleteEducation(@PathVariable Long id) {
        educationService.deleteEducation(id);
        return "Education deleted successfully!";
    }
}
