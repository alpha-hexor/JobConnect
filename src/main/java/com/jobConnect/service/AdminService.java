package com.jobConnect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.Admin;
import com.jobConnect.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public Admin register(Admin admin) {
        // Check if the email already exists
        if (adminRepository.existsByEmail(admin.getEmail())) {
            throw new IllegalArgumentException("Email already exists");
        }
        return adminRepository.save(admin);
    }

    public Admin login(String email, String password) {
        Admin admin = adminRepository.findByEmailAndPassword(email, password);
        if (admin == null) {
            throw new IllegalArgumentException("Wrong email or password.");
        }
        return admin; // Return admin details if successful
    }
}
