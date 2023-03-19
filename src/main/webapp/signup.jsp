<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="signupAction.jsp" method="post">
          <input type="text" name="name" placeholder="enter ur name" required>
          <input type="email" name="email" placeholder="enter ur email" required>
          <input type="number" name="mobileNumber" placeholder="enter ur mobile no" required>
          <select name="securityQuestion" required>
            <option value="What is your first car?">What is your first car?</option>
            <option value="What is the name of your first pet?">What is the name of your first pet?</option>
            <option value="what elementary school did you attend?">what elementary school did you attend?</option>
            <option value="what is the name of the town were you were born?">what is the name of the town were you were born?</option>
          </select>
          <input type="text" name="answer" placeholder="enter ur answer" required>
          <input type="password" name="password" placeholder="enter ur password" required>
          <input type="submit" value="signUp">
      </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
      ////////// this section is just for selective rendering of what to display
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
      <h1>Successfully Registered !</h1>
      <% } %>
<%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
      <% } %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>