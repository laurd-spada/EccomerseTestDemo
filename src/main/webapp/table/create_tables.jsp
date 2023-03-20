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
  String q3 = "create table cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(500), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigint, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(10))"; // creating a separate table to add cart information in the admin
  System.out.println(q3);
  //statement.execute(q1); //executing a string statement to the mysql for creating new user table
  //statement.execute(q2); //executing a string statement to the mysql for creating user product table
  statement.execute(q3); //executing a string statement to the mysql for creating cart product table
  System.out.print("Table created"); // for testing purposes
  connection.close(); //close connections after use
} catch (Exception e){
  e.printStackTrace();
}
%>