<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String name = request.getParameter("name"); // getting the name inputted in the jsp/web input field and store in string
String email = request.getParameter("email"); // getting the email inputted in the jsp/web input field and store in string
String mobileNumber = request.getParameter("mobileNumber"); // getting the mobileNumber inputted in the jsp/web input field and store in string
String securityQuestion = request.getParameter("securityQuestion"); // getting the securityQuestion inputted in the jsp/web input field and store in string
String answer = request.getParameter("answer"); // getting the answer inputted in the jsp/web input field and store in string
String password = request.getParameter("password"); // getting the password inputted in the jsp/web input field and store in string
String address=""; // getting the address but null as it will not be updated yet
String city=""; // getting the city but null as it will not be updated yet
String state=""; // getting the state but null as it will not be updated yet
String country=""; // getting the country but null as it will not be updated yet

try {
  Connection connection = ConnectionProvider.getCon(); // accessing my personal database connection from a class created called ConnectionProvider
  PreparedStatement preparedStatement = connection.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)"); // inserting values into 10 ? marks
  preparedStatement.setString(1, name);
  preparedStatement.setString(2, email);
  preparedStatement.setString(3, mobileNumber);
  preparedStatement.setString(4, securityQuestion);
  preparedStatement.setString(5, answer);
  preparedStatement.setString(6, password);
  preparedStatement.setString(7, address);
  preparedStatement.setString(8, city);
  preparedStatement.setString(9, state);
  preparedStatement.setString(10, country);

  preparedStatement.executeUpdate();
  response.sendRedirect("signup.jsp?msg=valid"); //msg is a parameter passed to the jsp page to render certain information
} catch (Exception e){
  System.out.println(e);
  response.sendRedirect("signup.jsp?msg=invalid"); //msg is a parameter passed to the jsp page to render certain information
}
%>