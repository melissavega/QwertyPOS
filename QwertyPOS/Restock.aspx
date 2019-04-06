<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Restock.aspx.cs" Inherits="QwertyPOS.Restock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <title>Restock | Qwerty Kicks</title>
    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .sidenav {
            height: 100%;
            width: 160px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #292b2c;
            overflow-x: hidden;
            padding-top: 50px;
        }

            .sidenav a {
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 16px;
                color: #f1f1f1;
                display: block;
            }

                .sidenav a:hover {
                    color: #808080;
                }

        .main {
            margin-left: 160px; /* Same as the width of the sidenav */
            font-size: 18px; /* Increased text to enable scrolling */
            padding: 20px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

                .sidenav a {
                    font-size: 16px;
                }
        }
    </style>
</head>
<body>
    <form id="BrandForm" runat="server">
        <div class="sidenav">

            <!--Employee Only Nav -->
            <a href="Default.aspx">Home</a>
            <a href="Sell.aspx">Make a Sale</a>
            <a href="Restock.aspx">Restock Inventory</a>

            <!--Admin Only Nav --
            <a href="#Products">Products</a>
            <a href="#Customers">Customers</a>
            <a href="#Reporting">Reporting</a>-->
        </div>
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <a class="navbar-brand"><span>
                                <img alt="Qwerty Kicks Logo" src="Images/QwertyKicksYellow_LightBackground.png" height="100" /></span> Qwerty Kicks</a>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="navbar-nav">
                                </ul>
                                <ul class="navbar-nav ml-md-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="#">Signout <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Help </a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                            <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
                                            <div class="dropdown-divider">
                                            </div>
                                            <a class="dropdown-item" href="#">Separated link</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                        <div class="jumbotron">
                            <h2>Restock Inventory</h2>
                            <p>Choose a brand to restock, then add to inventory below.</p>                       
                        </div>
                    </div>
                </div>
            </div>
            <!-- Grouped Tabs-->
            <div class="row">
                <div class="col-md-6">
                    <div class="container">
                        <p></p>
                        <h3>Inventory Details</h3>
                        <p></p>
                        <p></p>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="ASICS-tab" data-toggle="tab" href="#ASICS" role="tab" aria-controls="ASICS" aria-selected="true">ASICS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Adidas-tab" data-toggle="tab" href="#Adidas" role="tab" aria-controls="Adidas" aria-selected="false">Adidas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Converse-tab" data-toggle="tab" href="#Converse" role="tab" aria-controls="Converse" aria-selected="false">Converse</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Fila-tab" data-toggle="tab" href="#Fila" role="tab" aria-controls="Fila" aria-selected="false">Fila</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Nike-tab" data-toggle="tab" href="#Nike" role="tab" aria-controls="Nike" aria-selected="false">Nike</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Puma-tab" data-toggle="tab" href="#Puma" role="tab" aria-controls="Puma" aria-selected="false">Puma</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Reebok-tab" data-toggle="tab" href="#Reebok" role="tab" aria-controls="Reebok" aria-selected="false">Reebok</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <p></p>
                            <div class="tab-pane fade show active" id="ASICS" role="tabpanel" aria-labelledby="ASICS-tab">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product ID</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Style/Model</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Sale Price</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Quantity in Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="Adidas" role="tabpanel" aria-labelledby="Adidas-tab">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product ID</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Style/Model</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Sale Price</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Quantity in Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="Converse" role="tabpanel" aria-labelledby="Converse-tab">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product ID</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Style/Model</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Sale Price</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Quantity in Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="Fila" role="tabpanel" aria-labelledby="Fila-tab">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product ID</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Style/Model</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Sale Price</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Quantity in Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="Nike" role="tabpanel" aria-labelledby="Nike-tab">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product ID</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Style/Model</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Sale Price</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Quantity in Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="Puma" role="tabpanel" aria-labelledby="Puma-tab">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product ID</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Style/Model</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Sale Price</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Quantity in Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="Reebok" role="tabpanel" aria-labelledby="Reebok-tab">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product ID</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Style/Model</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Sale Price</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Quantity in Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">7</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">8</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9</th>
                                            <td>Product ID</td>
                                            <td>Brand Name</td>
                                            <td>Style/Model</td>
                                            <td>Color</td>
                                            <td>Male/Female</td>
                                            <td>Sale Price</td>
                                            <td>Unit Price</td>
                                            <td>
                                                <input size="2" />
                                                <button type="button" class="btn btn-success btn-sm" style="float: right">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="Scripts/restock.js"></script>
</body>
</html>
