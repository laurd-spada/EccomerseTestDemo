<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<% } %>
<%
 if("wrong".equals(msg))
 {
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>
<%
int id = 1; // this is to get the value of number of product
try {
 Connection connection = ConnectionProvider.getCon();
 Statement statement = connection.createStatement();
 ResultSet resultSet = statement.executeQuery("select max(id) from product");
 while (resultSet.next()){
  id=resultSet.getInt(1);
  id = id + 1; //increase the id number after a product have been added
 }
} catch (Exception e){

}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <%out.println(id);%> </h3>
<input type="hidden" name="id" value="<%out.println(id);%>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="enter product name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="enter product category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder="enter product price" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select class="input-style" name="active">
    <option value="yes"> yes </option>
    <option value="no"> no </option>
   </select>
<hr>
</div>
 <button class="button"> save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>