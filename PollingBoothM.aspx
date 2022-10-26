<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PollingBoothM.aspx.cs" Inherits="PollingBoothM" %>

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
                                <li class="breadcrumb-item active">Polling Booth</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Polling Booth</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Create Polling Booth</h4>
                            <div class="form-group">
                                <label for="emailAddress">Poll Topics<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPollTopics" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtPollTopics" CssClass="form-control" placeholder="Enter Poll Topics" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pass1">Poll Description<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPollDescription" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtPollDescription" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Description" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group text-right mb-0">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                    CssClass="btn btn-primary waves-effect waves-light mr-1"
                                    CausesValidation="true" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">Polling Booth</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterSociety" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead class="bg-info text-white">
                                                <tr>
                                                    <th>#</th>
                                                    <th>Poll&nbsp;Topics</th>
                                                    <th>Poll&nbsp;Description</th>
                                                    <th>Status</th>
                                                    <th>End Poll</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("PollTopics")%></td>
                                            <td><%# Eval("PollDescription")%></td>
                                            <td><%# Eval("Status")%></td>
                                            <td>
                                                <a class="btn btn-warning btn-sm" href="StopPolling.aspx?Id=<%#Eval("Id") %>">
                                                    <i class="fa fa-hand-stop-o"></i>
                                                    Stop
                                                </a></td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="DeletePollingB.aspx?Id=<%#Eval("Id") %>">
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

