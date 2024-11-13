package com.example.__osg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

	@GetMapping("/")
	public String getHomepage() {
		return "index";
	}
	
	@GetMapping("/about")
	public String getAboutPage() {
		return "about";
	}
	
	@GetMapping("/contact")
	public String getContactPage() {
		return "contact";
	}
}
