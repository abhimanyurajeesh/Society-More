<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="HousePage.aspx.cs" Inherits="HousePage" %>

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
                                <li class="breadcrumb-item active">House</li>
                            </ol>
                        </div>
                        <h4 class="page-title">House</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Add New House</h4>
                            <div class="form-group">
                                <label for="userName">Society Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlSocietyName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:DropDownList ID="ddlSocietyName" CssClass="form-control" runat="server" 
                                    AutoPostBack="true" 
                                    onselectedindexchanged="ddlSocietyName_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                                <div class="form-group">
                                <label for="userName">Block Number</label>
                                    <asp:Label ID="lblNoOfHouses" runat="server" Text="" CssClass="form-control"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="emailAddress">House Number<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBlockNo" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtBlockNo" CssClass="form-control" placeholder="Enter House No." runat="server"></asp:TextBox>
                                 </div>
                            <div class="form-group">
                                <label for="pass1">House Type<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlHouseType" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                  <asp:DropDownList ID="ddlHouseType" CssClass="form-control" runat="server" AutoPostBack="true">
                                       <asp:ListItem>-Select-</asp:ListItem>
                                       <asp:ListItem>1 BHK</asp:ListItem>
                                       <asp:ListItem>2 BHK</asp:ListItem>
                                       <asp:ListItem>3 BHK</asp:ListItem>
                                       <asp:ListItem>4 BHK</asp:ListItem>
                                       <asp:ListItem>5 BHK</asp:ListItem>
                                  </asp:DropDownList>
                            </div>
                             <div class="form-group">
                                <label for="pass1">Details<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDetails" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                 <asp:TextBox ID="txtDetails" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Details" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group text-right mb-0">
                                 <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                     CssClass="btn btn-primary waves-effect waves-light mr-1" 
                                     CausesValidation="true" onclick="btnSubmit_Click"/>
                                 <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                     CssClass="btn btn-secondary waves-effect" CausesValidation="False" onclick="btnCancel_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

