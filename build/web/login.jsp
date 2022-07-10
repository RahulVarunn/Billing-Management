<!-- * @author RAHUL and SHREYA (INTERNSHIP PROJECT)-->


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin.css">
    
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script><!-- comment -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Admin</title>
</head>


<body style="background-color: #222;">
    
    
<!--    TOAST TO SHOW WELCOME WHILE THE USER OPEN A PAGE FORA A FIRST TIME OR WHILE RELOAD-->
    
<div style="position:absolute" class="toast align-items-center mt-3 start-50 translate-middle-x" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true">
<div class="d-flex">
      <div class="toast-body  ">
          <%if(session.getAttribute("warning")!=null){%>
                 <%=session.getAttribute("warning")%>
           
          <%}else{%>
                  Hello , Admin Please Login

          <%}%>
      </div>
</div>
</div> 
    
  




<div class="container-fluid vh-100 ">
    <div class="row row-cols-auto d-flex justify-content-center align-items-center h-100 ">
<!--   IMAGE DIV     -->
    <div class=" col-lg-4 col-md-5 col-sm-3  " >
        
        <img src="image/img1.png" class="img-fluid" alt="" srcset="">       
    </div>
        
    <div class="col-lg-4 col-md-8 col-sm-9 offset-lg-1 " style="background-color: #222;">
        
<!--    FORM TO ENTER INTO HOME PAGE....THIS FORM OPEN ADMMIN_VERIFIVATION JSP...TO VALIDATE PASSWARD AND REDIRECT TO HOME PAGE    -->
        <form action="admin_verification" method="post">  
            <p class="text-center text-light mb-5 fw-bolder fs-4">WELCOME</p> 
            <div class="input-group input-group-md mb-2 mt-3">
                <input type="password" name="pass" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="Enter a Passowrd">
            </div>
        <center>       
       <button type="submit" class="btn mt-3 btn-light btn-sm ps-4 pe-4 " >LOGIN</button>
       <button type="button" class="btn mt-3 btn-light btn-sm ps-4 pe-4 ms-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">SETTING</button>
        </center>   
        </form>

          
    </div>
    </div>
</div>
        


<!-- MODAL ITS USED TO LOGIN TO ADMIN CONTROL THIS MODEL REDIRECT TO ADMIN_CONTROL.JSP FILE AFTER VALIDATING PROCESS -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog">
   <div class="modal-content">
        <div class="modal-header">

        <h5 class="modal-title" id="staticBackdropLabel">LOGIN</h5>

      </div>
      <div class="modal-body">
        
          <form action="admin_control.jsp" method="post">
              
              <div class="input-group mb-3">
                  <input type="password" name="password" class="form-control" placeholder="Enter Password or Web Id" aria-label="Example text with button addon" aria-describedby="button-addon1" required>
   
   
  <button class="btn btn-outline-dark" type="submit" id="button-addon1">Login</button>
  <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>

</div>
              <h6 class="text-danger" style="font-size: 10px;">IN CASE OF U FORGET UR LOGIN PASSWORD PLEASE CONTACT UR SOFTWARE PROVIDER</h6>
            
          </form>
          
      </div>
     
    </div>
  </div>
</div>
      
        



<!--SCRIPT FOR TOAST-->

<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>