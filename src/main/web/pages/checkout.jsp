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
        <title>Checkout</title>
        <link rel="stylesheet" href="../resource/style/style.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8fd24b2ea7.js"></script>
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
            <div>
                Checkout
            </div>
        </div>
    </body>
</html>
