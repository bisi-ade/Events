package com.codingdojo.events.validators;

import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.events.models.Event;

@Component
public class EventValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return Event.class.equals(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {
		Event event = (Event) target;
		Date thisDate = new Date();
		if (event.getDate() != null  && event.getDate().before(thisDate)) {
			errors.rejectValue("date", "Past");
		}
	}

}
