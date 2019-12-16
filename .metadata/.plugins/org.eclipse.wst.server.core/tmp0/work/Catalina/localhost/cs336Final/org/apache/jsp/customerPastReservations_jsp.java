/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.96
 * Generated at: 2019-12-13 16:37:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.cs336.pkg.*;
import java.text.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class customerPastReservations_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("Welcome ");
      out.print(session.getAttribute("user"));
      out.write("\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<table>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<th><a href=\"customerFlights.jsp\">Flights</a></th>\n");
      out.write("\t\t<th><a href=\"customerAdvancedSearch.jsp\">Advanced Search</a></th>\n");
      out.write("\t\t<th><a href=\"customerUpcomingReservations.jsp\">Upcoming Reservations</a></th>\n");
      out.write("\t\t<th><a href=\"customerPastReservations.jsp\">Past Reservations</a></th>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("\n");
      out.write("<h1>Past Reservations</h1>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div align=\"right\"><a href='logout.jsp'>Log out</a></div>\n");
      out.write("\n");


try{
	String userid = "";
	
      out.write("\n");
      out.write("\t\t<form>\n");
      out.write("\t\tEnter Your Username:<br><input type=\"text\" name=\"user\"><br>\n");
      out.write("\t\t<input type=\"submit\", value=\"See my past flights\">\n");
      out.write("\t\t</form>\n");
      out.write("\t");

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


      out.write("\n");
      out.write("<br><br>\n");
      out.write("<a href=\"success.jsp\">Home</a>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
