

<%@page import="Efficient.mail"%>
<%@page import="java.util.Random"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>

<%@ page session="true" %>



<%

    String sname = session.getAttribute("username").toString();
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    
    
    
    String status = "Accepted";
    int a = 0;
    int b = 1;
    int c =0;
 String a1= "";
    
  Random rand = new Random();
int r1 = rand.nextInt(100000); 
 String msg="r1";
    try{
       
      Connection co = databasecon.getconnection();
       
       String q = "select * from allocate where sname = '"+sname+"'";
       Statement st1 = co.createStatement();
       ResultSet rs = st1.executeQuery(q);
       
       if(rs.next()){
           
           
           a1 = rs.getString("nob");
           a=Integer.parseInt(a1);
           
       }
       
       
       c = a-b;
       
       Statement st = co.createStatement();
       PreparedStatement ps = co.prepareStatement("update bookings set status = '"+r1+"' where username = '"+username+"' and sname = '"+sname+"' and status = 'waiting'");
       ps.executeUpdate();
       
       PreparedStatement ps1 = co.prepareStatement("update allocate set nob = "+c+" where  sname = '"+sname+"'");
       ps1.executeUpdate();

mail m= new mail();
       m.secretMail(msg, email, email);

response.sendRedirect("vr.jsp?m1=success");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

    
 