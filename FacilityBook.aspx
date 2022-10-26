<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="FacilityBook.aspx.cs" Inherits="FacilityBook" %>

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
                                <li class="breadcrumb-item active">Facility Book</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Facility Book</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Facility Book</h4>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="userName">Facility Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFacilityName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:Dropdownlist ID="txtFacilityName" runat="server" placeholder="Enter Facility Name" CssClass="form-control">
                                       <asp:ListItem>-Select-</asp:ListItem>
                                       <asp:ListItem>Auditorium 1</asp:ListItem>
                                       <asp:ListItem>Auditorium 2</asp:ListItem>
                                       <asp:ListItem>Min Auditorium</asp:ListItem>
                                       <asp:ListItem>Swimming Pool</asp:ListItem>
                                       <asp:ListItem>Turff</asp:ListItem>
                                                </asp:Dropdownlist>
                                            </div>

                                            <!--FACLITY FROM TIME-->
                                            <div class="form-group">
                                                <label for="emailAddress">From Time<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFacilityTimeFrom" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtFacilityTimeFrom" runat="server" placeholder="Enter Facility Time" TextMode="Time" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!--FACLITY TO TIME-->
                                            <div class="form-group">
                                                <label for="emailAddress">To Time<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFacilityTimeTill" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtFacilityTimeTill" runat="server" placeholder="Enter Facility Time" TextMode="Time" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!--FACLITY FROM DATE-->
                                            <div class="form-group">
                                                <label for="pass1">Date From<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFacilityDateFrom" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtFacilityDateFrom" runat="server" placeholder="Enter Facility Date" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <!--FACLITY TO DATE-->
                                             <div class="form-group">
                                                <label for="pass1">Date To<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFacilityDateTill" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtFacilityDateTill" runat="server" placeholder="Enter Facility Date" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="emailAddress">Society Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlSocietyName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:DropDownList ID="ddlSocietyName" CssClass="form-control" AutoPostBack="true" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col -->

                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-body">

                                            <!--div class="form-group">
                                                <label for="emailAddress">Usage Guidance<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtUsageGuidance" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtUsageGuidance" runat="server" placeholder="Enter usage guidance" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                            </div-->

                                               <div class="form-group">
                                                <label for="emailAddress">Descrpition<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDescrpition" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtDescrpition" runat="server" placeholder="Enter descrption (Briefly explain the need and duration)" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
                            <!-- end row -->

                        </div>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">Facility Book Data</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterUser" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Facility&nbsp;Name</th>
                                                    <th>From&nbsp;Date</th>
                                                    <th>To&nbsp;Date</th>
                                                    <th>From&nbsp;Time</th>
                                                    <th>To&nbsp;Time</th>
                                                    <th>Descrpition</th>
                                                    <th>Society&nbsp;Name</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("FacilityName")%></td>
                                            <td><%# Eval("FacilityDateFrom","{0:dd-MM-yyyy}")%></td>
                                            <td><%# Eval("FacilityDateTill","{0:dd-MM-yyyy}")%></td>
                                            <td><%# Eval("FacilityTimeFrom")%></td>
                                            <td><%# Eval("FacilityTimeTill")%></td>
                                            <td><%# Eval("Descrpition")%></td>
                                            <td><%# Eval("SocietyName")%></td>
                                            <td><%# Eval("Status")%></td>
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

