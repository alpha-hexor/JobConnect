package com.jobConnect.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jobConnect.entity.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
    boolean existsByEmail(String email);
    Admin findByEmailAndPassword(String email, String password);
    Admin findByEmail(String email);
}
