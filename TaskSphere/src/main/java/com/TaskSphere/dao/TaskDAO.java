package com.TaskSphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.TaskSphere.model.Task;
import com.TaskSphere.utility.DBConnection;

public class TaskDAO {

	Connection con = null;
	String status = "fail";
	DBConnection db = new DBConnection();

	public String createTask(Task task) {
		con = db.getConnection();
		try {
			PreparedStatement st = con.prepareStatement("INSERT INTO tasks (task_name,task_description,story_points,assigned_to) VALUES(?,?,?,?)");
			st.setString(1, task.getTaskName());
			st.setString(2, task.getTaskDescription());
			st.setInt(3, task.getStoryPoints());
			st.setString(4, task.getAssignedTo());
			int n = st.executeUpdate();
			if (n > 0) {
				System.out.println("task created successfully");
				status = "success";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;

	}

	public String UpdateTask(Task task) {
		con = db.getConnection();
		try {
			PreparedStatement st = con.prepareStatement("update  tasks set task_name=?,task_description=?,story_points=?,assigned_to=? where task_id=?");
			st.setString(1, task.getTaskName());
			st.setString(2, task.getTaskDescription());
			st.setInt(3, task.getStoryPoints());
			st.setString(4, task.getAssignedTo());
			st.setInt(5, task.getTaskId());
			int n = st.executeUpdate();
			if (n > 0) {
				System.out.println("task updated successfully");
				status = "success";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;

	}

	public String deleteTaskbyId(int taskid) {
		con = db.getConnection();
		try {
			PreparedStatement st = con.prepareStatement("delete from tasks where task_id=?");
			st.setInt(1, taskid);
			int n = st.executeUpdate();
			if (n > 0) {
				System.out.println("task deleted successfully");
				status = "success";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;

	}

	public Task FindTaskById(int taskid) {
		con = db.getConnection();
		Task task = new Task();//default
		try {
			PreparedStatement st = con.prepareStatement("select * from tasks where task_id=?");
			st.setInt(1, taskid);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
               task.setTaskId(rs.getInt("task_id"));
               task.setTaskName(rs.getString("task_name"));
               task.setTaskDescription(rs.getString("task_description"));
               task.setStoryPoints(rs.getInt("story_points"));
               task.setAssignedTo(rs.getString("assigned_to"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return task;
	}
	
	
	public List<Task> getAllTasks() {
		List<Task> list=new ArrayList<>();
		con = db.getConnection();
		
		try {
			PreparedStatement st = con.prepareStatement("select * from tasks");
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Task task = new Task();//default
               task.setTaskId(rs.getInt("task_id"));
               task.setTaskName(rs.getString("task_name"));
               task.setTaskDescription(rs.getString("task_description"));
               task.setStoryPoints(rs.getInt("story_points"));
               task.setAssignedTo(rs.getString("assigned_to"));
               list.add(task);
			}
			System.out.println("in Task DAO==========");
			System.out.println(list);
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		return list;
	}
	
	

}