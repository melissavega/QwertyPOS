<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="QwertyPOS.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/Register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center-page">
            <label class="col-xs-11">ID Number</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbID" runat="server" class="form-control"></asp:TextBox>
            </div>
           
             <label class="col-xs-11">First Name</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbFirstName" runat="server" class="form-control"></asp:TextBox>
            </div>

             <label class="col-xs-11">Last Name</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbLastName" runat="server" class="form-control"></asp:TextBox>
            </div>

             <label class="col-xs-11">Phone Number</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbPhoneNum" runat="server" class="form-control"></asp:TextBox>
            </div>

             <label class="col-xs-11">Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbPassword" runat="server" class="form-control"></asp:TextBox>
            </div>

             <label class="col-xs-11">Confirm Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbConfirmPass" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-xs-11 space-vert">
                <asp:Button ID="btnSignup" runat="server" Class="btn btn-dark" Text ="Signup" />
            </div>
            
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
