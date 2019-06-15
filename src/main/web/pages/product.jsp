<%--
  Created by IntelliJ IDEA.
  User: 987109
  Date: 6/14/2019
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Product</title>


        <link rel="stylesheet" href="../resource/style/productStyle.css">
        <link rel="stylesheet" href="../resource/style/style.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8fd24b2ea7.js"></script>
        <script src="../resource/script/productScript.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-light bg-dark justify-content-between">
            <a class="navbar-brand" href="#">Logo</a>
            <div class="" id="smallbar">
                <form class="form-inline my-2 my-lg-0 mr-auto ${cookie.user.value != null ? "dnone" : null}">
                    <button class="btn btn-success my-2 my-sm-0 btn-sm" ><i class="fas fa-shopping-cart"></i> Cart</button> &nbsp;
                    <button class="btn btn-success my-2 my-sm-0 btn-sm" ><i class="fas fa-sign-in-alt"></i> Signup</button> &nbsp;
                    <button class="btn btn-outline-success my-2 my-sm-0 btn-sm" ><i class="fas fa-user-circle"></i> Login</button> &nbsp;
                </form>
                <form class="form-inline my-2 my-lg-0 mr-auto ${cookie.user.value == null ? "dnone" : null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-circle"></i> ${cookie.user.value}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"><i class="fas fa-shopping-cart"></i> Cart</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Signout</a>
                        </div>
                    </li>
                </form>
            </div>
        </nav>
        <div class="container">
            <div class="row">

                <div class="col-xs-4 item-photo">
                    <div class="aside">
                        <img src="../resource/img/banner1.jpg" alt="selected image" />
                    </div>
                </div>

                <div class="col-xs-5">
                    <div class="aside">
                        <!-- Detail name of product-->
                        <h3>Name: ${product.name==null ? "banner1": product.name}</h3>

                        <!-- Price -->
                        <h3>Price: $ ${product.price}</h3>

                        <div class="section">
                            <h6 class="title-attr"><small>Quantity</small></h6>
                            <div class="btnclass">
                                <div class="btn-minus"><span class="glyphicon glyphicon-minus"><input type="button" value="-"></span></div>
                                <input value="1" />
                                <div class="btn-plus"><span class="glyphicon glyphicon-plus"><input type="button" value="+"/></span></div>

                            </div>
                        </div>

                        <!-- Add to cart button -->
                        <div class="section">
                            <button class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Add to cart</button>
                        </div>
                    </div>
                </div>

                <div class="col-xs-9">
                    <h3>Product Description:</h3>
                    <div class="description">
                        <p>
                            <small>
                                Stay connected either on the phone or the Web with the Galaxy S4 I337 from Samsung. With 16 GB of memory and a 4G connection, this phone stores precious photos and video and lets you upload them to a cloud or social network at blinding-fast speed. With a 17-hour operating life from one charge, this phone allows you keep in touch even on the go.

                                With its built-in photo editor, the Galaxy S4 allows you to edit photos with the touch of a finger, eliminating extraneous background items. Usable with most carriers, this smartphone is the perfect companion for work or entertainment.
                            </small>
                        </p>
                        <small>
                            <ul>
                                <li>Display as List</li>
                            </ul>
                        </small>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
