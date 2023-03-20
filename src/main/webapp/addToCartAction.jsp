<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;

int z = 0;

try {
    Connection connection = ConnectionProvider.getCon();
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("select * from product where id= '" + product_id+ "'");
    while (resultSet.next()){
        product_price = resultSet.getInt(4);
        product_total = product_price;
    }
    ResultSet resultSet1 = statement.executeQuery("select * from cart where product_id= '" + product_id+ "' and email= '" + email+ "' and address is NULL");
    while (resultSet1.next()){
        cart_total = resultSet1.getInt(5);
        cart_total = cart_total + product_total;
        quantity = resultSet1.getInt(3);
        quantity = quantity + 1;
        z = 1;
    }
    if(z == 1){ // the logic if the product is already in the cart
        statement.executeUpdate("update cart set total='" + cart_total + "' , quantity='" + quantity + "' where product_id='" + product_id + "' and email='" + email+ "' and address is NULL");
        response.sendRedirect("home.jsp?msg=exist");

    }
    if(z == 0){
        PreparedStatement preparedStatement = connection.prepareStatement("insert into cart(email, product_id,quantity, price,total) values(?,?,?,?,?)");
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, product_id);
        preparedStatement.setInt(3, quantity);
        preparedStatement.setInt(4, product_price);
        preparedStatement.setInt(5, product_total);
        preparedStatement.executeUpdate();
        response.sendRedirect("home.jsp?msg=added");
    }

}  catch (Exception e){
    System.out.println(e);
    response.sendRedirect("home.jsp?msg=invalid");

}
%>