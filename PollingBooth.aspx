<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="PollingBooth.aspx.cs" Inherits="PollingBooth" %>

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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Socitey&More</a></li>
                                <li class="breadcrumb-item active">Polling Booth</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Polling Booth</h4>
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
                                            <td>
                                                <a class="btn btn-success btn-sm" href="Vote.aspx?Id=<%#Eval("Id") %>">
                                                    Vote
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

