<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
            int z = 0;
            try { // setting condition for searching for an item with name and category information
                String search = request.getParameter("search");
                Connection connection = ConnectionProvider.getCon();
                Statement  statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select  *from product where name like '%"+ search +"%' or category like '%"+ search +"%' and active='yes'");
                while (resultSet.next()){
                    z = 1;
        %>
          <tr>
              <td><%=resultSet.getString(1)%></td>
              <td><%=resultSet.getString(2)%></td>
              <td><%=resultSet.getString(3)%></td>
              <td><i class="fa fa-inr"></i> <%=resultSet.getString(4)%></td>
              <td><a href="addToCartAction.jsp?id=<%=resultSet.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
        <%
                }
            } catch (Exception e){
                System.out.println(e);
            }
        %>
        </tbody>
      </table>
<% if(z == 0){%>
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%}%>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by BTech Days</p>
      </div>

</body>
</html>