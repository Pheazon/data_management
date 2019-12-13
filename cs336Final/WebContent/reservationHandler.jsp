<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.Timestamp"%>
<%
	//String url = "jdbc:mysql://cs336db.cdnjviplnzua.us-east-2.rds.amazonaws.com:3306/BarBeerDrinkerSample";
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Connection conn = null;
	PreparedStatement ps = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = db.getConnection();

		String insert = "INSERT INTO Reservation (FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		ps = conn.prepareStatement(insert);
		out.print(request.getParameter("user"));
		ps.setInt(1, Integer.parseInt(request.getParameter("FlightNumber")));
		ps.setTimestamp(2, new java.sql.Timestamp(System.currentTimeMillis()));
		ps.setInt(3, 69);
		ps.setInt(4, Integer.parseInt(request.getParameter("Fare")));
		ps.setString(5, "one way");
		ps.setString(6, request.getParameter("SpecialMeal"));
		ps.setString(7, request.getParameter("Class"));
		ps.setString(8, request.getParameter("user"));
		
		int result = 0;
        result = ps.executeUpdate();
        if (result < 1) {
        	out.print("Reservation failed");
        } else {
        	out.print("Reservation success!");	
		} 
        %><br><a href="success.jsp">Back home</a><br>
    	<a href="customerFlights">Back to FLights and Reservations page</a>
    	<% 
	
	} catch(Exception e) {
        out.print("<p>Error connecting to MYSQL server.</p>");
        e.printStackTrace();
        out.print(e.getMessage());
    } finally {
        try { ps.close(); } catch (Exception e) {}
        try { con.close(); } catch (Exception e) {}
    }
%>