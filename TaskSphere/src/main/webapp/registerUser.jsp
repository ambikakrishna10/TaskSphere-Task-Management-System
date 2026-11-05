<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #f1f5f9;
            color: #0f172a;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 1.25rem;
        }

        .auth-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -2px rgba(0, 0, 0, 0.05);
            padding: 2.25rem;
            width: 100%;
            max-width: 400px;
        }

        .auth-header {
            margin-bottom: 1.75rem;
            text-align: center;
        }

        .auth-header h1 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #0f172a;
        }

        .auth-header p {
            font-size: 0.875rem;
            color: #64748b;
            margin-top: 0.25rem;
        }

        .form-group {
            margin-bottom: 1.15rem;
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 0.35rem;
            color: #334155;
        }

        input {
            width: 100%;
            padding: 0.65rem 0.85rem;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 0.95rem;
            outline: none;
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
        }

        input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
        }

        button[type="submit"] {
            width: 100%;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            padding: 0.75rem;
            border-radius: 6px;
            font-size: 0.95rem;
            font-weight: 500;
            cursor: pointer;
            margin-top: 0.5rem;
            transition: background-color 0.15s ease;
        }

        button[type="submit"]:hover {
            background-color: #1d4ed8;
        }

        .auth-footer {
            margin-top: 1.25rem;
            text-align: center;
            font-size: 0.875rem;
            color: #64748b;
        }

        .auth-footer a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 500;
        }

        .auth-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="auth-card">
        <div class="auth-header">
            <h1>Create an Account</h1>
            <p>Enter your details below to get started</p>
        </div>

        <form action="RegisterUserServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="email@example.com" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required>
            </div>

            <button type="submit">Register</button>
        </form>

        <div class="auth-footer">
            Already registered? <a href="./loginUser.jsp">Sign in</a>
        </div>
    </div>
</body>
</html>