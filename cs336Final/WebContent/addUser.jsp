<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Customer</title>
</head>
<body>

	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%>
	</b> <br>
	<a href='logout.jsp'>Log out</a>
	</div>
	
	<% 
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	PreparedStatement ps = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = db.getConnection();
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String access = request.getParameter("access");
	
	Statement statement = con.createStatement();
	//ResultSet rs = statement.executeQuery("select userid from accounts where userid like '" + username + "'");

	String command = "INSERT INTO accounts WHERE userid = '"+username+"', password = '"+password+"', access = '"+access+ "'";
	statement.executeUpdate(command);
	out.print("User information has been changed");

	statement.close();
	con.close();
%>
<br><a href="success.jsp">Back to Manager Home</a>
			
</body>
</html>