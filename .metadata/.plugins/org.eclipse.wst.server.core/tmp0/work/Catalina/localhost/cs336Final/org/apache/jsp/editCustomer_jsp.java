/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.96
 * Generated at: 2019-12-06 06:52:35 UTC
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

public final class editCustomer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>Edit Customer</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\t<h1 align=\"center\">Edit customer</h1>\n");
      out.write("\t\n");
      out.write("\t<div align=\"right\"> <b> Logged in as \n");
      out.write("\t");
      out.print(session.getAttribute("user"));
      out.write("\n");
      out.write("\t</b> <br>\n");
      out.write("\t<a href='logout.jsp'>Log out</a>\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("\t");
 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//PreparedStatement ps = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = db.getConnection();
	
	//Statement statement = conn.createStatement();
	
	//ResultSet result = statement.executeQuery(query);
	
	
	//if (rs.next()) {
	//	String user = rs.getString("username");
	//	String password = rs.getString("password");
	
	
      out.write("\n");
      out.write("\t\t<form method=\"post\" action=\"addUser.jsp\">\n");
      out.write("\t\t\n");
      out.write("\t\t<table>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>Enter user</td>\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"username\" maxlength=\"25\"\n");
      out.write("\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>enter password</td>\n");
      out.write("\t\t\t\t<td><input type=\"password\" name=\"password\" maxlength=\"25\"\n");
      out.write("\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>access level</td>\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"access\" maxlength=\"25\"\n");
      out.write("\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t</table>\n");
      out.write("\t\t\t<br> <input type=\"submit\" value=\"Edit\">\n");
      out.write("\t\t</form>\n");
      out.write("\t\t<br><br><br>\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<form method=\"post\" action=\"editCustomerHandler.jsp\">\t\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<table>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>user</td>\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"username\" maxlength=\"25\"\n");
      out.write("\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>password to change</td>\n");
      out.write("\t\t\t\t<td><input type=\"password\" name=\"password\" maxlength=\"25\"\n");
      out.write("\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t</table>\n");
      out.write("\t\t\t<br> <input type=\"submit\" value=\"Edit\">\n");
      out.write("\t\t</form>\n");
      out.write("\t\t<br><br><br>\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<br>\n");
      out.write("\t\t\n");
      out.write("\t\t<form method=\"post\" action=\"editCustomerHandler2.jsp\">\n");
      out.write("\t\t\n");
      out.write("\t\t<table>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>user to change</td>\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"username\" maxlength=\"25\"\n");
      out.write("\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>password</td>\n");
      out.write("\t\t\t\t<td><input type=\"password\" name=\"password\" maxlength=\"25\"\n");
      out.write("\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t</table>\n");
      out.write("\t\t\t<br> <input type=\"submit\" value=\"Edit\">\n");
      out.write("\t\t</form>\n");
      out.write("\t\t<br><br><br>\n");
      out.write("\t\t\n");
      out.write("\t\t\t\t<form method=\"post\" action=\"deleteUser.jsp\">\n");
      out.write("\t\t\n");
      out.write("\t\t<table>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>Enter user to delete</td>\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"username\" maxlength=\"25\"\n");
      out.write("\t\t\t\trequired></td>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t</table>\n");
      out.write("\t\t\t<br> <input type=\"submit\" value=\"Edit\">\n");
      out.write("\t\t</form>\n");
      out.write("\t\t<br><br><br>\n");
      out.write("\t");

		
	//} else { fan
	//	out.println("Username doesn't exist.");
	//}
	
	//rs.close();
	//Statement.close();
	conn.close();

      out.write("\n");
      out.write("<br><a href=\"success.jsp\"> Home</a>\n");
      out.write("\t\t\t\n");
      out.write("</body>\n");
      out.write("</html>");
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