<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Create New Task</title>

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

        .create-btn {
            border: none;
            background-color: #198754;
            color: white;
            padding: 11px 25px;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
        }

        .create-btn:hover {
            background-color: #157347;
        }

    </style>

</head>

<body>

    <!-- ================= FORM ================= -->

    <div class="container">

        <div class="title">

            <h1>Create New Task</h1>

            <p>
                Add a new task to your task management board
            </p>

        </div>


        <form action="createTask" method="post">

            <!-- Task Name -->

            <div class="form-group">

                <label>Task Name</label>

                <input
                    type="text"
                    name="taskName"
                    placeholder="Enter task name"
                    required>

            </div>


            <!-- Task Description -->

            <div class="form-group">

                <label>Task Description</label>

                <textarea
                    name="taskDescription"
                    placeholder="Describe the task..."
                    required></textarea>

            </div>


            <!-- Story Points -->

            <div class="form-group">

                <label>Story Points</label>

                <input
                    type="number"
                    name="storyPoints"
                    placeholder="Enter story points"
                    min="0"
                    required>

            </div>


            <!-- Assigned To -->

            <div class="form-group">

                <label>Assigned To</label>

                <input
                    type="text"
                    name="assignedTo"
                    placeholder="Enter developer name"
                    required>

            </div>


            <!-- Buttons -->

            <div class="buttons">

                <button
                    type="submit"
                    class="create-btn">
                    Create Task
                </button>

            </div>

        </form>

    </div>

</body>

</html>