package com.codingdojo.events.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.events.models.LoginUser;
import com.codingdojo.events.models.User;
import com.codingdojo.events.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	public User register(User user) {
		// validate not in db
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return userRepo.save(user);
	}
	
	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	public User findById(Long id) {
		return userRepo.findById(id).orElse(null);
	}
	
	public boolean authenticate(LoginUser loginUser) {
		User user = userRepo.findByEmail(loginUser.getEmail());
		if (user == null) {
			return false;
		} else {
			if (BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}

}
