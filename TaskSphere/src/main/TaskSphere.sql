create database taskmanagementdb;
use taskmanagementdb;

create table users(
user_id int auto_increment primary key,
name varchar(30) not null,
email varchar(30) not null,
password varchar(30) not null
);
select * from users;

create table tasks(
task_id int auto_increment primary key,
task_name varchar(50) not null,
task_description varchar(500) not null,
storypoints int not null,
assigned_to varchar(30) not null
);
select * from tasks;