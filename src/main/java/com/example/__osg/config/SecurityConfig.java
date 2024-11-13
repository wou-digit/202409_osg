package com.example.__osg.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.example.__osg.service.CustomUserDetails;
import com.example.__osg.service.UserDetailsServiceImpl;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new UserDetailsServiceImpl();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		auth.setUserDetailsService(userDetailsService());
		auth.setPasswordEncoder(passwordEncoder());
		return auth;
	}
	
	@Bean
	public SecurityFilterChain configure(HttpSecurity http) throws Exception {
		http
			.authorizeHttpRequests(auth -> auth
				.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
				.requestMatchers("/register").permitAll()
				.requestMatchers("register/new").permitAll()
				.requestMatchers("/").permitAll()
				.requestMatchers("/about").permitAll()
				.requestMatchers("/contact").permitAll()
				.requestMatchers("/stores/new").hasAnyAuthority("USER", "ADMIN")
				.requestMatchers("/stores/{id}").hasAnyAuthority("USER", "ADMIN")
				.requestMatchers("/stores/{id}/update").hasAnyAuthority("USER", "ADMIN")
				.requestMatchers("/dashboard").hasAuthority("ADMIN")
				.requestMatchers("/users/{id}").hasAnyAuthority("USER", "ADMIN")
				.anyRequest().authenticated()
			)
			.formLogin(login -> login
				.loginPage("/signin")
				.loginProcessingUrl("/login")
				.defaultSuccessUrl("/stores")
				.permitAll()
			)
			.logout(logout -> logout
				.invalidateHttpSession(true)
				.logoutSuccessUrl("/")
				.permitAll()
			);
		
		return http.build();
	}
}
