package com.example.__osg.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/logs")
public class LoggingController {
	
	private static final String LOG_FILE_PATH = "logs/app-logs.log";
	
	@GetMapping
	public ResponseEntity<String> viewLogs() {
		try {
			Path path = Path.of(LOG_FILE_PATH);
			if(!Files.exists(path)) {
				return new ResponseEntity<>("Logs file not found.", HttpStatus.NOT_FOUND);
			}
			
			//Read log file contents
			String content = Files.readString(path, StandardCharsets.UTF_8);
			return ResponseEntity.ok(content);
		} catch (IOException e) {
			return new ResponseEntity<>("Error reading log file.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
