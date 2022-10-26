<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SocietyPage.aspx.cs" Inherits="SocietyPage" %>

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
                                <li class="breadcrumb-item active">Society</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Society</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Add New Society</h4>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="userName">Society Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSocietyName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtSocietyName" runat="server" placeholder="Enter Society Name" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="userName">Block Number<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNoOfHouses" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtNoOfHouses" runat="server" placeholder="Enter Block number" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group text-right mb-0">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                                CssClass="btn btn-primary waves-effect waves-light mr-1"
                                                CausesValidation="true" OnClick="btnSubmit_Click" />

                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                                                CssClass="btn btn-secondary waves-effect" CausesValidation="false"
                                                OnClick="btnCancel_Click" />
                                        </div>
                                    </div>
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
                            <h4 class="header-title mb-3">Society Data</h4>
                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterUser" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Society Name</th>
                                                    <th>Block Number</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("SocietyName")%></td>
                                            <td><%# Eval("NoOfHouses")%></td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="DeleteSociety.aspx?Id=<%#Eval("Id") %>">
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

