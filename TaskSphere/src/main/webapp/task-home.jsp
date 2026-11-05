<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.TaskSphere.model.Task" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>TaskSphere - Home</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #333;
        }

        /* Header */

        .header {
            background-color: #ffffff;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo-icon {
            background-color: #333;
            color: white;
            width: 35px;
            height: 35px;
            border-radius: 6px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
        }

        .logo h1 {
            font-size: 22px;
        }

        .logout-btn {
            text-decoration: none;
            color: white;
            background-color: #dc3545;
            padding: 9px 18px;
            border-radius: 5px;
        }

        .logout-btn:hover {
            background-color: #b02a37;
        }

        /* Main */

        .main {
            width: 90%;
            max-width: 1200px;
            margin: 35px auto;
        }

        /* Top Section */

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .page-title h2 {
            font-size: 28px;
            margin-bottom: 8px;
        }

        .page-title p {
            color: #666;
        }

        .create-btn {
            text-decoration: none;
            background-color: #198754;
            color: white;
            padding: 11px 18px;
            border-radius: 5px;
            font-size: 15px;
        }

        .create-btn:hover {
            background-color: #157347;
        }

        .plus {
            font-size: 18px;
            margin-right: 5px;
        }

        /* Task Container */

        .task-container {
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        }

        .task-list-title {
            font-size: 20px;
            margin-bottom: 20px;
        }

        /* Table */

        .task-table {
            width: 100%;
            border-collapse: collapse;
        }

        .task-table th,
        .task-table td {
            padding: 13px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .task-table th {
            background-color: #f1f3f5;
            font-size: 14px;
        }

        .task-table td {
            font-size: 14px;
        }

        .task-table tr:hover {
            background-color: #f8f9fa;
        }

        /* Action Buttons */

        .update-btn {
            text-decoration: none;
            background-color: #0d6efd;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            margin-right: 5px;
        }

        .update-btn:hover {
            background-color: #0b5ed7;
        }

        .delete-btn {
            text-decoration: none;
            background-color: #dc3545;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
        }

        .delete-btn:hover {
            background-color: #b02a37;
        }

        /* No Tasks */

        .no-tasks {
            text-align: center;
            padding: 25px;
            color: #777;
        }

    </style>

</head>

<body>

    <!-- ================= HEADER ================= -->

    <header class="header">

        <div class="logo">

            <div class="logo-icon">
                ✓
            </div>

            <h1>
                TaskSphere
            </h1>

        </div>

        <a href="logout" class="logout-btn">
            Logout
        </a>

    </header>


    <!-- ================= MAIN ================= -->

    <main class="main">

        <!-- ================= TOP SECTION ================= -->

        <div class="top-section">

            <div class="page-title">

                <h2>
                    My Tasks
                </h2>

                <p>
                    Manage and track your team's tasks
                </p>

            </div>

            <a href="task-form.jsp" class="create-btn">

                <span class="plus">
                    ＋
                </span>

                Create New Task

            </a>

        </div>


        <!-- ================= TASK LIST ================= -->

        <div class="task-container">

            <h3 class="task-list-title">
                Task List
            </h3>


            <table class="task-table">

                <thead>

                    <tr>

                        <th>Task ID</th>
                        <th>Task Name</th>
                        <th>Task Description</th>
                        <th>Story Points</th>
                        <th>Assigned To</th>
                        <th>Action</th>

                    </tr>

                </thead>


                <tbody>

                <%

                    List<Task> allTasks =
                        (List<Task>) request.getAttribute("allTasks");

                    if (allTasks != null && !allTasks.isEmpty()) {

                        for (Task task : allTasks) {

                %>

                <tr>

                    <td>
                        <%= task.getTaskId() %>
                    </td>

                    <td>
                        <%= task.getTaskName() %>
                    </td>

                    <td>
                        <%= task.getTaskDescription() %>
                    </td>

                    <td>
                        <%= task.getStoryPoints() %>
                    </td>

                    <td>
                        <%= task.getAssignedTo() %>
                    </td>


                    <!-- ACTION COLUMN -->

                    <td>

                        <!-- UPDATE -->

                        <a href="updateTask?id=<%= task.getTaskId() %>"
                           class="update-btn">
                            Update
                        </a>


                        <!-- DELETE -->

                        <a href="deleteTask?id=<%= task.getTaskId() %>"
                           class="delete-btn"
                           onclick="return confirm('Are you sure you want to delete this task?');">
                            Delete
                        </a>

                    </td>

                </tr>

                <%

                        }

                    } else {

                %>

                <tr>

                    <td colspan="6" class="no-tasks">
                        No tasks available.
                    </td>

                </tr>

                <%

                    }

                %>

                </tbody>

            </table>

        </div>

    </main>

</body>

</html>