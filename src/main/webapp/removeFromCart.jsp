<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
try {
    Connection connection = ConnectionProvider.getCon();
    Statement statement = connection.createStatement();
    statement.executeUpdate("delete from cart where email='" + email + "' and product_id='" + product_id + "' and address is NULL");
    response.sendRedirect("myCart.jsp?msg=removed");
} catch (Exception e){
    System.out.println(e);
}
%>