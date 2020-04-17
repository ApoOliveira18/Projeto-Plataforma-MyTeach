<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoedaINICIO.aspx.cs" Inherits="MoedaINICIO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Moeda</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style1Home.css">
  <!-- skin -->
  <link rel="stylesheet" href="skin/default.css">
  <!-- =======================================================
    Theme Name: Vlava
    Theme URL: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
    <link rel="shortcut icon" href="img/logo_site_preta (1).ico" type="image/x-icon"/>

    <style>
        section{margin-top:100px;}
    </style>
</head>
    
<body>

    <form runat="server">

<!-- cabecalho -->
  <section id="header" class="appear"></section>
  <div class="navbar navbar-fixed-top" role="navigation" data-0="line-height:100px; height:100px; background-color:rgba(102, 26, 102,1);" data-300="line-height:60px; height:60px; background-color:rgba(102, 26, 102,1);">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      	  <span class="fa fa-bars color-white"></span>
        </button>
        <div class="navbar-logo">
          <a href="HomeINICIO.aspx"><img data-0="width:180px;" data-300=" width:120px;" src="img/marca_myteach.png" alt=""></a>
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" data-0="margin-top:20px;" data-300="margin-top:5px;">
          <li><a href="HomeINICIO.aspx">Home</a></li>
          <li><a href="CursosINICIO.aspx">Cursos</a></li>
          <li class="active" ><a href="MoedaINICIO.aspx">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx">Quem somos</a></li>
		  <li><a href="ContatoINICIO.aspx">Contato</a></li>
		  <li><a href="LoginINICIO.aspx"><i class="fas fa-user-circle"></i> Login</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>

  <!--Conteudo-->
 <section id="section-works" class="section appear clearfix">
    <div class="container">

        <div class="row mar-bot40" style="margin-top:20px;">
            <div class="col-md-offset-1 col-md-5">
                <object data="img/pulando_moeda.gif">
				    <param name="movie" value="ANUNCIO2.swf" />
				    <param name="quality" value="high" />
				    <param name="bgcolor" value="#ffffff" />
				    <param name="play" value="true" />
				    <param name="loop" value="true" />
				    <param name="wmode" value="window" />
				    <param name="scale" value="showall" />
				    <param name="menu" value="true" />
				    <param name="devicefont" value="false" />
				    <param name="salign" value="" />
				    <param name="allowScriptAccess" value="sameDomain" />
		        </object>
            </div>

            <div class="col-md-5" style="margin-top:50px;">
                <div class="section-header">
                    <h2 class="section-heading animated" data-animation="bounceInUp">O que são πJM's?</h2>
                    <p>Já pensou em você conseguir investir em seus estudos? Se a resposta for não, comece a pensar sobre. O mercado de trabalho está a cada dia mais exigente e não podemos ficar parados no tempo, o conhecimento tem que se renovar, pois assim como o tempo futuro é mutável, os conhecimentos também; então chegou a sua hora de mudar, preparado? </p>
                </div>
            </div>
        </div>

    </div>
</section>

<<!-- rodape -->
  <section id="footer" class="section footer">
    <div class="container">
      <div class="row animated opacity mar-bot20" data-andown="fadeIn" data-animation="animation">
        <div class="col-sm-12 align-center">
          <ul class="social-network social-circle">
            <li><a href="https://facebook.com" class="icoFacebook" title="Facebook"><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"><i class="fab fa-facebook-f"></i></a></li>
            <li><a href="https://twitter.com" class="icoTwitter" title="Twitter"><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"><i class="fab fa-twitter"></i></a></li>
            <li><a href="https://instagram.com" class="icoGoogle" title="Instagram"><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"><i class="fab fa-instagram"></i></a></li>
          </ul>
        </div>
      </div>
      <div class="row align-center mar-bot20">
        <ul class="footer-menu">
            <li><a href="HomeINICIO.aspx">Home</a></li>
          <li><a href="CursosINICIO.aspx">Cursos</a></li>
          <li><a href="MoedaINICIO.aspx">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx">Quem somos</a></li>
		  <li><a href="ContatoINICIO.aspx">Contato</a></li>
		  <li><a href="LoginINICIO.aspx">Login</a></li>
        </ul>
      </div>
      <div class="row align-center copyright">
        <div class="col-sm-12">
          <p>MyTeach &copy; Todos os direitos reservados</p>
        </div>
      </div>
      <div class="credits">
        <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Vlava
        -->
        Design produzido por <a href="https://bootstrapmade.com/">BootstrapMade.com</a>
      </div>
    </div>

  </section>
  <a href="#header" class="scrollup"><i class="fa fa-chevron-up"></i></a>

  <!-- Javascript Library Files -->
  <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
  <script src="js/jquery.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.isotope.min.js"></script>
  <script src="js/jquery.nicescroll.min.js"></script>
  <script src="js/fancybox/jquery.fancybox.pack.js"></script>
  <script src="js/skrollr.min.js"></script>
  <script src="js/jquery.scrollTo.min.js"></script>
  <script src="js/jquery.localScroll.min.js"></script>
  <script src="js/stellar.js"></script>
  <script src="js/jquery.appear.js"></script>
  <script src="js/jquery.flexslider-min.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>

          </form>

</body>

</html>




