<%@page import="java.sql.*"%>
<%@page import="databasecon.Dbconnection"%>
<%@ page session="true" %>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       
      
        try{

        String user=null;
        Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from services where sname= '"+username+"'");
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