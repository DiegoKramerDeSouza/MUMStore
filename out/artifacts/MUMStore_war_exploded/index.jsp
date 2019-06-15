<%--
  Created by IntelliJ IDEA.
  User: 987109
  Date: 6/14/2019
  Time: 10:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Home</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8fd24b2ea7.js"></script>
    <link rel="stylesheet" href="resource/style/style.css" />

  </head>
  <body class="bg-light">
    <nav class="navbar navbar-light bg-dark justify-content-between">
      <a class="navbar-brand" href="/">MUM STORE</a>
      <div class="" id="smallbar">
        <form class="form-inline my-2 my-lg-0 mr-auto ${cookie.user.value != null ? "dnone" : null}">
          <a data-toggle="modal" data-target="#cart-modal" class="btn btn-success my-2 my-sm-0 btn-sm" >
            <i class="fas fa-shopping-cart"></i> Cart
          </a> &nbsp;
          <a href="#" class="btn btn-success my-2 my-sm-0 btn-sm" >
            <i class="fas fa-sign-in-alt"></i> Signup
          </a> &nbsp;
          <a href="#" data-toggle="modal" data-target="#login-modal" class="btn btn-outline-success my-2 my-sm-0 btn-sm" >
            <i class="fas fa-user-circle"></i> Login
          </a> &nbsp;
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



    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="resource/img/banner.jpg" class="d-block w-100" alt="MUM STORE BANNER">
        </div>
        <div class="carousel-item">
          <img src="resource/img/banner.jpg" class="d-block w-100" alt="MUM STORE BANNER">
        </div>
        <div class="carousel-item">
          <img src="resource/img/banner.jpg" class="d-block w-100" alt="MUM STORE BANNER">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    <!--Main Contents inside container-->

    <div class="container" id="main-container">

      <div class="row">
        <div class="col-lg-4">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="#">Active</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
          </ul>
        </div>
        <div class="col-lg-8">

        </div>
      </div>

    </div>
    <!--End of Main container-->


    <!--Login Modal Content-->
    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
      <div class="modal-dialog">
        <div class="loginmodal-container">
          <h1>Login</h1>
          <div class="dropdown-divider"></div>
          <form>
            <input type="text" name="user" placeholder="Username">
            <input type="password" name="pass" placeholder="Password">
            <div class="dropdown-divider"></div>
            <input type="submit" name="login" class="login loginmodal-submit btn btn-success" value="Login">
          </form>

          <div class="login-help">
            <label>Please click </label><a href="signup.jsp"></a> Register<span> If you dont have an Account.</span>
          </div>
        </div>
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
