<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="SocietyPayment.aspx.cs" Inherits="SocietyPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="container-fluid">
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="#">Society&More</a></li>
                                <li class="breadcrumb-item active">Society Payment</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Society Payment</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">Society Payment Data</h4>
                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterUser" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Bill&nbsp;No</th>
                                                    <th>Member&nbsp;Name</th>
                                                    <th>Bill&nbsp;Date</th>
                                                    <th>Generation&nbsp;Date</th>
                                                    <th>Amount</th>
                                                    <th>Status</th>  
                                                    <th>Pay</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("BillNo")%></td>
                                            <td><%# Eval("MemberName")%></td>
                                            <td><%# Eval("BillDate","{0:dd-MM-yyyy}")%></td>
                                            <td><%# Eval("GenerationDate","{0:dd-MM-yyyy}")%></td>
                                            <td><%# Eval("Amount")%></td>
                                            <td><%# Eval("Status")%></td>
                                              <td>
                                                <a class="btn btn-success btn-sm" href="SocietyPay.aspx?Id=<%#Eval("Id") %>">
                                                    <i class="fas fa-pen"></i>
                                                    Pay
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

