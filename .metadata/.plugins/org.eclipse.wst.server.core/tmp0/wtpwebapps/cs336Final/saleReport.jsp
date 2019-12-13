<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Sales Report</title>
</head>
<body>

<h3>Monthy Sales</h3>

<h4>Sales Report for <%=request.getParameter("month") %>/<%=request.getParameter("year") %></h4>
<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();

	PreparedStatement ps = null;

try{


	String month = request.getParameter("month");
	String year = request.getParameter("year");
	int revenue1 = 0;
	int revenue2 = 0;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = db.getConnection();
	
	Statement statement = con.createStatement();
	String command = "SELECT * FROM Reservation WHERE MONTH(DateBooked) = '"+month+"'	AND YEAR(DateBooked) = "+year+"";
	ResultSet result = statement.executeQuery(command);

	
	//Make an HTML table to show the results in:
	out.print("<table border='1'>");

	//make a row
	out.print("<tr>");

	out.print("<td>");
	out.print("Reservation Date");
	out.print("</td>");
	
	//make a column
	out.print("<td>");
	out.print("Fare");
	out.print("</td>");
	
	//make a column
	out.print("<td>");
	out.print("Booking Fee");
	out.print("</td>");





	int tot = 0;
		
	
	while (result.next()) {
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td align=center>");
		out.print(result.getString("DateBooked"));
		out.print("</td>");

		out.print("<td align=center>");
		out.print(result.getString("TotalFare"));
		out.print("</td>");
		
		out.print("<td align=center>");
		out.print(result.getString("BookingFee"));
		out.print("</td>");
		out.print("<td>");



		
		revenue1 = revenue1 + result.getInt("BookingFee");
		revenue2 = revenue2 + result.getInt("TotalFare");
		tot = revenue1 + revenue2;
	}
	out.print("</table>");
	
	out.println("<br>Revenue generated in Booking fees this month is $"+revenue1);
	out.println("<br>Revenue generated in Fares this month is $"+revenue2);
	
	out.println("<br>Total Revenue Generated is $"+ tot);
	
	result.close();
	statement.close();
	con.close();
} catch (Exception e){
	
}
%>
<br><br><br>
<a href="success.jsp">Back to Home</a>


</body>
</html>