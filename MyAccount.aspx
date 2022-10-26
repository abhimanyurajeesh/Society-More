<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box">
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Society&More Profile</a></li>
                            <li class="breadcrumb-item active">My Account</li>
                        </ol>
                    </div>
                    <h4 class="page-title">My Profile</h4>
                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="userName">Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFullName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter Name" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="emailAddress">Email<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red" Display="Dynamic" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAddress">Mobile No<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number.Please Enter Mobile Number" ControlToValidate="txtMobileNo" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="emailAddress">Society Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSocietyName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:TextBox ID="txtSocietyName" runat="server" placeholder="Society Name" CssClass="form-control" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="emailAddress">House No<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBlockNo" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:TextBox ID="txtBlockNo" runat="server" placeholder="Block No" CssClass="form-control" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group text-right mb-0">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-warning waves-effect waves-light mr-1" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->

            <!-- end col -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container-fluid -->
</asp:Content>

