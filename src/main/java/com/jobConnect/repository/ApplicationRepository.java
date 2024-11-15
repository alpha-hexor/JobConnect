package com.jobConnect.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

import com.jobConnect.entity.Application;

public interface ApplicationRepository extends JpaRepository<Application, Long> {
	boolean existsByCandidateIdAndJobPostId(Long candidateId, Long jobPostId);
	List<Application> findByCandidateId(Long candidateId);
	 List<Application> findByRecruiterId(Long recruiterId);
}
