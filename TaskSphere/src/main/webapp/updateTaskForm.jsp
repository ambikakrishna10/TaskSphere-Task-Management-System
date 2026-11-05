<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.TaskSphere.model.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
		
		.container {
		    width: 90%;
		    max-width: 650px;
		    margin: 50px auto;
		    background-color: white;
		    padding: 35px;
		    border-radius: 8px;
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
		}
		
		.title {
		    text-align: center;
		    margin-bottom: 30px;
		}
		
		.title-icon {
		    font-size: 28px;
		    margin-bottom: 10px;
		}
		
		.title h1 {
		    font-size: 28px;
		    margin-bottom: 10px;
		}
		
		.title p {
		    color: #666;
		    font-size: 15px;
		}
		
		.form-group {
		    margin-bottom: 20px;
		}
		
		.form-group label {
		    display: block;
		    margin-bottom: 7px;
		    font-weight: bold;
		}
		
		.form-group input,
		.form-group textarea {
		    width: 100%;
		    padding: 11px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 14px;
		    outline: none;
		}
		
		.form-group input:focus,
		.form-group textarea:focus {
		    border-color: #198754;
		}
		
		.form-group textarea {
		    height: 120px;
		    resize: vertical;
		}
		
		.buttons {
		    text-align: center;
		    margin-top: 25px;
		}
		
		.update-btn {
		    border: none;
		    background-color: #198754;
		    color: white;
		    padding: 11px 25px;
		    border-radius: 5px;
		    font-size: 15px;
		    cursor: pointer;
		}
		
		.update-btn:hover {
		    background-color: #157347;
		}
		</style>
	</head>
	<body>
		<!-- ================= FORM ================= -->

	<div class="container">


		<div class="title">

			<div class="title-icon">🌹</div>

			<h1>Update Task</h1>

			<p>Modify the task details and save your changes</p>

		</div>


		<!-- IMPORTANT:
         taskId is sent as hidden value
    -->
		<%
		Task task = (Task) request.getAttribute("task");
		%>
		<form action="updateTask" method="post">


			<!-- TASK ID -->

			<input type="hidden" name="taskId" value="<%=task.getTaskId()%>">


			<!-- TASK NAME -->

			<div class="form-group">

				<label>Task Name</label> <input type="text" name="taskName"
					value="<%=task.getTaskName()%>"
					required>

			</div>


			<!-- TASK DESCRIPTION -->

			<div class="form-group">

				<label>Task Description</label>

				<textarea name="taskDescription" required><%=task.getTaskDescription()%></textarea>

			</div>


			<!-- STORY POINTS -->

			<div class="form-group">

				<label>Story Points</label> <input type="number" name="storyPoints"
					value="<%=task.getStoryPoints()%>"
					min="0" required>

			</div>


			<!-- ASSIGNED TO -->

			<div class="form-group">

				<label>Assigned To</label> <input type="text" name="assignedTo"
					value="<%=task.getAssignedTo()%>"
					required>

			</div>


			<!-- BUTTONS -->

			<div class="buttons">

				<button type="submit" class="update-btn">🌹 Update Task</button>


				
			</div>


		</form>

	</div>
	</body>
</html>