<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="PasswordPage.aspx.cs" Inherits="PasswordPage" %>

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
                                <li class="breadcrumb-item active">Change Password</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Change Password</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Change Password</h4>
                            <div class="form-group">
                                <label for="emailAddress">Current Password<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCurrentPassword" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtCurrentPassword" CssClass="form-control" placeholder="Enter Current Password" runat="server"></asp:TextBox>
                                 </div>
                             <div class="form-group">
                                <label for="pass1">New Password<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNewPassword" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                 <asp:TextBox ID="txtNewPassword" CssClass="form-control" TextMode="Password" placeholder="Enter New Password" runat="server"></asp:TextBox>
                            </div>
                              <div class="form-group">
                                <label for="pass1">Confrim Password<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtConfrimPassword" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                 <asp:TextBox ID="txtConfrimPassword" CssClass="form-control" placeholder="Enter Confrim Password" runat="server"></asp:TextBox>
                                  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfrimPassword" Display="Dynamic" ErrorMessage="Password Not Match" CssClass="text-danger"></asp:CompareValidator>
                            </div>
                            <div class="form-group text-right mb-0">
                                 <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                     CssClass="btn btn-warning waves-effect waves-light mr-1" 
                                     CausesValidation="true" onclick="btnUpdate_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

