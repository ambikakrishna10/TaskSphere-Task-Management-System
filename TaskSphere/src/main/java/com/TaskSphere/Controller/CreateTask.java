package com.TaskSphere.Controller;

import java.io.IOException;

import com.TaskSphere.dao.TaskDAO;
import com.TaskSphere.model.Task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/createTask")
public class CreateTask extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("request came for create new task!!!");

        String taskName = request.getParameter("taskName");
        String taskDescription = request.getParameter("taskDescription");
        int storyPoints = Integer.parseInt(request.getParameter("storyPoints"));
        String assignedTo = request.getParameter("assignedTo");

        Task task = new Task(taskName, taskDescription, storyPoints, assignedTo);

        System.out.println(task);

        TaskDAO taskdao = new TaskDAO();

        String status = taskdao.createTask(task);

        if (status.equals("success")) {
            System.out.println("Task created successfully!!!");
            response.sendRedirect("Taskshome");
        } else {
            System.out.println("Failed to create task..");
            response.sendRedirect("task-form.jsp");
        }
    }
}