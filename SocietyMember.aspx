<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SocietyMember.aspx.cs" Inherits="AllocateHouse" %>

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
                                <li class="breadcrumb-item active">Member Directory</li>
                            </ol>
                        </div>
                        <h5 class="page-title">Society Members</h5>
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Society Member Registartion</h4>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-body">

                                            <!-- USER NAME -->
                                            <div class="form-group">
                                                <label for="userName">Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFullName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter Name" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- EMAIL -->
                                            <div class="form-group">
                                                <label for="emailAddress">Email<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" *" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter a Invalid email address"></asp:RegularExpressionValidator>
                                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- PASSWORD -->
                                            <div class="form-group">
                                                <label for="pass1">Password<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!-- GENDER -->
                                            <div class="form-group">
                                                <label for="exampleInputAddress">Gender</label>
                                                <asp:RadioButton ID="rbMale" Text="Male" runat="server" GroupName="Gender" CssClass="form-control" />
                                                <asp:RadioButton ID="rbFemale" Text="Female" runat="server" GroupName="Gender" CssClass="form-control" />
                                            </div>

                                            <!-- DOB -->
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
                                            <!-- PHONE -->
                                            <div class="form-group">
                                                <label for="exampleInputAddress">Mobile No<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage=" *" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number.Please Enter Mobile Number" ControlToValidate="txtMobileNo" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                                                <asp:TextBox textmode="Phone" ID="txtMobileNo" runat="server" placeholder="Mobile No" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="emailAddress">Society Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" *" ForeColor="Red" ControlToValidate="ddlSocietyName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:DropDownList ID="ddlSocietyName" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlSocietyName_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="emailAddress">House Number<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage=" *" ForeColor="Red" ControlToValidate="ddlBlockNo" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                 <asp:DropDownList ID="ddlBlockNo" CssClass="form-control" AutoPostBack="true" 
                                                    runat="server" onselectedindexchanged="ddlBlockNo_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="emailAddress">Total Member<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage=" *" ForeColor="Red" ControlToValidate="txtTotalMember" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                  <asp:TextBox ID="txtTotalMember" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="lblSocietyId" runat="server" Text="" Visible="false"></asp:Label>
                                        </div>
                                        <div class="form-group text-right mb-0">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary waves-effect waves-light mr-1" CausesValidation="true" OnClick="btnSubmit_Click" />


                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary waves-effect" OnClick="btnCancel_Click" CausesValidation="false"/>
                                            
                                           <asp:Button ID="clear" runat="server" Text="Clear" CssClass="btn btn-secondary waves-effect" OnClick="clear_Click" CausesValidation="false"/>
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
                            <h4 class="header-title mb-3">Society Member Data</h4>

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
                                                    <th>Society Name</th>
                                                    <th>House Number</th>
                                                    <th>Total Member</th>
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
                                            <td><%# Eval("DateOfBirth","{0:MM-dd-yyyy}")%></td>
                                            <td><%# Eval("SocietyName")%></td>
                                            <td><%# Eval("BlockNo")%></td>
                                            <td><%# Eval("TotalMember")%></td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="DeleteAllocateHouse.aspx?Id=<%#Eval("Id") %>">
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

