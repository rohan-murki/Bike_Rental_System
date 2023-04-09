<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>


<%

    String l = request.getParameter("stationname");
   String l1 =  l.toUpperCase();
  
  
 Connection co = null;
    
    try{
       
        co=databasecon.getconnection();
       Statement st = co.createStatement();
       PreparedStatement ps = co.prepareStatement("insert into services values(?)");

        ps.setString(1,l1);    
        
        ps.executeUpdate();

//out.print(Successfully Registered);

response.sendRedirect("addservices.jsp?m1=success");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

    
 