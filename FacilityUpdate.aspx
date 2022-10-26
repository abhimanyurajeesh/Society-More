<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="FacilityUpdate.aspx.cs" Inherits="FacilityUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="AdminDashBoard.aspx">Socitey Management System</a></li>
                                <li class="breadcrumb-item active"><a href="FacilityPage.aspx">Facility Book</a></li>
                            </ol>
                        </div>
                        <h4 class="page-title">Facility Book</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Facility Book</h4>
                            <div class="form-group">
                                <label for="emailAddress">Facility Book<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFacility" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox ID="txtFacility" CssClass="form-control" placeholder="Enter Facility Book" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group text-right mb-0">
                                <asp:Button ID="btnEdit" runat="server" Text="Edit"
                                    CssClass="btn btn-success waves-effect waves-light mr-1"
                                    CausesValidation="true" OnClick="btnEdit_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

