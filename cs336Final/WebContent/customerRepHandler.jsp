<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
	//String url = "jdbc:mysql://cs336db.cdnjviplnzua.us-east-2.rds.amazonaws.com:3306/BarBeerDrinkerSample";
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Connection conn = null;
	PreparedStatement ps = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = db.getConnection();
		
		String userid = request.getParameter("username");
		String password = request.getParameter("password");
		int access = 1;
		
		if(userid != null  && !userid.isEmpty()
				&& password != null && !password.isEmpty()) {
			
			String insert = "INSERT INTO accounts (userid, password, access)"
					+ "VALUES(?, ?, ?)";
			ps = conn.prepareStatement(insert);
			
			ps.setString(1, userid);
			ps.setString(2, password);
			ps.setInt(3, access);
			
			int result = 0;
	        result = ps.executeUpdate();
	        if (result < 1) {
	        	out.println("Error: Registration failed.");
	        } else {
	        	response.sendRedirect("registerSuccess.jsp");
	        	return;
	        }
		} 
		else {
			response.sendRedirect("registerError.jsp");
			return;
		}
	} catch(Exception e) {
        out.print("<p>Error connecting to MYSQL server.</p>");
        e.printStackTrace();
    } finally {
        try { ps.close(); } catch (Exception e) {}
        try { con.close(); } catch (Exception e) {}
    }
%>