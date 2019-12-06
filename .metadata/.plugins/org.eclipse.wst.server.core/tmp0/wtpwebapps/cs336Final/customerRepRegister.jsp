<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Customer Rep Account</title>
</head>
<body bgcolor=#a6dced>
<% if((Integer)session.getAttribute("access") != 2) {
	out.println("Error, only admins can access this page");
	%><a href="logout.jsp">Log out</a> 
	<%
}
else
{
		out.println("Create Customer Rep account here"); %> <!-- output the same thing, but using 
                                      jsp programming -->



<br>
	<form method="post" action="customerRepHandler.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="password" name="password"></td>
	</tr>
	</table>
	<td>
	<input type="submit" value="Create">
	</form>
<br>
<%}
%>
<a href="logout.jsp">Log out</a>
<a href="success.jsp">Home</a>
</body>
</html>