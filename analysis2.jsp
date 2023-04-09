<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Bike Rental System</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Bike Rental System - v4.9.1
  * Template URL: https://bootstrapmade.com/Bike Rental System-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
    <style>
      
  body {
  background-color: rgba(0,0,0,0.5) !important;
}
form {
  width: 25%;
  margin: 20px auto;
  background-color: rgba(0,0,0,0.5) !important;
  padding: 10px 10px 10px 10px;
  text-align: center;
  -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
  box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
}
label {
  display: block;
  position: relative;
  margin: 40px 0px;
}
.label-txt {
  position: absolute;
  top: -1.6em;
  padding: 10px;
  font-family: sans-serif;
  font-size: .8em;
  letter-spacing: 1px;
  color: rgb(120,120,120);
  transition: ease .3s;
  color: orange;
}
.input {
  width: 100%;
  padding: 10px;
  background: transparent;
  border: none;
  outline: none;
  color: white;
}

.line-box {
  position: relative;
  width: 100%;
  height: 2px;
  background: #BCBCBC;
}

.line {
  position: absolute;
  width: 0%;
  height: 2px;
  top: 0px;
  left: 50%;
  transform: translateX(-50%);
  background: #8BC34A;
  transition: ease .6s;
}

.input:focus + .line-box .line {
  width: 100%;
  color:whitesmoke;
}

.label-active {
  top: -3em;
}

button {
  display: inline-block;
  padding: 12px 24px;
  background: rgb(220,220,220);
  font-weight: bold;
  color: rgb(120,120,120);
  border: none;
  outline: none;
  border-radius: 3px;
  cursor: pointer;
  transition: ease .3s;
}

button:hover {
  background: #8BC34A;
  color: #ffffff;
}    
      
      </style>
  
  
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">Bike Rental System</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
       <ul>
          <li><a  href="adminhome.jsp">Home</a></li>
          <li><a href="viewusers.jsp">Users</a></li>
           <li><a href="addservices.jsp">Add Station</a></li>
           <li><a href="vstations.jsp">Stations</a></li>
           <li><a href="addbikes.jsp">Add Bikes</a></li>
            <li><a href="allocate.jsp">Allocate</a></li>
            <li><a class="active" href="analysis.jsp">Analysis</a></li>
             <li><a href="analysis2.jsp">Review</a></li>
          <li><a href="index.html">Logout</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex justify-content-center align-items-center">
    <div class="container position-relative" data-aos="zoom-in" data-aos-delay="100">
    
    </div>
  </section><!-- End Hero -->

  <main id="main">
      <%
          // String branch = request.getParameter("branch");
       int i = 0;
    int j = 0;
    int m = 0;
    int h = 0;
    int k = 0; int l = 0; int fin = 0;
 String   sn = "";
  String  tn = "";
    
    ArrayList al=new ArrayList();
    ArrayList al1=new ArrayList();
    String a = null;
    String b = null;
    String sname = null;
    
       
       
        Connection co = databasecon.getconnection();
       
       String del = "delete from chek";
       Statement st4 = co.createStatement();
       st4.executeUpdate(del);
       
       
       Statement st = co.createStatement();       
       String q = "select distinct tm,sname from bookings where status = 'Accepted'";
       ResultSet rs = st.executeQuery(q);
       
       
       while(rs.next())
       {
        
        sname=rs.getString("sname");       
       
      
                 
      
      
   
           
           String p = "select * from bookings where sname = '"+sname+"' and tm = '"+rs.getString("tm")+"'";
           Statement st3 = co.createStatement();
           ResultSet rs3 = st3.executeQuery(p);
           
        
           
           
           
           
           
            while(rs3.next())
           {
               
             
             m++ ;
             
      
                 
           }
           
           
           PreparedStatement ps = co.prepareStatement("insert into chek values (?,?,?)");
           ps.setString(1, sname);
           ps.setString(2, rs.getString("tm"));
           ps.setInt(3, m);
           ps.executeUpdate();
         
           
             System.out.println("Time"+rs.getString("tm"));
             System.out.println("count"+m);
          
           
           m=0;
           
           
           
            }
       
       /*           Second Stage for finding               */ 
       
       
       
       String ab = "SELECT MAX(val),sname,tm FROM chek";
       Statement st5 = co.createStatement();
       ResultSet rs5 = st5.executeQuery(ab);
       
      
           
          %>
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">
          <br>
          <div class="container">
           <center>
               <h5 style="color:BLack">Maximum No of Vehicles Booking at</h5>
           </center>
  <table class="table table-hover" style=" background-color: rgba(0,0,0,0.5);">
    <thead style="color:white">
     <tr ><th>Station</th>
               <th>Time</th>           
           </tr>
    </thead>
    <tbody style="color:white">
        <%  while(rs5.next()){
            sn = rs5.getString(2);
             tn = rs5.getString(3);
       %>
       <tr><th><%=rs5.getString(2)%></th>
           <th><%=rs5.getString(3)%></th>
           </tr>
     <%}%>
    </tbody>
  </table>
    <br>
     <%  
           
       
       
       
       Statement stw = co.createStatement();   
       String qw = "SELECT MAX(nob) FROM allocate";
       ResultSet rsw = stw.executeQuery(qw);
       
     
        
      if(rsw.next()){
          
          
          
       Statement stwq = co.createStatement();   
       String qwq = "SELECT * FROM allocate where nob = '"+rsw.getString(1)+"'";
       ResultSet rswq = stwq.executeQuery(qwq);   
          
       
       
       
       
       
       if(rswq.next()){
           
           
           
           
       
          
          
     
          
          
          
          
         
        
       
       
       
       
       
       
       
       
       
       
       
       
       %>
       
        <center>
               <h5 style="color:BLack">No of Vehicles are Not Booking at</h5>
           </center>
  <table class="table table-hover" style=" background-color: rgba(0,0,0,0.5);">
    <thead style="color:white">
     <tr ><th>Station</th>
               <th>Available Bikes</th>           
           </tr>
    </thead>
    <tbody style="color:white">
       
       <tr><th><%=rswq.getString(1)%></th>
           <th><%=rswq.getString(3)%></th>
           </tr>
   
    </tbody>
  </table>
     <br>
    <center> <h2><a href="finaladdbikes.jsp?s1=<%=tn%>&s2=<%=rswq.getString(1)%>&val=<%=rswq.getString(3)%>">click here to add bikes from <%=rswq.getString(1)%> to <%=tn%></a></h2></center>
      <%
        }
      }
      
      
      
      
      
      %>
</div>
          

      </div>
    </section><!-- End About Section -->

    <!-- ======= Counts Section ======= -->
  <!-- End Counts Section -->

    <!-- ======= Why Us Section ======= -->
   

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>