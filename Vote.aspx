<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="Vote.aspx.cs" Inherits="Vote" %>

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
                               <li class="breadcrumb-item"><a href="#">Society&More</a></li>
                                <li class="breadcrumb-item active">Votes</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Votes</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Votes</h4>
                            <div class="form-group">
                                <label for="emailAddress">Poll Topics<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPollTopics" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtPollTopics" CssClass="form-control" placeholder="Enter Poll Topics" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pass1">Poll Description<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPollDescription" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtPollDescription" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Description" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pass1">Poll Options<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPollDescription" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:DropDownList ID="ddlPollOptions" runat="server" CssClass="form-control">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group text-right mb-0">
                                <asp:Button ID="btnSubmit" runat="server" Text="Vote"
                                    CssClass="btn btn-primary waves-effect waves-light mr-1"
                                    CausesValidation="true" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

