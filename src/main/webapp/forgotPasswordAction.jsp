<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try {
  Connection connection = ConnectionProvider.getCon();
  Statement statement = connection.createStatement();
  ResultSet resultSet = statement.executeQuery("select * from users where email = '" + email + "' and mobileNumber='" + mobileNumber + "' and securityQuestion = '" + securityQuestion +"' and answer = '" + answer +"'");
  while (resultSet.next()){
    check = 1;
    statement.executeUpdate("update users set password='"+ newPassword +"' where email= '" + email + "'");
    response.sendRedirect("forgotPassword.jsp?msg=done");
  }
  if(check == 0){
    response.sendRedirect("forgotPassword.jsp?msg=invalid");
  }
} catch (Exception e){
  System.out.println(e);
}
%>