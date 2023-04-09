<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>



<%
 Connection co = null;
    String l = request.getParameter("username");
    String m = request.getParameter("pass"); 
    String n = request.getParameter("email");
    String o = request.getParameter("mobile");
    String p = request.getParameter("address");
    String q = request.getParameter("dob");
    String r = request.getParameter("gender");
    String s = request.getParameter("image");
    String status = "waiting";
    
    try{
       
       co = databasecon.getconnection();
       Statement st = co.createStatement();
       PreparedStatement ps = co.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?)");

        ps.setString(1,l);    
        ps.setString(2,m);
        ps.setString(3,n);
        ps.setString(4,o);
        ps.setString(5,p);
        ps.setString(6,q);        
        ps.setString(7,r);
        ps.setString(8,s);
        ps.setString(9,status);
        ps.executeUpdate();

//out.print(Successfully Registered);

response.sendRedirect("user.jsp?m1=success");
out.println("User Registered Successfully");
}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

    
 