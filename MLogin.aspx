<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MLogin.aspx.cs" Inherits="MLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
        <title>Login | Member</title>
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
</head>
<body  class="authentication-bg"> 
    <form id="form1" runat="server">
    <div>
        <div class="account-pages my-5 pt-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div>

                            <div class="text-center authentication-logo mb-4">
                               <h1>Society & More</h1>
                                <br />
                                <h5>Member Login</h5>
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
                                    <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-primary btn-lg width-lg btn-rounded" OnClick="btnLogin_Click" />
                                </div>
                        </div>
                        <!-- end card -->

                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <p class="text-muted">Goto Admin Page <a href="LoginPage.aspx" class="text-dark ml-1">Admin Login</a></p>
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
    </form>
</body>
</html>
