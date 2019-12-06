<!DOCTYPE html>
<!-- <link rel="stylesheet" href="login.css"> -->
<html>
   <head>
      <title>Login Form</title>
   </head>
   <body>
     <form action="checkLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username" placeholder="username"> <br/>
       Password:<input type="password" name="password" placeholder="password"> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <a href="register.jsp">create an account</a>
   </body>
</html>