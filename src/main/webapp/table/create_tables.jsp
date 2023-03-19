<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
  //This section was for creating the table for new user singning up and creating the fields
try {
  Connection connection = ConnectionProvider.getCon();  // accessing my personal database connection from a class created called ConnectionProvider
  Statement statement = connection.createStatement(); // declaring a statement object from my personal mysql connection
  String q1 = "create table users(name varchar(100), email varchar(100)primary key, mobileNumber bigint, securityQuestion varchar(200), answer varchar(200), password varchar(100), address varchar(500), city varchar(100), state varchar(100), country varchar(100))";
  System.out.println(q1); // for testing purposes
  String q2 = "create table product(id int, name varchar(500), category varchar(200), price int, active varchar(10))"; // creating a separate table to add products in the admin
  System.out.println(q2);
  //statement.execute(q1); //executing a string statement to the mysql for creating new user table
  statement.execute(q2); //executing a string statement to the mysql for creating user product table
  System.out.print("Table created"); // for testing purposes
  connection.close(); //close connections after use
} catch (Exception e){
  e.printStackTrace();
}
%>