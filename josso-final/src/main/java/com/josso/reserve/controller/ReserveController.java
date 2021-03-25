package com.josso.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReserveController {

	@RequestMapping(value="reserve", method=RequestMethod.GET)
	public String reserveMain() {
		return "reserve/reserveMain";
		
	}
	
	@RequestMapping(value="reserve/room", method=RequestMethod.GET)
	public String reserveRoom() {
		return "reserve/reserveRoom";
		
	}
	
	@RequestMapping(value="reserve/car", method=RequestMethod.GET)
	public String reserveCar() {
		return "reserve/reserveCar";
		
	}
	
	
}
