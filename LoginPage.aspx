<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" EnableEventValidation="false" ValidateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8" />
        <title>Login | Society</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/city.png">

        <!-- Bootstrap select pluings -->
        <link href="assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/app.min.css" rel="stylesheet" type="text/css"  />
    <style> hr {
        position: relative;
        top: 50px;
        border: none;
        height: 2px;
        background: #808080;
        margin-bottom: 30px;
    }</style>

</head>
    
<body  class="authentication-bg"> 
 <section>
     <!-- Image and text -->
<nav class="navbar fixed-top navbar-dark" style="background-color:#6334a7; justify-content-between">
  <a class="navbar-brand" href="#">
    <img src="assets/images/citysmall.png" width="45" height="30" class="d-inline-block align-center" alt="">
      Society & More
      </a>
    <a>
    <a class="btn btn-primary js-scroll-trigger" href="#form1">Admin Login</a>
  </a>
       
</nav>
     <div class="container pt-5">
         <div class="col-md-12 text-center pt-4">
             <div class="d-inline-block">
                 <img src="assets/images/city.png" />
             </div>
             <div class="d-inline-block logo_name">
                 <h1>Society & More<br>
                     <small>The complete Society Management Solution</small></h1>
             </div>
         </div>
         <br />

         <div class="row align-items-center pt-4">
             <div class="col" align="center">
                 <p>
                     <img src="https://assets.societynmore.com/public/images/index/viral-marketing.png">
                    &nbsp;&nbsp;<b>Online Voting </b>
                 </p>
             </div>
             <div class="col" align="center">
                 <p>
                     <img src="https://assets.societynmore.com/public/images/index/sos.png">
                     &nbsp;&nbsp;<b>Help Desk </b>
                 </p>
             </div>
           <div class="col" align="center">
                 <p>
                     <img src="https://assets.societynmore.com/public/images/index/visitor.png">
                     &nbsp;&nbsp;<b>Facility Booking</b>
                 </p>
             </div>
            <div class="col" align="center">
                 <p>
                     <img src="https://assets.societynmore.com/public/images/index/computer.png">
                     &nbsp;&nbsp;<b>Society Payment </b>
                 </p>
             </div>
            <div class="col" align="center">
                 <p>
                     <img src="https://assets.societynmore.com/public/images/index/computer-1.png">
                     &nbsp;&nbsp;<b>Reports </b>
                 </p>
             </div>
            
         </div>
     </div>

  
</section>
    <!-- page divide -->
    
    <br />
    <form id="form1" runat="server">
    <div>
        <div class="account-pages my-5 pt-5">
            <div class="container">
                <div class="">
                    <div class="">
                        <div>
                            <div class="text-center authentication-logo mb-4">
                               <h1>Society & More
                               <br />
                                <small class="text-muted">The complete Society Management Solution</small>
                                </h1>
                                <br />
                                <br />
                                
                            </div>
                                <div class="form-group mb-3">
                                    <label for="emailaddress">Email address</label>
                                      <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your Email"></asp:TextBox>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="password">Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Your password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group mb-3">
                                   <asp:CheckBox ID="CheckBox1" runat="server"></asp:CheckBox>
                                        <label for="CheckBox1">Remember me</label>
                                </div>

                                <div class="form-group text-center mb-3">
                                 <asp:Button ID="btnLogin" runat="server" Text="Sign In" 
                                        CssClass="btn btn-primary btn-lg width-lg btn-rounded" 
                                        onclick="btnLogin_Click" />
                                </div>

                        </div>
                        <!-- end card -->

                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <p class="text-muted">Goto Member Page<a href="MLogin.aspx" class="text-dark ml-1">Member Login</a></p>
                            </div>
                        </div>
                        <!-- end row -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->
    

        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- Bootstrap select plugin -->
        <script src="assets/libs/bootstrap-select/bootstrap-select.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>
    </div>
        <!--footer>
            <style>
                p.a {
                    text-align: center;
                }

                h2.t {
                    text-align: center;
                }
            </style>

            <p class="a">&copy; <%: DateTime.Now.Year %> - Made by Abhimanyu R | 20CS1A1001</p>
        </!--footer-->
    </form>
</body>
</html>