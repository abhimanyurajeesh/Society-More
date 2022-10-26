<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ComplainReplay.aspx.cs" Inherits="ComplainReplay" %>

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
                                <li class="breadcrumb-item"><a href="ComplainPage.aspx">GO back</a></li>
                            </ol>
                        </div>
                        <h4 class="page-title">Reply to Queries</h4>
                    </div>
                </div>
            </div>
                        <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">Yet To Reply</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterSociety" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead class="bg-info text-white">
                                                <tr>
                                                    <th>#</th>
                                                    <th>Member Id</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Mobile No</th>
                                                    <th>Subject</th>
                                                    <th>Complain</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("MemberId")%></td>
                                            <td><%# Eval("Name")%></td>
                                            <td><%# Eval("Email")%></td>
                                            <td><%# Eval("MobileNo")%></td>
                                            <td><%# Eval("Subject")%></td>
                                            <td><%# Eval("Complain")%></td>
                                            <td><%# Eval("Status")%></td>
                                            <td>
                                                <a class="btn btn-success btn-sm" href="ComplainReplay.aspx?Id=<%#Eval("Id") %>">
                                                    <i class="fas fa-reply"></i>
                                                    Replay
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
            <!-- end page title -->
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Send Reply to </h4>
                            <asp:Label ID="getname" runat="server" Text=""></asp:Label>
                            <div class="form-group">
                                <label for="emailAddress"><span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtReplay" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtReplay" CssClass="form-control" placeholder="Enter Complain Replay" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group text-right mb-0">
                                <asp:Button ID="btnReplay" runat="server" Text="Replay"
                                    CssClass="btn btn-success waves-effect waves-light mr-1"
                                    CausesValidation="true" OnClick="btnReplay_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</asp:Content>

