<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>

<%@ page session="true" %>



<%

    String l = request.getParameter("sname");
    String m = request.getParameter("username");
    String n = request.getParameter("email");
    String o = request.getParameter("mobile");
    String p = request.getParameter("tm");
    String q = request.getParameter("proof");
    String s = "waiting";
  
 int b=0;
    
    try{
       
       Connection co = null;
    
  
       
        co=databasecon.getconnection();
       Statement st = co.createStatement();
       
        PreparedStatement pst=co.prepareStatement("select * from allocate where sname='"+l+"'  ;");
        ResultSet rs=pst.executeQuery();
       
       while(rs.next()){
           
           String nob = rs.getString(3);
           b = Integer.parseInt(nob);
       }
       
       if (b <1){
           response.sendRedirect("msg.jsp?m2=success");
       }
       else {
       PreparedStatement ps = co.prepareStatement("insert into bookings values(?,?,?,?,?,?,?)");

        ps.setString(1,m);    
        ps.setString(2,l);
        ps.setString(3,n);    
        ps.setString(4,o);
        ps.setString(5,p);    
        ps.setString(6,q);
        ps.setString(7,s);
        
        ps.executeUpdate();

//out.print(Successfully Registered);

response.sendRedirect("userhome.jsp?m2=success");
       }
}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

    
 