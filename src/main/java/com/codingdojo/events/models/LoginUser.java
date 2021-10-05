package com.codingdojo.events.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {
	@NotEmpty(message="Email is required!")
	@Email(message="Email must be valid")
	private String email;
	
	@NotEmpty(message="Password is required!")
	@Size(min=8, max=255, message="Password must be the same you registered with")
	private String password;
	
	public LoginUser() {}
	
	
	//Getters and Setters starts Here

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
		

}
