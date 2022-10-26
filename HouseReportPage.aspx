<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="HouseReportPage.aspx.cs" Inherits="HouseReportPage" %>

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
                                <li class="breadcrumb-item"><a href="#">Society&More</a></li>
                                <li class="breadcrumb-item active">House Report</li>
                            </ol>
                        </div>
                        <h4 class="page-title">House Report</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <!-- Inline Form -->
                            <h4 class="header-title">House Reports</h4>
                            <div class="form-row align-items-center">
                                <div class="col-auto">
                                    <label class="sr-only" for="autoSizingInputEmail">Society</label>
                                    <asp:TextBox ID="txtSelectSociety" CssClass="form-control mt-2" placeholder="Enter Society" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-auto">
                                    <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-success waves-effect waves-light mt-2" OnClick="btnView_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">House Data</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterUser" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Society Name</th>
                                                    <th>Block No</th>
                                                    <th>House No</th>
                                                    <th>House Type</th>
                                                    <th>Details</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("SocietyName")%></td>
                                            <td><%# Eval("NoOfHouse")%></td>
                                            <td><%# Eval("BlockNo")%></td>
                                            <td><%# Eval("HouseType")%></td>
                                            <td><%# Eval("Details")%></td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="DeleteHouse.aspx?Id=<%#Eval("Id") %>">
                                                    <i class="fas fa-trash"></i>
                                                    Delete
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

