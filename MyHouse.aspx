<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="MyHouse.aspx.cs" Inherits="MyHouse" %>

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
                            <li class="breadcrumb-item"><a href="javascript: void(0);">My House</a></li>
                            <li class="breadcrumb-item active">Society&More</li>
                        </ol>
                    </div>
                    <h4 class="page-title">My House</h4>
                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-body">
                     <h4 class="header-title">My House</h4>
                        <div class="form-group">
                            <label for="emailAddress">Society Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSocietyName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:TextBox ID="txtSocietyName" runat="server" placeholder="Society Name" CssClass="form-control" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="emailAddress">Block No<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBlockNo" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:TextBox ID="txtBlock" runat="server" placeholder="Block No" CssClass="form-control" Enabled="false"></asp:TextBox>
                        </div>  
                        <div class="form-group">
                            <label for="emailAddress">House No<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBlockNo" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:TextBox ID="txtBlockNo" runat="server" placeholder="Block No" CssClass="form-control" Enabled="false"></asp:TextBox>
                        </div>  
             
                   <div class="form-group">
                            <label for="emailAddress">House Type<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtHouseType" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:TextBox ID="txtHouseType" runat="server" placeholder="House Type" CssClass="form-control" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="emailAddress">Details<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDetails" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                            <asp:TextBox ID="txtDetails" runat="server" placeholder="Details" CssClass="form-control" Enabled="false" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                   </div>
                </div>
            </div>
            <!-- end col -->
        </div>
    </div>
        <!-- end row -->
</asp:Content>

