package com.codingdojo.events.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.events.models.Event;
import com.codingdojo.events.models.User;
import com.codingdojo.events.repositories.EventRepository;
import com.codingdojo.events.repositories.UserRepository;

@Service
public class EventService {
	@Autowired
	private EventRepository eventRepo;
	@Autowired
	private UserRepository userRepo;
	
	public Event create(Event event) {
		return eventRepo.save(event);
	}
	
	public Event findById(Long id) {
		return eventRepo.findById(id).orElse(null); 
	}
	
	public List<Event> findAllByState(String state) {
		return eventRepo.findAllByState(state);
	}
	
	public List<Event> findAllNotInState(String state) {
		return eventRepo.findAllNotInState(state);
	}
	
	public void attend(Long eventId, Long userId) {
		Optional<Event> e = eventRepo.findById(eventId);
		if (e.isPresent()) {
			List<User> attendees = e.get().getAttendees();
			attendees.add(userRepo.findById(userId).orElse(null));
			e.get().setAttendees(attendees);
			eventRepo.save(e.get());
		}
	}
	
	public void cancel(Long eventId, Long userId) {
		Optional<Event> e = eventRepo.findById(eventId);
		if (e.isPresent()) {
			List<User> attendees = e.get().getAttendees();
			attendees.remove(userRepo.findById(userId).orElse(null));
			e.get().setAttendees(attendees);
			eventRepo.save(e.get());
		}
	}
	
	public Event updateEvent(Event event) {
		Optional<Event> e = eventRepo.findById(event.getId());
		if (e.isPresent()) {
			e.get().setName(event.getName());
			e.get().setCity(event.getCity());
			e.get().setState(event.getState());
			e.get().setDate(event.getDate());
			return eventRepo.save(e.get());
		} else {
			return null;
		}
	}
	
	public void deleteEvent(Long id) {
		eventRepo.deleteById(id);
	}

}
