package com.jobConnect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.JobRole;
import com.jobConnect.repository.JobRolesRepository;

@Service
public class JobRoleService {

    @Autowired
    private JobRolesRepository jobRolesRepository;

    public List<JobRole> getAllJobRoles() {
        return jobRolesRepository.findAll();
    }

    public JobRole getJobRoleById(Long id) {
        return jobRolesRepository.findById(id).orElse(null);
    }

    public void saveJobRole(JobRole jobRole) {
        jobRolesRepository.save(jobRole);
    }

    public void deleteJobRole(Long id) {
        jobRolesRepository.deleteById(id);
    }

    public List<JobRole> searchJobRoles(String searchTerm) {
        // Assuming the repository has a method to search job roles by name
        return jobRolesRepository.findByJobroleContainingIgnoreCase(searchTerm);
    }
}