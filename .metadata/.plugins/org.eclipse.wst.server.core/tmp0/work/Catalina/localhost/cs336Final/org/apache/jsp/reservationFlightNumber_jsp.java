/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.96
 * Generated at: 2019-12-11 09:00:04 UTC
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
import javax.servlet.http.*;
import javax.servlet.*;

public final class reservationFlightNumber_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("<title>Viewing Reservations by Flight</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div align=\"right\"> <b> Logged in as \n");
      out.print(session.getAttribute("username"));
      out.write(' ');
      out.write('(');
      out.print(session.getAttribute("userType") );
      out.write(").\n");
      out.write("</b> <br>\n");
      out.write("<a href='logout.jsp'>Log out</a>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<h3>Flight Information</h3>\n");
      out.write("<div align='right'><a href=\"success.jsp\">Go Back Home</a></div> <br>\n");
      out.write("\n");
      out.write("<h4>List of reservations for\n");
      out.print(request.getParameter("flightNumber"));
      out.write("\n");
      out.write("</h4>\n");
      out.write("\n");


/* try{ */

		String FlightNumber = request.getParameter("FlightNumber");

		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		PreparedStatement ps = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = db.getConnection();
		
		Statement statement = conn.createStatement();
		
		/* Big ass query.  Joins tables and merges days_occurs into one column */
		String command = "SELECT * FROM Reservation WHERE FlightNumber = '"+FlightNumber+"'";
		ResultSet result = statement.executeQuery(command);

		/*"+ request.getParameter("username") +"  */
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
		out.print("Reservation Number");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Reservation Date");
		out.print("</td>");
		
		
		//make a column
		out.print("<td>");
		out.print("Meal");
		out.print("</td>");
		

		
		//make a column
		/* out.print("<td>");
		out.print("Ticket ID");
		out.print("</td>"); */
		
		//make a column

		
		//make a column
		out.print("<td>");
		out.print("Fare");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		out.print("Booking Fee");
		out.print("</td>");
		

		//make a column
		out.print("<td>");
		out.print("class");
		out.print("</td>");
		
		
		//make a column
		out.print("<td>");
		out.print("Domestic/International");
		out.print("</td>");
		
		out.print("</tr>");
		
		
		//parse out the results
		while (result.next()) {
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print(result.getString("userid"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("ReservationNumber"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("DateBooked"));
		out.print("</td>");
		/* out.print("<td>");			
		out.print(result.getString("ticketID"));
		out.print("</td>"); */
		out.print("<td>");
		out.print(result.getString("SpecialMeal"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("TotalFare"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("BookingFee"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		Statement stat = con.createStatement();
		ResultSet res = stat.executeQuery("SELECT dom_int FROM Flight WHERE FlightNumber = '" + result.getString("FlightNumber")+ "'");
		if (res.next())
		{
			out.print("<td>");
			out.print(res.getString("dom_int"));
			out.print("</td>");
		}
		res.close();
		out.print("</tr>");
	}
	out.print("</table>");
	
	result.close();
	statement.close();
	con.close();
		
/* } catch (Exception e){
	
} */


      out.write("\n");
      out.write("\n");
      out.write("<br><br><br>\n");
      out.write("<a href=\"success.jsp\">Back to Customer Rep Home</a>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
