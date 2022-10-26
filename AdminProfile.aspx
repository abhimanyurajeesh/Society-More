<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminProfile.aspx.cs" Inherits="AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box">
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Society&More Profile</a></li>
                            <li class="breadcrumb-item active">My Profile</li>
                        </ol>
                    </div>
                    <h4 class="page-title">My Account</h4>
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
                        <div class="form-group text-right mb-0">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-warning waves-effect waves-light mr-1" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->

            <div class="col-xl-6">
                <div class="card">
                
                    <div class="card-body">
                        <asp:Repeater ID="RepeaterImage" runat="server">
                            <ItemTemplate>
                                <img src='data:<%#Eval("ContentType")%>;base64,<%# Eval("Image") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("Image")) : string.Empty %>' alt="image" class="img-fluid rounded" width="200Px" height="200px"/>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <label for="emailAddress">&nbsp;Profile Image</label>
                    <div class="card-footer">
                        <div class="form-group">
                            <label for="pass1">Upload New Image<span class="text-danger"></span></label>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group text-right mb-0">
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary waves-effect waves-light mr-1" CausesValidation="false" OnClick="btnUpload_Click"/>
                        </div>
                    </div>
                </div>

            </div>
            <!-- end col -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container-fluid -->
</asp:Content>

