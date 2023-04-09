<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>

<%@ page session="true" %>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       
      
        try{

        String user=null;
       Connection co = null;
    
  
       
        co=databasecon.getconnection();
       Statement st = co.createStatement();
        ResultSet rs = st.executeQuery("select * from services where sname= '"+username+"' and sname='"+password+"' ");
        if(rs.next())
        {      
        
        session.setAttribute("username",username);
        response.sendRedirect("stationhome.jsp?m1=success");
        }
        else 
        {
        response.sendRedirect("service.jsp?m2=LoginFail");
        }
        }
        catch(Exception e)
        {
        System.out.println("Error in emplogact"+e.getMessage());
        }
        %>