package com.TaskSphere.Controller;

import java.io.IOException;

import com.TaskSphere.dao.UserDAO;
import com.TaskSphere.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(name + ":" + email);
		
		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO ud = new UserDAO();
		String status = ud.registerUser(us);
		
		if (status.equals("success")) {
			RequestDispatcher rd = request.getRequestDispatcher("loginUser.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("registerUser.jsp");
			rd.forward(request, response);
		}
	}

}
