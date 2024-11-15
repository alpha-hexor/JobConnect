package com.jobConnect.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jobConnect.entity.JobRole;

public interface JobRolesRepository extends JpaRepository<JobRole, Long>{
	
	List<JobRole> findByJobroleContainingIgnoreCase(String jobrole);
}
