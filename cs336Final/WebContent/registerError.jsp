<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <div class="content center">
    	<h2>Error: Registration failed. Please enter the correct information and try again.</h2>
        <form action="registerHandler.jsp" method="POST">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" placeholder="Username"> <br>
  
            <label>Password</label>
            <input type="password" name="password" placeholder="Password"> <br>
    
            <label>Confirm Password</label>
            <input type="password" name="confirm_password" placeholder="Confirm Password"> <br>
    
            <input type="submit" value="Register">
        </form>
    </div>
	
</body>
</html>