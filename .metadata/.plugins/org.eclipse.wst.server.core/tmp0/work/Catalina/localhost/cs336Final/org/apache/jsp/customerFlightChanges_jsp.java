/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.96
 * Generated at: 2019-12-11 04:14:41 UTC
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

public final class customerFlightChanges_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<body>\n");

	//String url = "jdbc:mysql://cs336db.cdnjviplnzua.us-east-2.rds.amazonaws.com:3306/BarBeerDrinkerSample";

	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
      out.write("\n");
      out.write("\t\t<form method = \"post\" action = \"customerFlightChangesHandler.jsp\">\n");
      out.write("\t\t\t<table border =\"3\" width \"20%\" cellpadding = \"3\" style = \"color:black\">\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t<td>Username</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t");

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st;
			ResultSet rs;
			
      out.write("\n");
      out.write("\t\t\t<select name = \"userid\" size = 1>\n");
      out.write("\t\t\t");
 
			
			st = con.createStatement();
			rs = st.executeQuery("SELECT userid FROM accounts");
			
			while (rs.next())
			{
				
      out.write("\n");
      out.write("\t\t\t\t<option value = \"");
      out.print( rs.getString(1) );
      out.write('"');
      out.write('>');
      out.write(' ');
      out.print( rs.getString(1) );
      out.write("</option>\n");
      out.write("\t\t\t\t");

			}
			
      out.write("\n");
      out.write("\t\t\t</select>\n");
      out.write("\t\t\t");

			st = con.createStatement();
			rs = st.executeQuery("SELECT FlightNumber FROM Flight");
			
      out.write("\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t<td>Flight Number</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t<select name = \"flightNum\" size = 1>\n");
      out.write("\t\t\t");
while (rs.next())
			{
				
      out.write("\n");
      out.write("\t\t\t\t<option value = \"");
      out.print(rs.getInt(1));
      out.write('"');
      out.write('>');
      out.write(' ');
      out.print(rs.getInt(1));
      out.write(" </option>\n");
      out.write("\t\t\t\t");

			}
			
      out.write("\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<select name = \"Type\" size = 1>\n");
      out.write("\t\t\t<option value = \"one-way\"> One Way </option>\n");
      out.write("\t\t\t<option value = \"round-trip\"> Round Trip </option>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</select>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<select name = \"Class\" size = 1>\n");
      out.write("\t\t\t<option value = \"economy\"> Economy </option>\n");
      out.write("\t\t\t<option value = \"first\"> First Class </option>\n");
      out.write("\t\t\t<option value = \"business\"> Business </option>\n");
      out.write("\t\t\t</select>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<td><input type = \"text\" name = \"SpecialMeal\"></td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t");

	}
	catch (Exception e)
	{
		out.println("Lulz");
	}
			
      out.write("\n");
      out.write("\t\t</form>\n");
      out.write("\t\t\t</select>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<input type = \"submit\" value = \"Done\">\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t</body>");
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
