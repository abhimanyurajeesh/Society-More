<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="UserPage.aspx.cs" Inherits="UserPage" %>

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
                                <li class="breadcrumb-item active">Add admin</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Admin</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Create a new Admin Profile</h4>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="userName">Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFullName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter Name" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="pass1">Password<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputAddress">Gender</label>
                                                <asp:RadioButton ID="rbMale" Text="Male" runat="server" GroupName="Gender" CssClass="form-control" />
                                                <asp:RadioButton ID="rbFemale" Text="Female" runat="server" GroupName="Gender" CssClass="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputAddress">Date Of Birth</label>
                                                <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- end col -->

                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-body">
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
                                                <label for="emailAddress">Address<span class="text-danger"></span></label>
                                                <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="pass1">Image<span class="text-danger"></span></label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group text-right mb-0">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                                CssClass="btn btn-primary waves-effect waves-light mr-1"
                                                CausesValidation="true" OnClick="btnSubmit_Click" />

                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false"
                                                CssClass="btn btn-secondary waves-effect" OnClick="btnCancel_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end row -->

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
                            <h4 class="header-title mb-3">User Data</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterUser" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Password</th>
                                                    <th>Mobile No</th>
                                                    <th>Gender</th>
                                                    <th>Date Of Birth</th>
                                                    <th>Address</th>
                                                    <th>Image</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("Name")%></td>
                                            <td><%# Eval("Email")%></td>
                                            <td><%# Eval("Password")%></td>
                                            <td><%# Eval("MobileNo")%></td>
                                            <td><%# Eval("Gender")%></td>
                                            <td><%# Eval("DateOfBirth","{0:MM/dd/yyyy}")%></td>
                                            <td><%# Eval("Address")%></td>
                                            <td>
                                                <ul class="list-inline">
                                                    <li class="list-inline-item">
                                                        <img src='data:<%#Eval("ContentType")%>;base64,<%# Eval("Image") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("Image")) : string.Empty %>' alt="" height="50px" width="50px" cssclass="table-avatar" />
                                                    </li>
                                                </ul>
                                            </td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="DeleteUserPage.aspx?Id=<%#Eval("Id") %>">
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

