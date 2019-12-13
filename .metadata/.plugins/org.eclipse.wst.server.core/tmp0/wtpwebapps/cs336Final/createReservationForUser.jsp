<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
	//String url = "jdbc:mysql://cs336db.cdnjviplnzua.us-east-2.rds.amazonaws.com:3306/BarBeerDrinkerSample";
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Connection conn = null;
	PreparedStatement ps = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = db.getConnection();
		%>
		<form method = "post" action = "reservationHandler.jsp">
		<select name = "user" size = 1>
			<% 
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT userid FROM accounts");
		
		while (rs.next())
		{
			%>
			<option value = "<%= rs.getString(1) %>"> <%= rs.getString(1) %></option>
			<%
		}%>
		</select>	
		<% 
		 st = conn.createStatement();
		 ResultSet result = st.executeQuery("SELECT * from Flight");
				out.print("select a user to make a reservation for");
				
		//Make an HTML table to show the results in:
				out.print("<table border='1'>");

				//make a row
				out.print("<tr>");
				
				//make a column
				out.print("<td>");
				out.print("Flight Number");
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
				out.print("Fare");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Reserve");
				out.print("</td>");
				
				out.print("</tr>");
				
				
				//parse out the results
				while (result.next()) {
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					out.print(result.getString("FlightNumber"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("dom_int"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("departingFrom"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("DepartureTime"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("arrivingTo"));
					out.print("</td>");
					out.print("<td>");			
					out.print(result.getString("ArrivalTime"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getInt("Fare"));
					out.print("</td>");
					out.print("<td>");
					%>
							
							<select name = "Class" size = 1>
								<option value = "economy"> Economy </option>
								<option value = "first"> First Class </option>
								<option value = "business"> Business </option>
							</select><br>
							Special Meal: <input type = "text" name = "SpecialMeal">
							<input type="hidden" name="user" value = "<%=session.getAttribute("user")%>" />	
							<input type="hidden" name="Fare" value = "<%=result.getInt("Fare")%>" />	
							<input type="hidden" name="FlightNumber" value = "<%=result.getInt("FlightNumber")%>" />
							<input type="submit" value="Reserve" />							
						</form>
					<% 
					out.print("</td>");
				}
				out.print("</table>");
				
				result.close();
				st.close();
				con.close();
		

	} catch(Exception e) {
        out.print("<p>Error connecting to MYSQL server.</p>");
        e.printStackTrace();
    }
%>
<br><br><br>
<a href="success.jsp">Back home</a>