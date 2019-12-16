<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.lang.*,java.text.*,java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


Welcome <%=session.getAttribute("user")%>
<br>
<br>
<table>
	<tr>
		<th><a href="customerFlights.jsp">Flights</a></th>
		<th><a href="customerAdvancedSearch.jsp">Advanced Search</a></th>
		<th><a href="customerUpcomingReservations.jsp">Upcoming Reservations</a></th>
		<th><a href="customerPastReservations.jsp">Past Reservations</a></th>
	</tr>
</table>
<br>


<h1>Flight Search</h1>
<body>

<div align="right"><a href='logout.jsp'>Log out</a></div>

<%

try{
	String pmin = "";
	String pmax = "";
	String departure = "";
	String arrival = "";
	String airline = "";
	String domint = "";
	String sortby = "";
	String archive = "";
	String startdate = "";
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	java.util.Date d = new java.util.Date();
	String today = sdf.format(d);
	
	%>
<br>
	<form>
	Sort By:
		<select name="sortby" size=1>
			<option value="">(none)</option>
			<option value="GROUP BY Fare, FlightNumber">Price (low-high)</option>
			<option value="GROUP BY airlineID, FlightNumber">Airline (alphabetical)</option>
			<option value="GROUP BY DepartureTime, FlightNumber">Departure Date</option>
		</select>&nbsp;<br>
	<br>
	<table>
	<tr>    
	<td>Price Min:</td><td><input type="number" name="pmin" value=""></td>
	</tr>
	<tr>
	<td>Price Max:</td><td><input type="number" name="pmax" value=""></td>
	</tr>
	<tr>
	<td>Origin Airport:</td><td><input type="text" name="departure" value=""></td>
	</tr>
	<tr>
	<td>Destination Airport:</td><td><input type="text" name="arrival" value=""></td>
	</tr>
	<tr>
	<td>Date (YYYY-MM-DD):</td><td><input type="text" name="startdate" value=""></td>
	</tr>
	<tr>
	<td>Airline Search:</td><td><input type="text" name="airline" value=""></td>
	</tr>
	<tr>
	<td></td><td><input type="radio" name="domint" value="" checked="checked">All | 
										<input type="radio" name="domint" value="dom">Domestic | 
										<input type="radio" name="domint" value="int">International</td>
	</tr>
	<tr></tr>
	<tr><td>Archive View:</td></tr>
	<tr><td></td><td><input type="radio" name="archive" value="y" checked="checked">Only Future Flights | 
										<input type="radio" name="archive" value="">ALL Flights</td></tr>
	</table>
<br>
	<input type="submit" value="Search">
	</form>
	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();	
		pmin = request.getParameter("pmin");
		pmax = request.getParameter("pmax");
		if (pmax.compareTo("") == 0)
			pmax = "9999999";
		departure = request.getParameter("departure");
		arrival = request.getParameter("arrival");
		startdate = request.getParameter("startdate");
		startdate = startdate.replaceAll("-", "");
		
		airline = request.getParameter("airline");
		domint = request.getParameter("domint");
		sortby = request.getParameter("sortby");		
		archive = request.getParameter("archive");
		if (archive.compareTo("y") == 0)
			archive = "AND DepartureTime>" + today;
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		Connection conn = db.getConnection();
		
		Statement statement = con.createStatement();
			String command = "SELECT FlightNumber, Fare, airlineID, departingFrom, arrivingTo, DepartureTime, ArrivalTime, dom_int FROM Flight WHERE fare<'" + pmax + "' AND fare>'" + pmin + "' AND departingFrom LIKE '%" + departure + "%' AND arrivingTo LIKE '%" + arrival + "%' AND airlineID LIKE '%" + airline + "%' AND dom_int LIKE '%" + domint + "%' AND DepartureTime>'" + startdate + "' " + archive + sortby;
		
		ResultSet result = statement.executeQuery(command);

		//Make an HTML table to show the results in:
		out.print("<table border='1'>");

		//make a row
		out.print("<tr>");
		
		//make a column
		out.print("<td>");
		out.print("Flight #");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("Price");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("Airline");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("From");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Destination");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("Departure Date");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Arrival Date");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Domestic/International");
		out.print("</td>");
		
		out.print("</tr>");
		

		//parse out the results
		while (result.next()) {
			//userid = result.getString("userid");
			
			//make a row
			out.print("<tr>");
			
			//make a column
			out.print("<td>");
			out.print(result.getInt("FlightNumber"));
			%>
			<form method = "post" action = "customerReservation.jsp">	
				<input type="hidden" name="FlightNum" value = "<%=result.getInt("FlightNumber")%>" />
				<input type="submit" value="Details" />							
			</form>
			<%
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print(result.getInt("Fare"));
			out.print("</td>");

			out.print("<td>");			
			out.print(result.getString("airlineID"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getString("departingFrom"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("arrivingTo"));
			out.print("</td>");

			out.print("<td>");			
			out.print(result.getDate("DepartureTime"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getDate("ArrivalTime"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getString("dom_int"));
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
		
		result.close();

		statement.close();
		con.close();
} catch (Exception e){
	
}

%>
<br><br>
<a href="success.jsp">Home</a>


</body>
