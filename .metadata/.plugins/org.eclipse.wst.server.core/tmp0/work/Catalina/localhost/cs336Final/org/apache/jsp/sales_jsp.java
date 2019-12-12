/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.96
 * Generated at: 2019-12-12 04:33:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.cs336.pkg.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class sales_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!--Import some libraries that have classes that we need -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"ISO-8859-1\">\n");
      out.write("<title>Sales</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<form method=\"post\" action=\"saleReport.jsp\">\t\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<table>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>Month (format MM)</td>\n");
      out.write("\t\t\t\t<td><input type=\"date\" name=\"month\" maxlength=\"2\" required></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>Year (format YYYY)</td>\n");
      out.write("\t\t\t\t<td><input type=\"date\" name=\"year\" maxlength=\"4\"\n");
      out.write("\t\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t</table>\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<br> <input type=\"submit\" value=\"Search\">\n");
      out.write("\t</form>\n");
      out.write("\t<br><br>\n");
      out.write("\t\n");
      out.write("\t");

	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st;
	ResultSet rs;
	
      out.write("\n");
      out.write("\t<b>Find Flight Reservation by: </b>\n");
      out.write("\t<form method=\"post\" action=\"reservationCustomer.jsp\">\n");
      out.write("\t\tCustomer's Name (First Last)<input type=\"text\" name=userid>\n");
      out.write("\t<input type=\"submit\" value=\"Search\">\n");
      out.write("\t</form>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t<form method=\"post\" action=\"reservationFlightNumber.jsp\">\n");
      out.write("\t\tFlight Number (Ex. 2221) <input type=\"text\" name=FlightNumber>\n");
      out.write("\t<input type=\"submit\" value=\"Search\">\n");
      out.write("\t</form>\n");
      out.write("\t<h3>Sales and Revenue</h3>\n");
      out.write("\n");
      out.write("<div>\n");
      out.write("\t<b>Get revenue summary of: </b>\n");
      out.write("\t<form method=\"post\" action=\"revenueFlight.jsp\">\n");
      out.write("\t\tA flight (Ex. 'UA2221') <input type=\"text\" name=flight>\n");
      out.write("\t<input type=\"submit\" value=\"Calculate\">\n");
      out.write("\t</form>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t<form method = \"post\" action =\"revenueAirline.jsp\">\n");
      out.write("\t<tr>\n");
      out.write("\t<td>Pick the Airline to find its revenue</td>\n");
      out.write("\t<td>\n");
      out.write("\t<select name = \"airline\" size = 1>\n");
      out.write("\t");
 
	
	st = con.createStatement();
	rs = st.executeQuery("SELECT Id FROM Airline");
	
	while (rs.next())
	{
		
      out.write("\n");
      out.write("\t\t<option value = \"");
      out.print( rs.getString(1) );
      out.write('"');
      out.write('>');
      out.write(' ');
      out.print( rs.getString(1) );
      out.write("</option>\n");
      out.write("\t\t");

	}
	st.close();
	rs.close();
	
      out.write("\n");
      out.write("\t</select>\n");
      out.write("\t<input type=\"submit\" value=\"Submit\">\n");
      out.write("\t</form>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("<!-- \t<form method=\"post\" action=\"../ManagerFunctionality/RevenueByCity.jsp\">\n");
      out.write("\t\tA destination city (Ex. 'Newark', 'Atlanta', 'Tokyo') <input type=\"text\" name=city>\n");
      out.write("\t<input type=\"submit\" value=\"Calculate\">\n");
      out.write("\t</form> -->\n");
      out.write("\t\n");
      out.write("\t<form method=\"post\" action=\"revenueCustomer.jsp\">\n");
      out.write("\t\tA customer (by username12) <input type=\"text\" name=userid>\n");
      out.write("\t<input type=\"submit\" value=\"Calculate\">\n");
      out.write("\t</form>\n");
      out.write("\t\n");
      out.write("\t<form method = \"post\" action =\"listFlights.jsp\">\n");
      out.write("\t<tr>\n");
      out.write("\t<td>Pick the Airport</td>\n");
      out.write("\t<td>\n");
      out.write("\t<select name = \"airport\" size = 1>\n");
      out.write("\t");
 
	
	st = con.createStatement();
	rs = st.executeQuery("SELECT Id FROM Airport");
	
	while (rs.next())
	{
		
      out.write("\n");
      out.write("\t\t<option value = \"");
      out.print( rs.getString(1) );
      out.write('"');
      out.write('>');
      out.write(' ');
      out.print( rs.getString(1) );
      out.write("</option>\n");
      out.write("\t\t");

	}
	st.close();
	rs.close();
	
      out.write("\n");
      out.write("\t</select>\n");
      out.write("\t<input type=\"submit\" value=\"Submit\">\n");
      out.write("\t</form>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t<tr>\n");
      out.write("\t");
 
	
	st = con.createStatement();
	rs = st.executeQuery("SELECT COUNT(FlightNumber),FlightNumber FROM Reservation GROUP BY FlightNumber ORDER BY COUNT(*) DESC");
	out.print("<table border='1'>");

	//make a row
	out.print("<tr>");

	out.print("<td>");
	out.print("Flight Number");
	out.print("</td>");

	
	out.println("<td>");
	out.print("# of tickets bought");
	while (rs.next())
	{
		
		out.println("<tr>");
		out.println("<td>");
		out.println(rs.getString("FlightNumber"));
		out.println("</td>");
		out.println("<td>");
		out.println(rs.getInt(1));
		out.println("</td>");
		out.println("</tr>");
	}
	out.print("</tr>");
	st.close();
	rs.close();
	
      out.write("\n");
      out.write("\t\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\n");
      out.write("<br><br>\n");
      out.write("<a href=\"revenueMostByCustomer.jsp\">Most Revenue Generated By A Customer</a>\n");
      out.write("<br><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t<tr>\n");
      out.write("\n");
      out.write("\t\n");
      out.write("\t<td><a href=\"success.jsp\">Go Back Home</a></td>\n");
      out.write("\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
