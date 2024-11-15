package com.jobConnect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jobConnect.entity.CandidatesDetails;
import com.jobConnect.service.AllCandidatesService;

@Controller
public class AllCandidatesController {

    @Autowired
    private AllCandidatesService allCandidatesService; 

    @GetMapping("/admin/candidates")
    public String showAllCandidates(Model model) {
        try {
            List<CandidatesDetails> allCandidates = allCandidatesService.getAllCandidates();
            System.out.println("Candidates: " + allCandidates);
            model.addAttribute("candidates_value", allCandidates);
            return "allcandidates"; 
        } catch (Exception e) {
            System.err.println("Error while fetching candidates: " + e.getMessage());
            e.printStackTrace();   
            return "error";   
        }
    }    
    
    @PostMapping("/admin/deleteCandidate")
    public String deleteCandidate(@RequestParam Long candidateId) {
        allCandidatesService.removeCandidate(candidateId);
        return "allcandidates"; 
    }
    
    
   
}
