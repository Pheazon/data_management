<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Orders by Customer</title>
</head>
<body>



<div align="right"><a href='logout.jsp'>Log out</a></div>


<h3>Revenue</h3>

<h4>Revenue from customer: <%=request.getParameter("userid")%></h4>
<%

try{
		String userid = request.getParameter("userid");
		int totalRev = 0;
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		PreparedStatement ps = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = db.getConnection();
		
		Statement statement = con.createStatement();
		String command = "SELECT userid, sum(TotalFare) tf, sum(BookingFee) bf FROM Reservation WHERE userid = '"+userid+"'";
		
		ResultSet result = statement.executeQuery(command);

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
		out.print("Total Fare");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Total Booking Fee");
		out.print("</td>");
		
		
		out.print("</tr>");
		

		//parse out the results
		while (result.next()) {
			
			userid = result.getString("userid");
			
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(result.getString("userid"));
			out.print("</td>");

			

			out.print("<td>");			
			out.print(result.getString("tf"));
			out.print("</td>");
			out.print("<td>");			
			out.print(result.getString("bf"));
			out.print("</td>");
			out.print("</tr>");
			
			totalRev = totalRev + result.getInt("bf");
		}
		out.print("</table>");
		
		out.println("<br><br>Generated $"+totalRev+" from customer " + userid);
		result.close();

		statement.close();
		con.close();
} catch (Exception e){
	
}

%>
<br><br>
<a href="success.jsp">Back Back Home</a>


</body>
</html>