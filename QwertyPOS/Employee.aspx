﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="QwertyPOS.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <!-- Brand -->
                <a class="navbar-brand" href="Employee.aspx"><span>
                    <img alt="Qwerty Logo" src="Images/QwertyShopLogo_DarkBack.png" height="150" />
                </span>Employee Portal</a>

                <!-- Links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Logout</a>
                    </li>

                    <!-- Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Brands
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">ASICS</a>
                            <a class="dropdown-item" href="#">Adidas</a>
                            <a class="dropdown-item" href="#">Converse</a>
                            <a class="dropdown-item" href="#">Fila</a>
                            <a class="dropdown-item" href="#">New Balance</a>
                            <a class="dropdown-item" href="#">Nike</a>
                            <a class="dropdown-item" href="#">Puma</a>
                            <a class="dropdown-item" href="#">Reebok</a>
                            <a class="dropdown-item" href="#">Saucony</a>
                            <a class="dropdown-item" href="#">Vans</a>
                        </div>
                    </li>
                </ul>
            </nav>
            <br>
            <div class="container">
                <h3>Transaction</h3>
                <p>Select a brand from the drop down to begin a new transaction.</p>
            </div>
            <div class="container">
                <!-- List of Items -->
                <ul class="list-group">
                    <li class="list-group-item">Brand</li>
                    <li class="list-group-item">Style</li>
                    <li class="list-group-item">Gender</li>
                    <li class="list-group-item">Size</li>
                    <li class="list-group-item">Price</li>
                </ul>
            </div>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>