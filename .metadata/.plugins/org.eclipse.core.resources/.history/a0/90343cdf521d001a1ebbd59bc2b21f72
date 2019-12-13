<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Viewing Reservations by Flight</title>
</head>
<body>






<a href='logout.jsp'>Log out</a>



<h4>List of reservations for
<%=request.getParameter("FlightNumber")%>
</h4>

<%

/* try{ */

		String FlightNumber = request.getParameter("FlightNumber");

		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		PreparedStatement ps = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = db.getConnection();
		
		Statement statement = conn.createStatement();
		

		String command = "SELECT * FROM Reservation WHERE FlightNumber = '"+FlightNumber+"'";
		ResultSet result = statement.executeQuery(command);

		/*"+ request.getParameter("username") +"  */
		//Make an HTML table to show the results in:
				out.print("<table border='1'>");

		//make a row
		out.print("<tr>");
		
		//make a column
		out.print("<td>");
		out.print("userid");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Reservation Number");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Reservation Date");
		out.print("</td>");
		
		
		//make a column
		out.print("<td>");
		out.print("Meal");
		out.print("</td>");
		

		
		//make a column
		/* out.print("<td>");
		out.print("Ticket ID");
		out.print("</td>"); */
		
		//make a column

		
		//make a column
		out.print("<td>");
		out.print("Fare");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Booking Fee");
		out.print("</td>");
		

		//make a column
		out.print("<td>");
		out.print("class");
		out.print("</td>");
		
		
		//make a column
		out.print("<td>");
		out.print("Domestic/International");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		//parse out the results
		while (result.next()) {
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print(result.getString("userid"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("ReservationNumber"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("DateBooked"));
		out.print("</td>");
		/* out.print("<td>");			
		out.print(result.getString("ticketID"));
		out.print("</td>"); */
		out.print("<td>");
		out.print(result.getString("SpecialMeal"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("TotalFare"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("BookingFee"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		Statement stat = con.createStatement();
		ResultSet res = stat.executeQuery("SELECT dom_int FROM Flight WHERE FlightNumber = '" + result.getString("FlightNumber")+ "'");
		if (res.next())
		{
			out.print("<td>");
			out.print(res.getString("dom_int"));
			out.print("</td>");
		}
		res.close();
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
<a href="success.jsp">Back to Customer Rep Home</a>


</body>
</html>

