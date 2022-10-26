<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="FacilityPage.aspx.cs" Inherits="FacilityPage" %>

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
                                <li class="breadcrumb-item"><a href="AdminDashBoard.aspx">Society&More</a></li>
                                <li class="breadcrumb-item active">Facility Book</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Facility Book</h4>
                         <div class="col-auto">
                                
                                </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">Facility Book Data</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterUser" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Facility&nbsp;Name</th>
                                                    <th>From&nbsp;Date</th>
                                                    <th>To&nbsp;Date</th>
                                                    <th>From&nbsp;Time</th>
                                                    <th>To&nbsp;Time</th>
                                                    <th>Descrpition</th>
                                                    <th>Society&nbsp;Name</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("FacilityName")%></td>
                                            <td><%# Eval("FacilityDateFrom","{0:dd-MM-yyyy}")%></td>
                                            <td><%# Eval("FacilityDateTill","{0:dd-MM-yyyy}")%></td>
                                            <td><%# Eval("FacilityTimeFrom")%></td>
                                            <td><%# Eval("FacilityTimeTill")%></td>
                                            <td><%# Eval("Descrpition")%></td>
                                            <td><%# Eval("SocietyName")%></td>
                                            <td><%# Eval("Status")%></td>
                                            <td>
                                                <a class="btn btn-success btn-sm" href="FacilityUpdate.aspx?Id=<%#Eval("Id") %>">
                                                    <i class="fas fa-reply"></i>
                                                    Edit
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

