<!-- * @author RAHUL and SHREYA (INTERNSHIP PROJECT)-->

<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home</title>

<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<link rel="stylesheet" href="style.css">

</head>
<body>

<!--NAVIGATION BAR-->

<nav class="nav_css navbar navbar-expand-lg  navbar-light  fixed-top"  >
        <div class="container-fluid">
        <a class="navbar-brand text-capitalize fw-normal fs-5" href="#" style="color: aliceblue;">HELLO, <%=session.getAttribute("admin")%></a>
        <button style="color: aliceblue;" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        </ul>           
        <form class="d-flex">    
        <div class="input-group ">
        <input type="text" class="form-control" placeholder="Enter Name or Phone no" name="search_box" aria-label="Example text with two button addons">      
        <button class="btn btn-outline-secondary" type="submit" name="search">Search</button>
        <button class="btn btn-outline-danger me-4" type="submit" name="close">Close</button>
        <button class="btn  btn-light btn-sm ps-4 pe-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" >ADD CUSTOMER</button>
        </div>
        </form>            
        </div>
        </div>
</nav>
<br><br><br>




    
 
    
<% if(request.getParameter("search")!=null){%>
   <h4 class="ms-3">SEARCH RESULT</h4>       
   <div class="card-group mb-4" style="border-bottom: 2px solid grey;">
       
<!--SEARCH CUSTOMER-->

<% 
//  Getting data from data base  

String search=request.getParameter("search_box");
String a="select * from customer where  name=? or phone=?";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
pst.setString(1,search);
pst.setString(2, search);
ResultSet x=pst.executeQuery();

while(x.next()){%>


        <div style="display:inline-block">
        <form  action="details.jsp"method="get">
        <div class="card m-2 shadow-sm" >
        <div class="card-body">
            <h6 class="card-title"><%=x.getString("name").toUpperCase()%></h6>
            <p class="card-text-sm">Add Product or Details of Customer  </p>
            <p class="card-text-sm">Total Amount : <%=x.getInt("total_amt")%> Rupees </p>
            <p class="card-text-sm">  <br>
            <button class="btn   btn-dark btn-sm ps-4 pe-4  " value="submit" name="btn"> Add Entry!!</button></p>
            <input type="hidden" value="<%=x.getInt("id")%>" name="id">
            <input type="hidden" value="<%=x.getString("name")%>" name="customer">
        </div>
        </div>   
        </form>
        </div>    
<% }%>  
        


  <%  
    //BY CLICKING ON CLOSE BUTTON ITS REMOVE ALL THE SEARCH RESULT   
   }else if(request.getParameter("close")!=null){

}
   %>

     </div>
 
    
    
    
    
    

<!--GETTING CUSTOMERS DATA  -->

<% 
 String countq = "select count(*) from customer";
PreparedStatement  pst_count=database.connection.getConnection().prepareStatement(countq);
      ResultSet rs = pst_count.executeQuery();
      rs.next();
            int count = rs.getInt(1);


%>

<H3 class="ms-4 mt-3">HOME</H3>
<h6 class="ms-4 mb-5">ALL CUSTOMERS (<%=count%>)</h6>

<div class="container-fluid mb-3 " >
  
        
<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4">
                        
<%                 
                    
String a="select * from customer";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
ResultSet x=pst.executeQuery();
while(x.next()){%>

  <div class="col mb-4">


<div class=" card m-2 shadow-sm "  >
    <div class="card-body" >
    <form  action="details.jsp"method="get">

            <h6 class="card-title"><%=x.getString("name").toUpperCase()%> &nbsp;&nbsp;(<%=x.getDate("date")%>)</h6>

            <p class="card-text-sm">Add Product or Details of Customer  </p>
            <p class="card-text-sm">Total Amount : <%=x.getInt("total_amt")%> Rupees </p>
          

            <button class="btn   btn-dark btn-sm ps-4 pe-4  " value="submit" name="btn"> Add Entry!!</button>
            <input type="hidden" value="<%=x.getInt("id")%>" name="id">
            <input type="hidden" value="<%=x.getString("name")%>" name="customer">
            
          
                 </form>
            
            
            
<!--              <form > <input type="submit" value="" />  </form> -->

   
        </div>
            
            
        
        </div>
  </div>


<% }%>  
        
 </div>
</div>
<br><br><br>
<!--GRAPH-->


<div class="fixed-bottom shadow-lg " style="background-color:white;">
<center>
  <button type="button" class=" btn mt-3 btn-outline-dark btn-sm ps-4 pe-4 mb-3" data-toggle="modal" data-target="#myModal">Show Graph</button>
    <a href="login.jsp" class=" btn mt-3 btn-outline-dark btn-sm ps-4 pe-4 mb-3 ms-4" >Logout</a>

</center>

</div>
  <!-- Modal -->

  
  
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalFullscreenLabel" aria-hidden="true" >
  <div class="modal-dialog modal-fullscreen" style="width:max-content">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title h4" id="exampleModalFullscreenLabel">GRAPH</h3>
      </div>
      <div class="modal-body">
          
        <div id="customergrp" style="width:100%;max-width:97%" > </div>
        <div id="customer_pending" style="width:100%;max-width:97%" > </div>
        <div id="customer_paid" style="width:100%;max-width:97%" > </div>
        
        
        <div id="plot_total" style="width:100%;max-width:97%"></div>
        <div id="plot_pend" style="width:100%;max-width:97%"></div>
        <div id="plot_paid" style="width:100%;max-width:97%"></div>

        
        <div id="pie_total" style="width:100%;max-width:97%"></div>
        <div id="pie_pend" style="width:100%;max-width:97%"></div>
        <div id="pie_paid" style="width:100%;max-width:97%"></div>

      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>








<!-- DATA -->

<script> 
    var customer = [];
    var price = []; 
    var customer_paid = [];
    var customer_pending = [];

</script> 



<% 

 a="select * from customer";
PreparedStatement  pst1=database.connection.getConnection().prepareStatement(a);
ResultSet customer=pst1.executeQuery();
while(customer.next()){%>

   <script>customer.push("<%=customer.getString("name") %>"); </script>
   <script>price.push(<%=customer.getString("total_amt")%>); </script>
   <script>customer_paid.push(<%=customer.getString("total_paid")%>); </script>
   <script>customer_pending.push(<%=customer.getString("total_pending")%>); </script>

<%}%>





<!--TOTAL CUSTOMER BAR CHART-->

<script>
var data = [{
  x:price,
  y:customer,
  type:"bar",
  orientation:"h",
  marker: {color:"rgba(255,0,0,0.6)"}
}];
var layout = {title:"CUSTOMER TOTAL(GRAPH)"};
Plotly.newPlot("customergrp", data, layout);
</script>

<!--________________________TOTAL PENDING_______________________-->

<script>
var data = [{
  x:customer_pending,
  y:customer,
  type:"bar",
  orientation:"h",
  marker: {color:"rgba(255,0,0,0.6)"}
}];
var layout = {title:"CUSTOMER PENDING(GRAPH)"};
Plotly.newPlot("customer_pending", data, layout);
</script>

<!--TOTAL PAID-->

<script>
var data = [{
  x:customer_paid,
  y:customer,
  type:"bar",
  orientation:"h",
  marker: {color:"rgba(255,0,0,0.6)"}
}];
var layout = {title:"CUSTOMER PAID(GRAPH)"};
Plotly.newPlot("customer_paid", data, layout);
</script>


<!--___________________________________________________-->


<script>

var data = [{
  x:price,
  y:customer,
  type:"bar"
}];
var layout = {title:"CUSTOMER TOTAL"};
Plotly.newPlot("plot_total", data, layout);
</script>



<script>
var data = [{
  x:customer_pending,
  y:customer,
  type:"bar"
}];
var layout = {title:"CUSTOMER PENDING"};
Plotly.newPlot("plot_pend", data, layout);
</script>




<script>
var data = [{
  x:customer_paid,
  y:customer,
  type:"bar"
}];
var layout = {title:"CUSTOMER PAID"};
Plotly.newPlot("plot_paid", data, layout);
</script>

<!--____________________________________-->



<script>
var data = [{
  values: price,
  labels: customer,
  type: 'pie'
}];

var layout = {title:"CUSTOMER TOTAL"};

Plotly.newPlot('pie_total', data, layout);
</script>

<script>
var data = [{
  values: customer_pending,
  labels: customer,
  type: 'pie'
}];

var layout = {title:"CUSTOMER PENDING"};

Plotly.newPlot('pie_pend', data, layout);
</script>

<script>
var data = [{
  values: customer_paid,
  labels: customer,
  type: 'pie'
}];

var layout = {title:"CUSTOMER PAID"};

Plotly.newPlot('pie_paid', data, layout);
</script>

<!--ADD USER-->



                  <form action="add_customer.jsp"  method="post">

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel" style="background-color: #222; color: white;" >
    <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Add  Customer</h5>
    </div>
    <div class="offcanvas-body mt-5 ">
    <div>

        <div class="mb-2">
          <label  class="col-sm col-form-label me-2">ENTER CUSTOMER NAME : </label>
          <input type="text" name="name" class="form-control form-control-sm" placeholder="Customer name" id="exampleInputEmail1" aria-describedby="emailHelp" required>
        </div>
        <div class="mb-2">
          <label  class="col-sm col-form-label me-2">ENTER ADDRESS : </label>
          <textarea type="text" rows="5px" name="adr" class="form-control form-control-sm" placeholder="Customer address" id="exampleInputPassword1" required></textarea>
        </div>

        <div class="mb-2">
          <label  class="col-sm col-form-label me-2">ENTER PHONE : </label>
          <input type="number" name="phone" class="form-control" placeholder="Customer phone no"   required>
        </div>


 
    
        </div>
        
      
        </div>

        <div  style=" border-top: 5px solid  #1adad0;">
          <center>       
          <button type="submit" class="mt-4 mb-4 btn   btn-light  btn-sm ps-4 pe-4 " name="add" ">SUBMIT</button>
            <button type="button" class="mt-4 mb-4 btn ms-3 btn-light  btn-sm ps-4 pe-4 " data-bs-dismiss="offcanvas" aria-label="Close">CLOSE</button>
 
          </center>  
        </div>
</div>

                  </form>


<!--TOAST-->

<% 
      if(session.getAttribute("action")!=null ){%>
    <div style="position:absolute" class="fixed-top top-0 start-50 translate-middle-x toast align-items-center mt-3 start-50 translate-middle-x" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true">
    <div class="d-flex">
    <div class="toast-body  ">
        <%=session.getAttribute("action") %>   
        <%session.removeAttribute("action");%>   
    </div>
    </div>
    </div>   
<% } %>









<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      

    </body>
       
</html>
