<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<body>
<%
	//String url = "jdbc:mysql://cs336db.cdnjviplnzua.us-east-2.rds.amazonaws.com:3306/BarBeerDrinkerSample";

	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		%>
		<form method = "post" action = "customerFlightChangesHandler.jsp">
			<table border ="3" width "20%" cellpadding = "3" style = "color:black">
			<tr>
			<td>Username</td>
			<td>
			<%
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st;
			ResultSet rs;
			%>
			<select name = "userid" size = 1>
			<% 
			
			st = con.createStatement();
			rs = st.executeQuery("SELECT userid FROM accounts");
			
			while (rs.next())
			{
				%>
				<option value = "<%= rs.getString(1) %>"> <%= rs.getString(1) %></option>
				<%
			}
			%>
			</select>
			<%
			st = con.createStatement();
			rs = st.executeQuery("SELECT FlightNumber FROM Flight");
			%>
			<tr>
			<td>Flight Number</td>
			<td>
			<select name = "flightNum" size = 1>
			<%while (rs.next())
			{
				%>
				<option value = "<%=rs.getInt(1)%>"> <%=rs.getInt(1)%> </option>
				<%
			}
			%>
			
			<select name = "Type" size = 1>
			<option value = "one-way"> One Way </option>
			<option value = "round-trip"> Round Trip </option>
			
			</select>
			
			<select name = "Class" size = 1>
			<option value = "economy"> Economy </option>
			<option value = "first"> First Class </option>
			<option value = "business"> Business </option>
			</select>
			
			<td><input type = "text" name = "SpecialMeal"></td>
			
			
			<%
	}
	catch (Exception e)
	{
		out.println("Lulz");
	}
			%>
		</form>
			</select>
			</td>
			<input type = "submit" value = "Done">
			</tr>
	</body>