<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id"); // getting the id generated from the number of max product
String name = request.getParameter("name"); // getting the name inputted in the jsp/web input field and store in string
String category = request.getParameter("category"); // getting the category inputted in the jsp/web input field and store in string
String price = request.getParameter("price"); // getting the price inputted in the jsp/web input field and store in string
String active = request.getParameter("active"); // getting the active status inputted in the jsp/web input field and store in string

try {
    Connection connection = ConnectionProvider.getCon(); // accessing my personal database connection from a class created called ConnectionProvider
    PreparedStatement preparedStatement = connection.prepareStatement("insert into product values(?,?,?,?,?)"); // using an sql method to insert values into a table that i creaded for products
    preparedStatement.setString(1, id);
    preparedStatement.setString(2, name);
    preparedStatement.setString(3, category);
    preparedStatement.setString(4, price);
    preparedStatement.setString(5, active);
    preparedStatement.executeUpdate(); // using an sql execute method to execute the update to that table of products
    response.sendRedirect("addNewProduct.jsp?msg=done");
} catch (Exception e){
    System.out.println(e);
    response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>