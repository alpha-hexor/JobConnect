package com.jobConnect.repository;

import com.jobConnect.entity.ProfilePic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProfilePicRepository extends JpaRepository<ProfilePic, Long> {
    Optional<ProfilePic> findByCandidateId(Long candidateId);
}
