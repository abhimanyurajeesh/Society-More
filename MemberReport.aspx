<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MemberReport.aspx.cs" Inherits="MemberReport" %>

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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Society&More</a></li>
                                <li class="breadcrumb-item active">Members Report</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Members Report</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <!-- end page title -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <!-- Inline Form -->
                            <h4 class="header-title">Members Report</h4>
                            <div class="form-row align-items-center">
                                <div class="col-auto">
                                    <label class="sr-only" for="autoSizingInputEmail">Members</label>
                                    <asp:TextBox ID="txtSelectSociety" CssClass="form-control mt-2" placeholder="Enter Members Name" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-auto">
                                    <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-success waves-effect waves-light mt-2" OnClick="btnView_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->

            <div class="row">
                <div class="col-sm-4">
                    <a href="SocietyMember.aspx" class="btn btn-primary waves-effect waves-light mb-3"><i class="mdi mdi-plus"></i>Add Member</a>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->

            <div class="row">
                <asp:Repeater ID="RepeaterUser" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center member-box">
                                        <div class="clearfix"></div>
                                        <div class="member-card">
                                            

                                            <div class="">
                                                <h4 class="mb-1"> <%#Eval("Name")%></h4>
                                                <p class="text-muted mb-3"><span><a href="#" class="text-pink"><%#Eval("Email")%></a> </span></p>
                                            </div>

                                            <p class="text-muted">
                                                <%#Eval("MobileNo")%>
                                            </p>
                                          
                                            <p class="text-muted">
                                                <%#Eval("SocietyName")%>
                                            </p>
                                            <p class="text-muted">
                                                <%#Eval("BlockNo")%>
                                            </p>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- end row -->
        </div>
    </div>
</asp:Content>

