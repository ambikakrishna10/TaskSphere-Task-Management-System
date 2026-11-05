package com.TaskSphere.Controller;

import java.io.IOException;

import com.TaskSphere.dao.UserDAO;
import com.TaskSphere.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginUserServlet")
public class LoginUserServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println("Email: " + email);
		System.out.println("Password: " + password);

		User us = new User();

		us.setEmail(email);
		us.setPassword(password);

		UserDAO ud = new UserDAO();

		String status = ud.loginUser(us);

		System.out.println("Login status: " + status);

		if(status.equals("success")) {

		    HttpSession session = request.getSession();
		    session.setAttribute("email", email);
		    System.out.println("login successfully!!!");
		    response.sendRedirect("Taskshome");

		} else {
		    response.sendRedirect("loginUser.jsp");
		}
	}
}