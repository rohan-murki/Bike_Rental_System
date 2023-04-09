


<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>

<%@ page session="true" %>



<%

    String l = request.getParameter("sname");
     String m = request.getParameter("bname");
     String l1 = "";
       String o = request.getParameter("nob");
       int sn1 = Integer.parseInt(o);
       int sn3 = 0;
       int sn2 = 0;
       
       String stn = "";
  String sn = "";
   Connection co = null;
    
    try{
       
        co=databasecon.getconnection();
        
        PreparedStatement pst=co.prepareStatement("select * from allocate where sname='"+l+"'  ;");
        ResultSet rs=pst.executeQuery();
         while(rs.next()){
              stn = rs.getString(1);
        sn = rs.getString(3);
        
        
        sn2 = Integer.parseInt(sn);
        
        
         }
        
          if(l.equals(stn)){
               sn3 = sn2+sn1;
              PreparedStatement ps1 = co.prepareStatement("update allocate set nob='"+sn3+"' where sname='"+l+"' ");
              ps1.executeUpdate();
              response.sendRedirect("allocate.jsp?m1=success");
         }
         
          else{
       Statement st = co.createStatement();
       PreparedStatement ps = co.prepareStatement("insert into allocate values(?,?,?)");

        ps.setString(1,l);    
        ps.setString(2,""); 
        ps.setString(3,o); 
        ps.executeUpdate();
           
     

response.sendRedirect("allocate.jsp?m1=success");
    }}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

    
 