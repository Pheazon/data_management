<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
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

<h1 >Flights MANAGEMENT</h1>

<h2>Search for Flight</h2>

<form method="post" action="Flights.jsp">

  <input type="radio" name="command" value="OneWay"/>One-Way
  <br> <br>
  <input type="radio" name="command" value="RoundTrip"/>Round-Trip
  <br> <br>
 
   
  <br>   
  <br>
  
  
	  Departure Airport   
	  <input name="DepartAir" type="text"  value="Enter Departure Air port">
	  <br><br>

	   Arrival Airport 
	  <input name="ArriveAir" type="text" value="Enter Arrival Airport">
	  <br><br>
  
  <br>
  <input type="submit" value="submit" />
</form>
<br>
</form>
<br>
<% } %>