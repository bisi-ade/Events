package com.codingdojo.events.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.events.models.Event;
import com.codingdojo.events.models.LoginUser;
import com.codingdojo.events.models.Message;
import com.codingdojo.events.models.User;
import com.codingdojo.events.services.EventService;
import com.codingdojo.events.services.MessageService;
import com.codingdojo.events.services.UserService;
import com.codingdojo.events.validators.EventValidator;
import com.codingdojo.events.validators.UserValidator;

@Controller
public class MainController {
	@Autowired
	private UserService userService;
	@Autowired
	private EventService eventService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private UserValidator userValidator;
	@Autowired
	private EventValidator eventValidator;
	
	@RequestMapping("/")
	public String index(@ModelAttribute("user")User user, @ModelAttribute("loginUser")LoginUser loginUser) {
		return "index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		User u = (User) session.getAttribute("user");
		List<Event> localEvents = eventService.findAllByState(u.getState());
		List<Event> nonLocalEvents = eventService.findAllNotInState(u.getState());
		model.addAttribute("localEvents", localEvents);
		model.addAttribute("nonLocalEvents", nonLocalEvents);
		return "dashboard.jsp";
	}
	
	@RequestMapping("/add")
	public String addEvent(@ModelAttribute("event") Event event, HttpSession session) {
		session.getAttribute("user");
		return "add.jsp";
	}
	
	@RequestMapping(value="/events", method=RequestMethod.POST)
	public String createEvent(@Valid @ModelAttribute("event") Event event, BindingResult result, HttpSession session) {
		eventValidator.validate(event, result);
		if (result.hasErrors()) {
			session.getAttribute("user");
			return "add.jsp";
		} else {
			eventService.create(event);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("/events/{id}")
	public String show(@PathVariable("id") Long id, @ModelAttribute("message") Message message, Model model, HttpSession session) {
		session.getAttribute("user");
		Event event = eventService.findById(id);
		model.addAttribute("event", event);
		return "show.jsp";
	}
	
	@RequestMapping("/events/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
		session.getAttribute("user");
		Event event = eventService.findById(id);
		model.addAttribute("event", event);
		return "edit.jsp";
	}
	
	@RequestMapping("/events/{eventId}/{userId}")
	public String attend(@PathVariable("eventId") Long eventId, @PathVariable("userId") Long userId) {
		eventService.attend(eventId, userId);
		return "redirect:/dashboard";
	}
	
	@RequestMapping("/cancel/{eventId}/{userId}")
	public String cancel(@PathVariable("eventId") Long eventId, @PathVariable("userId") Long userId) {
		eventService.cancel(eventId, userId);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value="/events/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("event") Event event, BindingResult result) {
		eventValidator.validate(event, result);
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			eventService.updateEvent(event);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value="/events/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		eventService.deleteEvent(id);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value="/messages/{eventId}", method=RequestMethod.POST)
	public String message(@PathVariable("eventId") Long eventId, @ModelAttribute("message") Message message, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "show.jsp";
		} else {
			session.getAttribute("user");
			messageService.create(message);
			return "redirect:/events/{eventId}";
		}
	}
	
	
	// User Methods
		@RequestMapping(path="/register", method=RequestMethod.POST)
		public String register(@Valid @ModelAttribute("user")User user, BindingResult result, HttpSession session, Model model) {
			model.addAttribute("loginUser", new LoginUser());
			userValidator.validate(user, result);
			if (result.hasErrors()) {
				return "index.jsp";
			} else {
				User u = userService.register(user);
				session.setAttribute("user", u);
				return "redirect:/dashboard";
			}
		}
		
		@RequestMapping(path="/login", method=RequestMethod.POST)
		public String login(
				@Valid @ModelAttribute("loginUser")LoginUser loginUser,
				BindingResult result,
				HttpSession session,
				Model model) {
			model.addAttribute("user", new User());
			if (result.hasErrors()) {
				return "index.jsp";
			}
			
			if (userService.authenticate(loginUser)) {
				User u = userService.findByEmail(loginUser.getEmail());
				session.setAttribute("user", u);
				return "redirect:/dashboard";
			} else {
				model.addAttribute("error", "Invalid credentials");
				return "index.jsp";
			}
		}
		
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}

}
