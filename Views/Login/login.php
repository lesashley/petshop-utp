<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Oh my Pet">
    <link rel="shortcut icon" href="<?php echo media(); ?>/images/logo.jpeg">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<?php echo media(); ?>/css/main.css">
    <link rel="stylesheet" type="text/css" href="<?php echo media(); ?>/css/style.css">
    <!-- Font-icon css-->
<<<<<<< HEAD
    <title><?= $data['page_tag'];?></title>
=======
    <title><?php $data['page_tag'];?></title>
>>>>>>> 53043e51952068c63933cf6cbef907f4a88d6834
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
<<<<<<< HEAD
        <h1><?= $data['page_title'];?></h1>
      </div>
      <div class="login-box">
      <div id="divLoading" >
          <div>
            <img src="<?= media(); ?>/images/loading.svg" alt="Loading">
          </div>
        </div>
        <form class="login-form" name="formLogin" id="formLogin" action="">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>INICIAR SESIÓN</h3>
          <div class="form-group">
            <label class="control-label">Usuario</label>
            <input id="txtEmail" name="txtEmail" class="form-control" type="email" placeholder="Email" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">Contraseña</label>
            <input id="txtPassword" name="txtPassword" class="form-control" type="password" placeholder="Contraseña">
          </div>
          <div class="form-group">
            <div class="utility">
              <p class="semibold-text mb-2"><a href="#" data-toggle="flip">¿Olvidaste tu contraseña?</a></p>
            </div>
          </div>
          <div id="alertLogin" class="text-center"></div>
          <div class="form-group btn-container">
            <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-sing-in-alt"></i>Iniciar Sesión</button>
          </div>
        </form>
        <form id="formRecetPass" class="forget-form" action="">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input id="txtEmailReset" name="txtEmailReset" class="form-control" type="email" placeholder="Email">
          </div>
          <div class="form-group btn-container">
            <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>Reiniciar</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Iniciar Sesión</a></p>
=======
        <h1>Vali</h1>
      </div>
      <div class="login-box">
        <form class="login-form" action="index.html">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">USERNAME</label>
            <input class="form-control" type="text" placeholder="Email" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" placeholder="Password">
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <label>
                  <input type="checkbox"><span class="label-text">Stay Signed in</span>
                </label>
              </div>
              <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password ?</a></p>
            </div>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
          </div>
        </form>
        <form class="forget-form" action="index.html">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" type="text" placeholder="Email">
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
>>>>>>> 53043e51952068c63933cf6cbef907f4a88d6834
          </div>
        </form>
      </div>
    </section>
<<<<<<< HEAD
    <script>
        const base_url = "<?= base_url(); ?>";
    </script>
=======
>>>>>>> 53043e51952068c63933cf6cbef907f4a88d6834
    <!-- Essential javascripts for application to work-->
    <script src="<?php echo media(); ?>/js/jquery-3.3.1.min.js"></script>
    <script src="<?php echo media(); ?>/js/popper.min.js"></script>
    <script src="<?php echo media(); ?>/js/bootstrap.min.js"></script>
<<<<<<< HEAD
    <script src="<?php echo media(); ?>/js/fontawesome.js"></script>
    <script src="<?php echo media(); ?>/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<?php echo media(); ?>/js/plugins/pace.min.js"></script>
    <script type="text/javascript" src="<?= media();?>/js/plugins/sweetalert.min.js"></script>
    <script src="<?php echo media(); ?>/js/<?= $data['page_functions_js']; ?>"></script>
=======
    <script src="<?php echo media(); ?>/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<?php echo media(); ?>/js/plugins/pace.min.js"></script>
    <script src="<?php echo media(); ?>/js/<?= $data['page_functions:js']; ?>"></script>
>>>>>>> 53043e51952068c63933cf6cbef907f4a88d6834
    </body>
</html>