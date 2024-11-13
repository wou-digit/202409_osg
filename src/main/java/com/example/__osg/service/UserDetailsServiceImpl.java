package com.example.__osg.service;

import java.util.Date;

import org.hibernate.type.descriptor.jdbc.TimestampUtcAsOffsetDateTimeJdbcType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.example.__osg.controller.LoggingController;
import com.example.__osg.entity.User;
import com.example.__osg.repository.UserRepository;

public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(LoggingController.class);

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username);
		
		if(user == null) {
			throw new UsernameNotFoundException("User not found.");
		}
		
		logger.info("Accessed by user '{}' ", user.getUsername());

		return new CustomUserDetails(user);
	}
}