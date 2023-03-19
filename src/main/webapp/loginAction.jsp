<%@page import="com.ecommercetest.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");  // getting the email inputted in the jsp/web input field and store in string
String password = request.getParameter("password"); // getting the password inputted in the jsp/web input field and store in string

if("admin@gmail.com".equals(email) && "admin".equals(password)){ // if the provided credentials matches this :then it is an admin and is directed to admin page
    session.setAttribute("email", email); // set a section for admin
    response.sendRedirect("admin/adminHome.jsp");
}
else{ // if the credentials is not of the admin that it's a client and this block will be executed
    int z = 0;
    try {
        Connection connection = ConnectionProvider.getCon();  // accessing my personal database connection from a class created called ConnectionProvider
        Statement statement = connection.createStatement(); //creating a statement object from my created mysql database
        ResultSet resultSet = statement.executeQuery("select * from users where email = '" + email + "' and password='" + password + "'"); // to check if the user exist or not
        while (resultSet.next()){
            z = 1;
            session.setAttribute("email", email); // set a session for a client
            response.sendRedirect("home.jsp"); // start at home after logging
        }
        if(z == 0){ // it means that user is not yet loged in or user does not exist
            response.sendRedirect("login.jsp?msg=notexist");
        }
    }catch (Exception e){
        System.out.println(e);
        response.sendRedirect("login.jsp?msg=invalid");
    }
}
%>