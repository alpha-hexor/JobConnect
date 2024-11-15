package com.jobConnect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobConnect.entity.Message;
import com.jobConnect.repository.MessageRepository;

@Service
public class MessageService {

	@Autowired
	private MessageRepository messageRepositoty;
	
	public void addMessage(Message message) {
		messageRepositoty.save(message);
	}
}
