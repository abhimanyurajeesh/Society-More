<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ComplainPage.aspx.cs" Inherits="ComplainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="AdminDashBoard.aspx">Society&More | Admin</a></li>
                                <li class="breadcrumb-item active">Complain</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Complain</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            <!-- end row -->
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">Complain Data</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterSociety" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead class="bg-info text-white">
                                                <tr>
                                                    <th>#</th>
                                                    <th>Member Id</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Mobile No</th>
                                                    <th>Subject</th>
                                                    <th>Complain</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("MemberId")%></td>
                                            <td><%# Eval("Name")%></td>
                                            <td><%# Eval("Email")%></td>
                                            <td><%# Eval("MobileNo")%></td>
                                            <td><%# Eval("Subject")%></td>
                                            <td><%# Eval("Complain")%></td>
                                           <td>
                                                <a class="btn btn-success btn-sm" href="ComplainReplay.aspx?Id=<%#Eval("Id") %>">
                                                    <i class="fas fa-reply"></i>
                                                    Replay
                                                </a></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                     </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- end col -->

            </div>
        </div>
    </div>
</asp:Content>

