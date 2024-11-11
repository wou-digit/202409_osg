package com.example.__osg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.__osg.entity.User;
import com.example.__osg.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/signin")
	public String getSigninPage() {
		return "signin";
	}
	
	@GetMapping("/register")
	public String getRegistrationPage() {
		return "register";
	}
	
	@PostMapping("/register/new")
	public String createNewUser(Model model, @ModelAttribute("user") User user) {
		User existedUser = userService.userExists(user.getUsername());
		
		if(existedUser == null) {
			userService.createNewUser(user);
			return "redirect:/signin";
		} else {
			model.addAttribute("errmsg", "Username/Email exists");
			return "register";
		}
	}
}
