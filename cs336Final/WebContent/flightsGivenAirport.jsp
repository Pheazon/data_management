<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Flights Airport</title>
</head>
<body>


<h1 align="center">Ticket Reservation System</h1>
<h2 align="center">Customer Rep Home Page</h2>

<div align="right"> <b> Logged in as 
<%=session.getAttribute("username")%> (<%=session.getAttribute("userType") %>).
</b> <br>
<a href='../LogOut.jsp'>Log out</a>
</div>


<h3>Flight Information</h3>
<div align='right'><a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a></div> <br>

<h4>List of flights touching 
<%=request.getParameter("airportID")%>
</h4>

<%

/* try{ */

		String airportID = request.getParameter("airportID");

		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		PreparedStatement ps = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = db.getConnection();
		
		Statement statement = con.createStatement();
		
		/* Big ass query.  Joins tables and merges days_occurs into one column */
		String command = "select name, concat(airlineID, flightNumber) flight, group_concat(weekday) weekdays, dominter,  " +
				"deptairportID, deptTime, arrairportID, arrivalTime, seatCount, fare " +
				"from Flight_operates " +
				"join Airlines using (airlineID) " +
				"join Days_occurs using (airlineID, flightNumber) " +
				"join Runs using (airlineID, flightNumber) " +
				"join Routes using (routeID) " +
				"join Depart using (routeID) " +
				"join Arrive using (routeID) " +
				"where deptairportID='"+ airportID +"' or arrairportID='"+ airportID +"' " +
				"group by flight, routeID";
		ResultSet result = statement.executeQuery(command);

		//Make an HTML table to show the results in:
		out.print("<table border='1'>");

		//make a row
		out.print("<tr>");
		
		//make a column
		out.print("<td>");
		out.print("Airline Name");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Flight");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Operating Days");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Domestic/International");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Departing Airport");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Departing Time");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Arrival Airport");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Arrival Time");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Seat Count");
		out.print("</td>");
		
		
		//make a column
		out.print("<td>");
		out.print("Fare");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(result.getString("name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("flight"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("weekdays"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("dominter"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("deptairportID"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result.getString("deptTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("arrairportID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("arrivalTime"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("seatCount"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("fare"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		
		result.close();
		statement.close();
		con.close();
		
/* } catch (Exception e){
	
} */

%>

<br><br><br>
<a href="../HomePages/CustomerRepHome.jsp">Back to Customer Rep Home</a>


</body>
</html>

