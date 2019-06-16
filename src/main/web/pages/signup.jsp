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
        <title>Signup</title>
        <link rel="stylesheet" href="../resource/style/style.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8fd24b2ea7.js"></script>
        <script src="../resource/script/signupScript.js" crossorigin="anonymous"></script>

    </head>
    <body class="bg-light">
        <nav class="navbar navbar-light bg-dark justify-content-between">
            <a class="navbar-brand" href="/">MUM STORE</a>
            <div class="" id="smallbar">
                <form class="form-inline my-2 my-lg-0 mr-auto">
                    <a data-toggle="modal" data-target="#cart-modal" class="btn btn-success my-2 my-sm-0 btn-sm" >
                        <i class="fas fa-shopping-cart"></i> Cart
                    </a> &nbsp;
                </form>
            </div>
        </nav>
        <div class="container">
            <div>

                <form class="form-horizontal" role="form" action="#" method="post">
                    <h2>Registration</h2>
                    <div class="form-group">
                        <label for="fullName" class="col-sm-3 control-label">Full Name*</label>
                        <div class="col-sm-9">
                            <input type="text" id="fullName" placeholder="Full Name" class="form-control" name="fullName" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">Email* </label>
                        <div class="col-sm-9">
                            <input type="email" id="email" placeholder="Email" class="form-control" name= "email" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">Password*</label>
                        <div class="col-sm-9">
                            <input type="password" id="password" placeholder="Password" class="form-control" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">Confirm Password*</label>
                        <div class="col-sm-9">
                            <input type="password" id="confirmPassword" placeholder="Password" class="form-control">
                            <span id="matching"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">Address</label>
                        <div class="col-sm-9">
                            <input type="text" id="address" placeholder="address" class="form-control" name="address">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <span class="help-block">*Required fields</span>
                        </div>
                    </div>
                    <button id="registerbtn" type="submit" class="btn btn-primary btn-block">Register</button>
                </form>

            </div>
        </div>

        <!--Cart Modal Content-->
        <div class="modal fade" id="cart-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="loginmodal-container">
                    <h1><i class="fas fa-shopping-cart"></i> Cart</h1>
                    <div class="dropdown-divider"></div>
                    Cart here!
                </div>
            </div>
        </div>
    </body>
</html>
