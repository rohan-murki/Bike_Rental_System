<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>


<%


    String m = "";
    String n = " ";
    String o = "";
    String p = request.getParameter("nob");
    int sn1 = Integer.parseInt(p);
  int sn3 = 0;
       int sn2 = 0;
       
       String stn = "";
  String sn = "";
  Connection co = null;
    
    try{
       
        co=databasecon.getconnection();
         PreparedStatement pst=co.prepareStatement("select * from bikes  ;");
        ResultSet rs=pst.executeQuery();
         while(rs.next()){
              
        sn = rs.getString(4);
        
        
        sn2 = Integer.parseInt(sn);
        
        
         }
        
          if(sn != ""){
               sn3 = sn2+sn1;
              PreparedStatement ps1 = co.prepareStatement("update bikes set nob='"+sn3+"'  ");
              ps1.executeUpdate();
              response.sendRedirect("addbikes.jsp?m1=success");
         }
          
          else{
       Statement st = co.createStatement();
       PreparedStatement ps = co.prepareStatement("insert into bikes values(?,?,?,?)");


        ps.setString(1,"");
         ps.setString(2,"");
          ps.setString(3,o);
           ps.setString(4,p);
        
        ps.executeUpdate();

//out.print(Successfully Registered);

response.sendRedirect("addbikes.jsp?m1=success");

}}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

    
 