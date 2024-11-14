package com.example.__osg.exception;

import java.io.IOException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.access.AccessDeniedException accessDeniedException)
			throws IOException, ServletException {
		response.setStatus(HttpServletResponse.SC_FORBIDDEN);
		
		request.setAttribute("error", "403");
		request.setAttribute("message", "Access Denied! You do not have permission to access this page.");
		request.getRequestDispatcher("/WEB-INF/jsp/403.jsp").forward(request, response);
	}
}