<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PollReport.aspx.cs" Inherits="PollReportPage" %>


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
                                <li class="breadcrumb-item"><a href="PollReport.aspx">Society&More</a></li>
                                <li class="breadcrumb-item active">Poll Report</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Poll Report</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="card-group">
                    <div class="card">
                        <div class="card-body">
                            <!-- Inline Form -->
                            <h4 class="header-title">Poll Reports</h4>
                            <div class="form-row align-items-center">
                                <div class="col-auto">
                                    <label class="sr-only" for="autoSizingInputEmail">Society</label>
                                    <asp:TextBox ID="txtMember" CssClass="form-control mt-2" placeholder="Enter Name" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-auto">
                                    <asp:Button ID="btnView" runat="server" Text="Search" CssClass="btn btn-success waves-effect waves-light mt-2" OnClick="btnView_Click" />
                                </div>
                            </div>
                          </div>
                        </div>
                         <div class="card">
                        <div class="card-body" >
                            <!-- POLLL SEARCH TOPIC >
                            <h4 class="header-title">Poll Result</h4-->
                            <div class="form-row align-items-center" >
                                 <div class="col-auto"">
                                    <label>TOPIC</label>
                                     <asp:DropDownList ID="TxtTopic" CssClass="form-control " placeholder="Search the topic" runat="server" Width="200px" AutoPostBack="true" 
                                    onselectedindexchanged="TxtTopic_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-auto" style="text-align: center">
                                    <label>YES</label>
                                    <asp:TextBox ID="TxtYes" CssClass="form-control " placeholder="Number of Yes" runat="server" Width="130px" style="text-align: center"></asp:TextBox>
                                </div>
                                <div class="col-auto" style="text-align: center">
                                    <label >NO</label>
                                    <asp:TextBox ID="TxtNo" CssClass="form-control " placeholder="Number of No" runat="server" Width="120px" style="text-align: center" ></asp:TextBox>
                                </div>
                               
                            </div>
                            
             
                        </div>
                        </div>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <br />
            <!-- end row -->
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">Poll Data</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterUser" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Vote ID</th>
                                                    <th>Poll Topic</th>
                                                    <th>Poll Desc</th>
                                                    <th>Result</th>
                                                    <th>Member ID</th>
                                                    <th>Member Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("PollId")%></td>
                                            <td><%# Eval("PollTopics")%></td>
                                            <td><%# Eval("PollDescription")%></td>
                                            <td><%# Eval("PollOptions")%></td>
                                            <td><%# Eval("MemberId")%></td>
                                            <td><%# Eval("MemberName")%></td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="DeletePollingResult.aspx?Id=<%#Eval("Id") %>">
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

