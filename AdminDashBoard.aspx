<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminDashBoard.aspx.cs" Inherits="AdminDashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <!-- Start Content-->
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                 <li class="breadcrumb-item"><a href="AdminDashBoard.aspx">Society&More | Admin</a></li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Welcome Admin <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>!</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->


            <div class="row">

                <div class="col-xl-3 col-md-6">
                    <div class="card widget-box-two bg-primary">
                        <div class="card-body">
                            <a href ="SocietyPage.aspx">
                            <div class="media">
                                <div class="media-body wigdet-two-content">
                                    <p class="m-0 text-uppercase text-white" title="Statistics">No. of Society</p>
                                    <h2 class="text-white"><asp:Label ID="lblSociety" runat="server" Text="0"></asp:Label></h2>
                                </div>
                                <div class="avatar-lg rounded-circle bg-soft-light ml-2 align-self-center">
                                    <i class="mdi mdi-home-modern font-22 avatar-title text-white"></i>
                                </div>
                            </div>
</a>
                        </div>
                    </div>
                </div>
                <!-- end col -->

                <div class="col-xl-3 col-md-6">
                    <div class="card widget-box-two bg-danger">
                        <div class="card-body">
                            <a href ="HousePage.aspx">
                            <div class="media">
                                <div class="media-body wigdet-two-content">
                                    <p class="m-0 text-white text-uppercase" title="User Today">No. of House</p>
                                    <h2 class="text-white">
                                        <asp:Label ID="lblHouse" runat="server" Text="0"></asp:Label></h2>
                                </div>
                                <div class="avatar-lg rounded-circle bg-soft-light ml-2 align-self-center">
                                    <i class="mdi mdi-home  font-22 avatar-title text-white"></i>
                                </div>
                            </div>
                                </a>
                        </div>
                    </div>
                </div>
                <!-- end col -->

                <div class="col-xl-3 col-md-6">
                    <div class="card widget-box-two bg-warning">
                        <div class="card-body">
                            <a href ="ComplainPage.aspx">
                            <div class="media">
                                <div class="media-body wigdet-two-content">
                                    <p class="m-0 text-uppercase text-white" title="Request Per Minute">Complains</p>
                                    <h2 class="text-white"><asp:Label ID="lblComplain" runat="server" Text="0"></asp:Label></h2>
                                </div>
                                <div class="avatar-lg rounded-circle bg-soft-light ml-2 align-self-center">
                                    <i class="mdi mdi-timetable font-22 avatar-title text-white"></i>
                                </div>
                            </div>
                                </a>
                        </div>
                    </div>
                </div>
                <!-- end col -->

                <div class="col-xl-3 col-md-6">
                    <div class="card widget-box-two bg-success">
                        <div class="card-body">
                            <a href ="UserPage.aspx">
                            <div class="media">
                                <div class="media-body wigdet-two-content">
                                    <p class="m-0 text-white text-uppercase" title="New Downloads">Admins</p>
                                    <h2 class="text-white"><asp:Label ID="lblUser" runat="server" Text="0"></asp:Label></h2>
                                </div>
                                <div class="avatar-lg rounded-circle bg-soft-light ml-2 align-self-center">
                                    <i class="mdi mdi-account-multiple font-22 avatar-title text-white"></i>
                                </div>
                            </div>
                                </a>
                        </div>
                    </div>
                </div>
                <!-- end col -->
                 <div class="col-xl-3 col-md-6">
                    <div class="card widget-box-two bg-primary">
                        <div class="card-body">
                            <a href="FacilityPage.aspx">
                                <div class="media">
                                    <div class="media-body wigdet-two-content">
                                        <p class="m-0 text-white text-uppercase">Facilities Booked</p>
                                        <h2 class="text-white">
                                            <asp:Label ID="lblfacl" runat="server" Text="0"></asp:Label></h2>
                                    </div>
                                    <div class="avatar-lg rounded-circle bg-soft-light ml-2 align-self-center">
                                        <i class="mdi mdi-book-multiple font-22 avatar-title text-white"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- end col -->
                <div class="col-xl-3 col-md-6">
                    <div class="card widget-box-two bg-danger">
                        <div class="card-body">
                            <a href="MemberReport.aspx">
                                <div class="media">
                                    <div class="media-body wigdet-two-content">
                                        <p class="m-0 text-white text-uppercase">Members</p>
                                        <h2 class="text-white">
                                            <asp:Label ID="lblmemb" runat="server" Text="0"></asp:Label></h2>
                                    </div>
                                    <div class="avatar-lg rounded-circle bg-soft-light ml-2 align-self-center">
                                        <i class="mdi mdi-account-box font-22 avatar-title text-white"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- end col -->
                 <div class="col-xl-3 col-md-6">
                    <div class="card widget-box-two bg-warning">
                        <div class="card-body">
                            <a href="SocietyPaymentM.aspx">
                                <div class="media">
                                    <div class="media-body wigdet-two-content">
                                        <p class="m-0 text-white text-uppercase">Payments</p>
                                        <h2 class="text-white">
                                            <asp:Label ID="lblpay" runat="server" Text="0"></asp:Label></h2>
                                    </div>
                                    <div class="avatar-lg rounded-circle bg-soft-light ml-2 align-self-center">
                                        <i class="mdi mdi-cash-multiple font-22 avatar-title text-white"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- end col -->
                  <div class="col-xl-3 col-md-6">
                    <div class="card widget-box-two bg-success">
                        <div class="card-body">
                            <a href="PollReport.aspx">
                                <div class="media">
                                    <div class="media-body wigdet-two-content">
                                        <p class="m-0 text-white text-uppercase" title="New Downloads">No. of votes</p>
                                        <h2 class="text-white">
                                            <asp:Label ID="lblpol" runat="server" Text="0"></asp:Label></h2>
                                    </div>
                                    <div class="avatar-lg rounded-circle bg-soft-light ml-2 align-self-center">
                                        <i class="mdi mdi-account-multiple font-22 avatar-title text-white"></i>
                                    </div>
                                </div>
                            </a>
                        </div>  
                    </div>
                </div>
                <!-- end col -->

            </div>
            <!-- start page title -->
          
            

        </div>
        <!-- end container-fluid -->
    </div>
</asp:Content>

