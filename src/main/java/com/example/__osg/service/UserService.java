package com.example.__osg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.__osg.entity.Role;
import com.example.__osg.entity.User;
import com.example.__osg.repository.RoleRepository;
import com.example.__osg.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {

	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}
	
	public User getUserById(Long id) {
		return userRepository.findById(id).get();
	}
	
	public User userExists(String username) {
		return userRepository.findByUsername(username);
	}
	
	public User createNewUser(User user) {
		Role userRole = roleRepository.findById(5L).get();
		System.err.println("Role: " + userRole.getName());
		System.err.println("username: " + user.getUsername());
		System.err.println("email: " + user.getEmail());
		System.err.println("password: " + new BCryptPasswordEncoder().encode(user.getPassword()));
		
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		user.addRoles(roleRepository.findById(5L).get()); // default: USER
		return userRepository.save(user);
	}
	
	public User updateUserProfile(Long id, User user) {
		User existedUser = userRepository.findById(id).get();
		  
		if(existedUser != null) {
			existedUser.setUsername(user.getUsername());
			existedUser.setEmail(user.getEmail());
			existedUser.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
			return userRepository.save(existedUser);
		} else {
			return null;
		}
	}
	
	public void deleteUser(Long id) {
		userRepository.deleteById(id);
	}
}
