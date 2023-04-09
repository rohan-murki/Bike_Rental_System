<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>

<%@ page session="true" %>



<%


    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String status = "Authorized";
 
    
    try{
       
       Connection co = databasecon.getconnection();
       Statement st = co.createStatement();
       PreparedStatement ps = co.prepareStatement("update users set status = '"+status+"' where username = '"+username+"' and email = '"+email+"'");


        
        ps.executeUpdate();



response.sendRedirect("viewusers.jsp?m1=success");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

    
 