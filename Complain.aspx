<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="Complain.aspx.cs" Inherits="Complain" %>

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
                                <li class="breadcrumb-item active">Complain</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Complain</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Make Complain</h4>
                            <div class="form-group">
                                <label for="emailAddress">Subject<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSubject" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtSubject" CssClass="form-control" placeholder="Enter Subject" runat="server"></asp:TextBox>
                             </div>
                             <div class="form-group">
                                <label for="pass1">Complain<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtComplain" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                 <asp:TextBox ID="txtComplain" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Complain" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group text-right mb-0">
                                 <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                     CssClass="btn btn-primary waves-effect waves-light mr-1" 
                                     CausesValidation="true" onclick="btnSubmit_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">My Complain</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterSociety" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead class="bg-info text-white">
                                                <tr>
                                                    <th>#</th>
                                                    <th>Subject</th>
                                                    <th>Complain</th>
                                                    <th>Status</th>
                                                    <th>Replay</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("Subject")%></td>
                                            <td><%# Eval("Complain")%></td>
                                            <td><%# Eval("Status")%></td>
                                            <td><%# Eval("Replay")%></td>
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

