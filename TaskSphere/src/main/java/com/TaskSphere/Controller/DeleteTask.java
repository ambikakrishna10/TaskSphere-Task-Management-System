package com.TaskSphere.Controller;

import java.io.IOException;

import com.TaskSphere.dao.TaskDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteTask")
public class DeleteTask extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int taskId = Integer.parseInt(request.getParameter("id"));

        TaskDAO taskdao = new TaskDAO();

        String status = taskdao.deleteTaskbyId(taskId);

        if (status.equals("success")) {
            System.out.println("Task deleted successfully!!!");
        } else {
            System.out.println("Failed to delete task..");
        }

        response.sendRedirect("Taskshome");
    }
}