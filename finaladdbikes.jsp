<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>

<%@ page session="true" %>



<%

    String l = request.getParameter("s1");
    String n = request.getParameter("s2");
    
    int m = Integer.parseInt(request.getParameter("val")); 
   
    int a = 0;
    int b = 0;
    int c= 0;
    String am = null;
      Connection co = databasecon.getconnection();
    try{
        
               
        
   
  
       PreparedStatement ps1 = co.prepareStatement("update allocate set nob = "+a+" where sname = '"+n+"'");
       ps1.executeUpdate();
       
       
       
       String q = "select * from allocate where sname = '"+l+"'";
       Statement st1 = co.createStatement();
       ResultSet rs = st1.executeQuery(q);
       
       if(rs.next()){
           
        String   b1 = rs.getString("nob");
        b = Integer.parseInt(b1);
           
           c  = b+m;
       
       Statement st = co.createStatement();
       PreparedStatement ps = co.prepareStatement("update allocate set nob = "+c+" where sname = '"+l+"'");
       ps.executeUpdate();
       }
       
      

response.sendRedirect("allocate.jsp?m1=success");
        
}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

    
 