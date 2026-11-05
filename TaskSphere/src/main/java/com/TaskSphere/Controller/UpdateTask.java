package com.TaskSphere.Controller;

import java.io.IOException;

import com.TaskSphere.dao.TaskDAO;
import com.TaskSphere.model.Task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateTask")
public class UpdateTask extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int taskId = Integer.parseInt(request.getParameter("id"));

        TaskDAO taskdao = new TaskDAO();

        Task task = taskdao.FindTaskById(taskId);

        request.setAttribute("task", task);

        request.getRequestDispatcher("updateTaskForm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String taskName = request.getParameter("taskName");
        String taskDescription = request.getParameter("taskDescription");
        int storyPoints = Integer.parseInt(request.getParameter("storyPoints"));
        String assignedTo = request.getParameter("assignedTo");

        Task task = new Task(taskName, taskDescription, storyPoints, assignedTo);

        task.setTaskId(taskId);

        TaskDAO taskdao = new TaskDAO();

        String status = taskdao.UpdateTask(task);

        if (status.equals("success")) {
            System.out.println("Task updated successfully!!!");
            response.sendRedirect("Taskshome");
        } else {
            System.out.println("Failed to update task..");
            response.sendRedirect("Taskshome");
        }
    }
}