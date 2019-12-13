<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales</title>
</head>
<body>
	<form method="post" action="saleReport.jsp">			
		
		<table>
			<tr>
				<td>Month (format MM)</td>
				<td><input type="date" name="month" maxlength="2" required></td>
			</tr>
			<tr>
				<td>Year (format YYYY)</td>
				<td><input type="date" name="year" maxlength="4"
					required></td>
			</tr>
		</table>
		
		
		
		<br> <input type="submit" value="Search">
	</form>
	<br><br>
	
	<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st;
	ResultSet rs;
	%>
	<b>Find Flight Reservation by: </b>
	<form method="post" action="reservationCustomer.jsp">
		user id<input type="text" name=userid>
	<input type="submit" value="Search">
	</form>
	
	
	
	<form method="post" action="reservationFlightNumber.jsp">
		Flight Number (Ex. 111) <input type="text" name=FlightNumber>
	<input type="submit" value="Search">
	</form>
	<h3>Sales and Revenue</h3>

<div>
	<b>Get revenue summary of: </b>
	<form method="post" action="revenueFlight.jsp">
		A flight (Ex. '111') <input type="text" name=FlightNumber>
	<input type="submit" value="Calculate">
	</form>
	
	
	<form method = "post" action ="revenueAirline.jsp">
	<tr>
	<td>Pick the Airline to find its revenue</td>
	<td>
	<select name = "airline" size = 1>
	<% 
	
	st = con.createStatement();
	rs = st.executeQuery("SELECT Id FROM Airline");
	
	while (rs.next())
	{
		%>
		<option value = "<%= rs.getString(1) %>"> <%= rs.getString(1) %></option>
		<%
	}
	st.close();
	rs.close();
	%>
	</select>
	<input type="submit" value="Submit">
	</form>
	

	
	<form method="post" action="revenueCustomer.jsp">
		user id <input type="text" name=userid>
	<input type="submit" value="Calculate">
	</form>
	
	<form method = "post" action ="listFlights.jsp">
	<tr>
	<td>Pick the Airport</td>
	<td>
	<select name = "airport" size = 1>
	<% 
	
	st = con.createStatement();
	rs = st.executeQuery("SELECT Id FROM Airport");
	
	while (rs.next())
	{
		%>
		<option value = "<%= rs.getString(1) %>"> <%= rs.getString(1) %></option>
		<%
	}
	st.close();
	rs.close();
	%>
	</select>
	<input type="submit" value="Submit">
	</form>
	
	
	<tr>
	<% 
	
	st = con.createStatement();
	rs = st.executeQuery("SELECT COUNT(FlightNumber),FlightNumber FROM Reservation GROUP BY FlightNumber ORDER BY COUNT(*) DESC");
	out.print("<table border='1'>");

	//make a row
	out.print("<tr>");

	out.print("<td>");
	out.print("Flight Number");
	out.print("</td>");

	
	out.println("<td>");
	out.print("# of tickets bought");
	while (rs.next())
	{
		
		out.println("<tr>");
		out.println("<td>");
		out.println(rs.getString("FlightNumber"));
		out.println("</td>");
		out.println("<td>");
		out.println(rs.getInt(1));
		out.println("</td>");
		out.println("</tr>");
	}
	out.print("</tr>");
	st.close();
	rs.close();
	%>
	
</div>


	


<br><br>
<a href="revenueMostByCustomer.jsp">Most Revenue Generated By A Customer</a>
<br><br>




<table>


	<tr>

	
	<td><a href="success.jsp">Go Back Home</a></td>

	</tr>
</table>
</body>
</html>
