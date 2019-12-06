<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    <title>Register for Account</title>
</head>
<body>
    <div class="content center">
        <form action="registerHandler.jsp" method="POST">
            <label>Username</label>
            <input type="text" name="username" placeholder="username"> <br>
    
            <label>Password</label>
            <input type="password" name="password" placeholder= "password"> <br>
    
           
            <input type="submit" value="Register">
        </form>
    </div>
	
</body>
</html>