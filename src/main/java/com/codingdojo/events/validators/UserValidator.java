package com.codingdojo.events.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.events.models.User;
import com.codingdojo.events.repositories.UserRepository;

@Component
public class UserValidator implements Validator {
	@Autowired
	private UserRepository userRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		
		if (!user.getPasswordConfirm().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirm", "Match");
		}
		
		if (userRepo.findByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "Duplicate");
		}
	}

}
