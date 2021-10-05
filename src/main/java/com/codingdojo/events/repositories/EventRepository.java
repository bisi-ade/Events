package com.codingdojo.events.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.codingdojo.events.models.Event;

@Repository
public interface EventRepository extends CrudRepository<Event, Long> {
	List<Event> findAll();
	List<Event> findAllByState(String state);
	@Query("SELECT e FROM Event e WHERE e.state != :state")
	List<Event> findAllNotInState(@Param("state") String state);

}
