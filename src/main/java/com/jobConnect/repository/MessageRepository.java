package com.jobConnect.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.jobConnect.entity.Message;

	public interface MessageRepository extends JpaRepository<Message, Long> {
}
