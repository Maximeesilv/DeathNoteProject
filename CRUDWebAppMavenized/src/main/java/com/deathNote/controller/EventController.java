package com.deathNote.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deathNote.model.Event;
import com.deathNote.service.EventService;


@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("/event")
	@ResponseBody
	public String getEventNumber1() {
		Event e = eventService.getEventById(1);
		
		return e.getDescription();
	}
	
	@RequestMapping("/loadEvents")
	public String loadEvents(Map<String, Object> map) {
		Event even = new Event();
		map.put("event", even);
		map.put("eventList", eventService.getAllEvents());
		
		return "events-main";
	}
}
