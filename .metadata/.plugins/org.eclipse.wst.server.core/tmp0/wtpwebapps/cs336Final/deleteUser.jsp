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

	

	<a href='logout.jsp'>Log out</a>

	
	<% 
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	PreparedStatement ps = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = db.getConnection();
	String username = request.getParameter("username");
	
	Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery("select userid from accounts where userid like '" + username + "'");
	if (rs.next())
	{
		String command = "DELETE FROM accounts WHERE userid = '" + username + "'";
		statement.executeUpdate(command);
		out.print("User information has been changed");
	}
	else
		out.println("User not found");
	statement.close();
	con.close();
%>
<br><a href="success.jsp">Back to Manager Home</a>
			
</body>
</html>