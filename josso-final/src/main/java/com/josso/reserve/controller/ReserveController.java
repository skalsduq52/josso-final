package com.josso.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReserveController {

	@RequestMapping(value="reserveHome.do", method=RequestMethod.GET)
	public String reserveHome() {
		
		return "reserve/reserveHome";
		
	}
	
	@RequestMapping(value="reserveRoom.do", method=RequestMethod.GET)
	public String reserveRoom() {
		return "reserve/reserveRoom";
		
	}
}
