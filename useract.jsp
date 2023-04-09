<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       
      Connection co = null;
        try{

        String user=null;
         co = databasecon.getconnection();
        Statement st = co.createStatement();
        ResultSet rs = st.executeQuery("select * from users where username= '"+username+"' and password='"+password+"' and status='Authorized'");
        if(rs.next())
        {      
        
        session.setAttribute("username",username);
        response.sendRedirect("userhome.jsp?m1=success");
        }
        else 
        {
        response.sendRedirect("user.jsp?m2=LoginFail");
        }
        }
        catch(Exception e)
        {
        System.out.println("Error in emplogact"+e.getMessage());
        }
        %>