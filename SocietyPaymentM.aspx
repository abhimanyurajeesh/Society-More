<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SocietyPaymentM.aspx.cs" Inherits="SocietyPaymentM" %>

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
                                <li class="breadcrumb-item active">Society</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Society Payment</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Society Payment</h4>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="emailAddress">Member Name<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" *" ForeColor="Red" ControlToValidate="ddlMemberName" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:DropDownList ID="ddlMemberName" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlMemberName_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblMemberId" runat="server" Text="" Visible="false"></asp:Label>
                                                <label for="userName">Bill No.<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" *" ForeColor="Red" ControlToValidate="txtBillNo" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtBillNo" Enabled="false" runat="server" placeholder="Enter Bill No" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="pass1">Generation Date<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" *" ForeColor="Red" ControlToValidate="txtGenerationDate" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtGenerationDate" runat="server" Textmode="date" CssClass="form-control"></asp:TextBox>
                                                
                                            </div>
                                            <div class="form-group">
                                                <label for="pass1">Bill Date<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBillDate" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtBillDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="emailAddress">Amount (Rs.)<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAmount" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtAmount" runat="server" placeholder="Enter Amount" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="emailAddress">Description<span class="text-danger"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDetails" Display="Dynamic"></asp:RequiredFieldValidator></span></label>
                                                <asp:TextBox ID="txtDetails" runat="server" placeholder="Enter details about bill" CssClass="form-control"></asp:TextBox>
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
                        </div>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-3">Society Payment Data</h4>

                            <div class="table-responsive">
                                <asp:Repeater ID="RepeaterUser" runat="server">
                                    <HeaderTemplate>
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Bill&nbsp;No</th>
                                                    <th>Member&nbsp;Id</th>
                                                    <th>Member&nbsp;Name</th>
                                                    <th>Bill&nbsp;Date</th>
                                                    <th>Generation&nbsp;Date</th>
                                                    <th>Amount</th>
                                                    <th>Status</th> 
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("BillNo")%></td>
                                            <td><%# Eval("MemberId")%></td>
                                            <td><%# Eval("MemberName")%></td>
                                            <td><%# Eval("BillDate","{0:dd-MM-yyyy}")%></td>
                                            <td><%# Eval("GenerationDate","{0:dd-MM-yyyy}")%></td>
                                            <td><%# Eval("Amount")%></td>
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

