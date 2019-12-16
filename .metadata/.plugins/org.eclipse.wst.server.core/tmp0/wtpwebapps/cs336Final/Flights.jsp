<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Customer</title>
</head>
<body>

	
	<div align="right"> <b> Logged in as 
	<%=session.getAttribute("username")%>
	</b> <br>
	<a href='logout.jsp'>Log out</a>
	</div>
	
	<h1>List of the flights you selected</h1>
	<table border="1">
	<tr>
	<td>Flight Number</td>
	<td>Fare</td>
	<td>Airline Id</td>
	<td>Departure Time</td>
	<td>Arrival Time</td>
	<td>Domestic/International</td>
	<td>Departing From</td>
	<td>Arriving To</td>
	
	</tr>
	
	<% 
	try {
		
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	PreparedStatement ps = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = db.getConnection();
	String FlightType = request.getParameter("command");
	
	 String departAir =request.getParameter("DepartAir");
     String arriveAir =request.getParameter("ArriveAir");
     
    String startDateStr = request.getParameter("tripStart");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//surround below line with try catch block as below code throws checked exception
	//Date startDate = sdf.parse(startDateStr);
	try {
	    java.sql.Date startdate = new java.sql.Date(sdf.parse(startDateStr).getTime());
	} catch (ParseException e) {
	    e.printStackTrace();
	}
	
	String endDateStr = request.getParameter("tripEnd");
	SimpleDateFormat edf = new SimpleDateFormat("yyyy-MM-dd");
	//surround below line with try catch block as below code throws checked exception
	//Date startDate = sdf.parse(startDateStr);
	try {
	    java.sql.Date enddate = new java.sql.Date(edf.parse(endDateStr).getTime());
	} catch (ParseException e) {
	    e.printStackTrace();
	}
	System.out.println(endDateStr.toString());
			
			
	//surround below line with try catch block as below code throws checked exception
	//startDate = sdf.parse(startDateStr);

     String Finalquery  = ""; 
     String query1= "";
     
     String basequery ="select FlightNumber, Fare, airLineID, DepartureTime, dom_int, ArrivalTime, departingFrom, arrivingTo from Flight ";
     
     if ( FlightType.equals("OneWay"))
     {
      	query1= " where departingFrom != arrivingTo " ;
     }
     else {
         query1= " where departingFrom = arrivingTo ";
     }
    
                
     String query2 = " and departingFrom = '"+ departAir + "'" + " and arrivingTo= '" + arriveAir + "'";
     
     String DateQuery = " and DepartureTime >= '"+  startDateStr + "'" + " AND ArrivalTime <= '" + endDateStr + "'";
	
    // Finalquery =basequery.concat(query1.concat(query2));
    Finalquery =basequery + query1 +query2+DateQuery;
     System.out.println(Finalquery);
	
	Statement statement = con.createStatement();

	ResultSet rs = statement.executeQuery(Finalquery);
	
	
	while(rs.next()){
		%>
		
		
		
		<tr>
		<td><%=rs.getInt("FlightNumber") %></td>
		<td><%=rs.getInt("Fare") %></td>
		<td><%=rs.getString("AirlineID") %></td>
		<td><%=rs.getDate(4).toString() %></td>
		<td><%=rs.getDate(6).toString() %></td>
		<td><%=rs.getString("dom_int") %></td>
		<td><%=rs.getString("departingFrom") %></td>
		<td><%=rs.getString("arrivingTo") %></td>
		</tr>

		<% 
	}

	//close the connection.
	db.closeConnection(con);
} catch (Exception e) {
	out.print(e);
}
	
	%>
			
</body>
</html>