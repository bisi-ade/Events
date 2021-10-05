package com.codingdojo.events.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.events.models.Message;
import com.codingdojo.events.repositories.MessageRepository;

@Service
public class MessageService {
	@Autowired
	private MessageRepository messageRepo;
	
	public Message create(Message message) {
		return messageRepo.save(message);
	}
	

}
