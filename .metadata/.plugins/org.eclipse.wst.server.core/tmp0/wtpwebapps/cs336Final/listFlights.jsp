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
		
		String airport = request.getParameter("airport");
		
		out.println("List of all flights in airport named " + airport);
		
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT FlightNumber FROM Flight WHERE departingFrom = '" + airport + "'");
		while (rs.next())
		{	
			out.print("<td>");
			out.println(rs.getInt(1) + ", ");
			out.print("</td>");
		}
		st.close();
		conn.close();
		rs.close();

	} catch(Exception e) {
        out.print("<p>Error connecting to MYSQL server.</p>");
        e.printStackTrace();
    }
%>