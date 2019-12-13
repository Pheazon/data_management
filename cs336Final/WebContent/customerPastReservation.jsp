<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.text.*,java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


Welcome <%=session.getAttribute("user")%>
<br>
<br>
<table>
	<tr>
		<th><a href="customerFlights.jsp">Flights</a></th>
		<th><a href="customerUpcomingReservations.jsp">Upcoming Reservations</a></th>
		<th><a href="customerPastReservations.jsp">Past Reservations</a></th>
	</tr>
</table>
<br>


<h1>Past Reservations</h1>
<body>

<div align="right"><a href='logout.jsp'>Log out</a></div>

<%

try{
	String userid = "";
	%>
		<form>
		Enter Your Username:<br><input type="text" name="user"><br>
		<input type="submit", value="See my past flights">
		</form>
	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();	
		userid = request.getParameter("user");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		java.util.Date d = new java.util.Date();
		String today = sdf.format(d);
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		PreparedStatement ps = null;

		Connection conn = db.getConnection();
		
		Statement statement = con.createStatement();
		String command = "SELECT r.DateBooked, r.ReservationNumber, r.TotalFare, f.DepartureTime, f.ArrivalTime, r.FlightNumber, r.type, f.departingFrom, f.arrivingTo, f.airlineID, r.class, f.dom_int FROM Flight f, Reservation r WHERE r.userid='" + userid + "' AND r.FlightNumber = f.FlightNumber AND f.ArrivalTime<'" + today + "'";
		
		ResultSet result = statement.executeQuery(command);

		//Make an HTML table to show the results in:
		out.print("<table border='1'>");

		//make a row
		out.print("<tr>");
		
		//make a column
		out.print("<td>");
		out.print("Booked On");
		out.print("</td>");


		//make a column
		out.print("<td>");
		out.print("Reservation #");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Price");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Departed On");
		out.print("</td>");


		//make a column
		out.print("<td>");
		out.print("Arrived On");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Flight Number");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Type");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("From");
		out.print("</td>");


		//make a column
		out.print("<td>");
		out.print("To");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Airline");
		out.print("</td>");

		//make a column
		out.print("<td>");
		out.print("Class");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Dom/Int");
		out.print("</td>");
		
		out.print("</tr>");
		

		//parse out the results
		while (result.next()) {
			//userid = result.getString("userid");
			
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(result.getDate("r.DateBooked"));
			out.print("</td>");

			out.print("<td>");			
			out.print(result.getInt("r.ReservationNumber"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getInt("r.TotalFare"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getDate("f.DepartureTime"));
			out.print("</td>");

			out.print("<td>");			
			out.print(result.getDate("f.ArrivalTime"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getInt("r.FlightNumber"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getString("r.type"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("f.departingFrom"));
			out.print("</td>");

			out.print("<td>");			
			out.print(result.getString("f.arrivingTo"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getString("f.airlineID"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getString("r.class"));
			out.print("</td>");
			
			out.print("<td>");			
			out.print(result.getString("f.dom_int"));
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
