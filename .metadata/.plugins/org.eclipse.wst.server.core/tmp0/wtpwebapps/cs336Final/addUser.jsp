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
	String acc = request.getParameter("access");
	int access = Integer.parseInt(acc);
	
	Statement statement = con.createStatement();
	//ResultSet rs = statement.executeQuery("select userid from accounts where userid like '" + username + "'");
	String insert = "INSERT INTO accounts (userid, password, access)"
					+ "VALUES(?, ?, ?)";
	ps = con.prepareStatement(insert);
			
	ps.setString(1, username);
	ps.setString(2, password);
	ps.setInt(3, access);
			
	int result = 0;
	result = ps.executeUpdate();
	if (result < 1) {
		out.println("Error: Registration failed.");
	} 
	else {
		response.sendRedirect("success.jsp");
	}
	
	ps.close();
	con.close();
%>
<br><a href="success.jsp">Back to Manager Home</a>
			
</body>
</html>