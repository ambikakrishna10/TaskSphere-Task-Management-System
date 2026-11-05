package com.TaskSphere.Controller;

import java.io.IOException;
import java.util.List;

import com.TaskSphere.dao.TaskDAO;
import com.TaskSphere.model.Task;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Taskshome")
public class Taskshome extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("loginUser.jsp");
            return;
        }

        System.out.println("request came for tasks list!!!!!");

        TaskDAO taskdao = new TaskDAO();
        List<Task> allTasks = taskdao.getAllTasks();

        request.setAttribute("allTasks", allTasks);

        RequestDispatcher rd =
                request.getRequestDispatcher("task-home.jsp");

        rd.forward(request, response);
    }
}