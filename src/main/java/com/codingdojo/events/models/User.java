package com.codingdojo.events.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Fisrtname is required!")
	@Size(min=2, max=25, message="Firstname must be between 3 and 25 characters" )
	private String firstName;
	
	@NotEmpty(message="Lastname is required!")
	@Size(min=2, max=25, message="Lastname must be between 3 and 25 characters" )
	private String lastName;
	
	@NotEmpty(message="Email is required!")
	@Email(message="Please enter a valid email!")
	private String email;
	
	@Size(min=2, max=50)
	private String city;
	
	@Size(min=2, max=2)
	private String state;
	
	@NotEmpty(message="Password is required!")
	@Size(min=8, max=255, message="Password must be between 8 and 255 characters" )
	private String password;
	
	@Transient
	@NotEmpty(message="Confirm Password is required!")
	@Size(min=8, max=255, message="Confirm Password must be between 8 and 255 characters")
	private String passwordConfirm;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@OneToMany(mappedBy="creator", fetch = FetchType.LAZY)
	private List<Event> createdEvents;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "users_events",
		joinColumns = @JoinColumn(name = "user_id"),
		inverseJoinColumns = @JoinColumn(name = "event_id")
	)
	private List<Event> attendingEvents;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private List<Message> messages;
	
	public User() {
		
	}
	
	//Getters and Setters starts Here

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Event> getCreatedEvents() {
		return createdEvents;
	}

	public void setCreatedEvents(List<Event> createdEvents) {
		this.createdEvents = createdEvents;
	}

	public List<Event> getAttendingEvents() {
		return attendingEvents;
	}

	public void setAttendingEvents(List<Event> attendingEvents) {
		this.attendingEvents = attendingEvents;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
	
	//Methods
	@PrePersist
	public void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	public void onUpdate() {
		this.updatedAt = new Date();
	}
	
	
	

}
