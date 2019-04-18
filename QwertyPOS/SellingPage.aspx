<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellingPage.aspx.cs" Inherits="QwertyPOS.SellingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="form-group">
                <asp:Label ID="lblBrand" runat="server" CssClass="col-md-2 control-label" Text="Select Brand:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlBrand" CssClass="form-control " runat="server" OnSelectedIndexChanged="ddlBrand_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblModel" runat="server" CssClass="col-md-2 control-label" Text="Select Model:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlModel" CssClass="form-control " runat="server" AppendDataBoundItems="false"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSize" runat="server" CssClass="col-md-2 control-label" Text="Select Size:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSize" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblGender" runat="server" CssClass="col-md-2 control-label" Text="Select Gender (1=M, 2=F):"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlGender" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblQuantity" runat="server" CssClass="col-md-2 control-label" Text="Select Quanity In Stock:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlQuantity" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPrice" runat="server" CssClass="col-md-2 control-label" Text="Select Price:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlPrice" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
            </div>

            <asp:Button ID="btnAdd" runat="server" Class="btn btn-dark" Text="Add" OnClick="btnAdd_Click"/>

            <asp:Button ID="btnComplete" runat="server" Class="btn btn-dark" Text="Complete" OnClick="btnComplete_Click"/>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="GridPosition" CellPadding="4" ForeColor="#333333"  ShowFooter="True"  GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    
                    <asp:BoundField DataField="Model" HeaderText="Model Name" />
                 
                   

                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-dark" DeleteText="Remove">
                        <ControlStyle CssClass="btn btn-dark"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" HorizontalAlign="Center" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            
        </div>
    </form>
</body>
</html>
