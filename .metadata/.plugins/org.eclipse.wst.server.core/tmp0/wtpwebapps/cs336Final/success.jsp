<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user")%> 
<br>
<br><%
if ((Integer)session.getAttribute("access") == 2)
{
	out.println("To create customer rep account click ");%>
	<br>
	<a href = 'customerRepRegister.jsp'>Customer Rep</a>
	<br>
	
	<%out.println("To Check an Sales Report click on: "); %>
	<a href="sales.jsp">Sale Report</a>
	<br>
	
	<%out.println("To add,edit or delete click on: "); %>
	<a href="editCustomer.jsp">edit User</a>
	<br>
<% 	

}
else if ((Integer)session.getAttribute("access")== 1)
{
	out.println("You're a customer rep");%>
	<br>
	
	<a href = 'customerFlightChanges.jsp'>List a flight</a>
	<br>
	<br>
	<a href = 'customerRepRegister.jsp'>Make flight reservation for customer</a>
	<% 
}
%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>