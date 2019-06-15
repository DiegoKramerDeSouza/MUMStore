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
    <link rel="stylesheet" href="../resource/style/checkoutStyle.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8fd24b2ea7.js"></script>
</head>
<body class="bg-light">
<nav class="navbar navbar-light bg-dark justify-content-between">
    <a class="navbar-brand" href="/">Logo</a>
    <div class="" id="smallbar">
        <form class="form-inline my-2 my-lg-0 mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle"></i> ${cookie.user.value}
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" data-toggle="modal" data-target="#cart-modal" href="#"><i class="fas fa-shopping-cart"></i> Cart</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Signout</a>
                </div>
            </li>
        </form>
    </div>
</nav>
<div class="container">
    <div class="card">
        <div class="card-body">
            <h1 class="card-title">Checkout</h1>

            <!-- repeat this for each product -->
            <div class="media">
                <img class="align-self-center mr-3 thumb" src="resource/img/products/product1.jpg" alt="${cart.item.name}">
                <div class="media-body">
                    <h5 class="mt-0">Item Four</h5>
                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    <div class="text-right">
                        <span>Quantity 1</span>
                        <span><i class="far fa-trash-alt"></i></span>
                    </div>
                    <div class="dropdown-divider"></div>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!
                    <div class="text-right">
                        <span>Price:$100</span>
                    </div>
                </div>
            </div>

            <div class="media">
                <img class="align-self-center mr-3 thumb" src="resource/img/products/product1.jpg" alt="${cart.item.name}">
                <div class="media-body">
                    <h5 class="mt-0">Item Four</h5>
                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    <div class="text-right">
                        <span>Quantity 1</span>
                        <span><i class="far fa-trash-alt"></i></span>
                    </div>
                    <div class="dropdown-divider"></div>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!
                    <div class="text-right">
                        <span>Price:$100</span>
                    </div>
                </div>
            </div>

            <div class="media">
                <img class="align-self-center mr-3 thumb" src="resource/img/products/product1.jpg" alt="${cart.item.name}">
                <div class="media-body">
                    <h5 class="mt-0">Item Four</h5>
                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    <div class="text-right">
                        <span>Quantity 1</span>
                        <span><i class="far fa-trash-alt"></i></span>
                    </div>
                    <div class="dropdown-divider"></div>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!
                    <div class="text-right">
                        <span>Price:$100</span>
                    </div>
                </div>
            </div>

            <!--------------------------------------->

            <div class="dropdown-divider"></div>
            <div class="total text-right">
                <strong>Total:$100</strong>
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

        </div>
    </div>
</div>
</body>
</html>
