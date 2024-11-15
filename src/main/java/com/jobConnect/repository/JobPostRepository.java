package com.jobConnect.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.jobConnect.entity.JobPost;

public interface JobPostRepository extends JpaRepository<JobPost, Long> {
	void deleteByLastDateBefore(java.util.Date today);
	List<JobPost> findByRecruiterId(Long recruiterId);
}