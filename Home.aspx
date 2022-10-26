<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

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
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div>
                        <h4 class="u">USER PAGE</h4>

                    </div>
                    <section>
                        <!-- Image and text -->

                        <div class="container pt-5">
                            <div class="col-md-12 text-center">
                                <div class="d-inline-block">
                                    <img src="assets/images/citysmall.png" />
                                </div>
                                <style>
                                    .u {
                                        color: #432360;
                                        margin-top: +1em;
                                    }
                                </style>
                                <div class="d-inline-block logo_name">
                                    <h1>Society & More<br>
                                        <small class="u">The complete Society Management Solution</small></h1>
                                    <br />
                                    <h1>Welcomes you,
                                        <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></h1>
                                </div>
                            </div>
                            <!--IMAGE-->
                            <div class="row  pt-5">
                                <div class="col" align="center">

                                    <img src="https://assets.societynmore.com/public/images/index/viral-marketing.png">
                                </div>
                                <div class="col" align="center">

                                    <img src="https://assets.societynmore.com/public/images/index/sos.png">
                                </div>
                                <div class="col" align="center">
                                    <p>
                                        <img src="https://assets.societynmore.com/public/images/index/visitor.png">
                                    </p>
                                </div>
                                <div class="col" align="center">
                                    <p>
                                        <img src="https://assets.societynmore.com/public/images/index/computer.png">
                                    </p>
                                </div>
                                <div class="col" align="center">
                                    <p>
                                        <img src="https://assets.societynmore.com/public/images/index/computer-1.png">
                                    </p>
                                </div>
                                <div class="col" align="center">
                                    <p>

                                        <img src="https://assets.societynmore.com/public/images/index/review.png">
                                    </p>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
             
        </div>
        <!-- end container-fluid -->       
    </div>

</asp:Content>

