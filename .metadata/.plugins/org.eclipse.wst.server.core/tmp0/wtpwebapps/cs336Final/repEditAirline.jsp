<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.Timestamp"%>


<br>
	<form>
	Sort By:
	<br>
	<table>
	<tr>
	<td><input type="radio" name="editType" value="add">Add | 
										<input type="radio" name="editType" value="delete">Delete
	</td>
	</tr>
	<tr>    
	<td>Enter Airline: </td><td><input type="text" name="airline" value=""></td>
	</tr>
	</table>
	<input type="submit" value="Edit">
	</form>
	<br>
<%
	//String url = "jdbc:mysql://cs336db.cdnjviplnzua.us-east-2.rds.amazonaws.com:3306/BarBeerDrinkerSample";
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Connection conn = null;
	PreparedStatement ps = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = db.getConnection();
		String editType = request.getParameter("editType");
		String airline = request.getParameter("airline");
		
		if (editType.compareTo("add") == 0) {
		String insert = "INSERT INTO Airport '" + airline + "'";
		ps = conn.prepareStatement(insert);
		out.print(request.getParameter("user"));
		}
		else if (editType.compareTo("delete") == 0) {
		String insert = "DELETE FROM Airport '" + airline + "'";
		ps = conn.prepareStatement(insert);
		out.print(request.getParameter("user"));
		ps.setString(1, request.getParameter("airport"));
		}
		int result = 0;
        result = ps.executeUpdate();

        %><br><a href="success.jsp">Back home</a><br>
    	<a href="customerFlights">Back to FLights and Reservations page</a>
    	<% 
	
	} catch(Exception e) {
        out.print("<p>Error connecting to MYSQL server.</p>");
        e.printStackTrace();
        out.print(e.getMessage());
    } finally {
        try { ps.close(); } catch (Exception e) {}
        try { con.close(); } catch (Exception e) {}
    }
%>
<br><br><br>
<a href="success.jsp">Back home</a>