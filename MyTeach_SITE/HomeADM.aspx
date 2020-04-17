<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomeADM.aspx.cs" Inherits="HomeADM" %>
<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Home</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style4Home.css">
  <!-- skin -->
  <link rel="stylesheet" href="skin/default.css">
  <!-- =======================================================
    Theme Name: Vlava
    Theme URL: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
    <link rel="shortcut icon" href="img/logo_site_preta (1).ico" type="image/x-icon"/>

</head>

<body>


<!-- cabecalho -->
  <section id="header" class="appear"></section>
  <div class="navbar navbar-fixed-top" role="navigation" data-0="line-height:100px; height:100px; background-color:rgba(102, 26, 102,1);" data-300="line-height:60px; height:60px; background-color:rgba(102, 26, 102,1);">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      	  <span class="fa fa-bars color-white"></span>
        </button>
        <div class="navbar-logo">
          <a href="HomeADM.aspx"><img data-0="width:180px;" data-300=" width:120px;" src="img/marca_myteach.png" alt=""></a>
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" data-0="margin-top:20px;" data-300="margin-top:5px;">
        
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>
  </section>

<br />
<br /> 
<br />
    <br /> 
<br />


  <!-- contact -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">SEJA BEM-VINDO ADM </h2>
            <p></p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="cform" id="contact-form">
            <form runat ="server"  method="post" >

              <div class="send-btn">
                  <table style="width: 100%;">
                      <tr>
                       <td> <asp:Button ID="btnMinhaConta" runat="server" Text="Minha Conta" class="btn btn-theme"  Height="102px" Width="206px" Font-Size="X-Large" OnClick="btnMinhaConta_Click" /></td>
                     
                          <td>  <asp:Button ID="btnFinanceiro" runat="server" Text="Financeiro" class="btn btn-theme"  Height="102px" Width="206px" Font-Size="X-Large" OnClick="btnFinanceiro_Click"/>    </td>    
                      </tr>
                      <tr>
                          <td>&nbsp;&nbsp; &nbsp;</td>
                          <td>&nbsp;&nbsp; &nbsp;</td>
                          <td>&nbsp;&nbsp; &nbsp;</td>
                          <td>&nbsp;&nbsp; &nbsp;</td>
                      </tr>
                       <tr>
                       <td>     <asp:Button ID="btnCursos" runat="server" Text="Cursos" class="btn btn-theme" Height="102px" Width="206px" Font-Size="X-Large" OnClick="btnCursos_Click" /></td>
                          
                      <td>  <asp:Button ID="btnCadADM" runat="server" Text="Cadastrar ADM" class="btn btn-theme" Height="102px" Width="206px" Font-Size="X-Large" OnClick="btnCadADM_Click"  />   </td>    
                      </tr>
                       <tr>
                          <td>&nbsp;&nbsp; &nbsp;</td>
                           <td>&nbsp;&nbsp; &nbsp;</td>
                           <td>&nbsp;&nbsp; &nbsp;</td>
                          <td>&nbsp;&nbsp; &nbsp;</td>
                      </tr>
                      <tr>
                       <td>     <asp:Button ID="btnCodigo" runat="server" Text="Código" class="btn btn-theme" Height="102px" Width="206px" Font-Size="X-Large" OnClick="btnCodigo_Click"  /></td>
                    
                          <td>  <asp:Button ID="btnAuditoria" runat="server" Text="Auditoria" class="btn btn-theme" Height="102px" Width="206px" Font-Size="X-Large" OnClick="btnAuditoria_Click"  />   </td>    
                      </tr>
                       <tr>
                          <td>&nbsp;&nbsp; &nbsp;</td>
                           <td>&nbsp;&nbsp; &nbsp;</td>
                           <td>&nbsp;&nbsp; &nbsp;</td>
                          <td>&nbsp;&nbsp; &nbsp;</td>
                      </tr>
                  </table>  
				  </div>
                
            </form>
              </div>
          </div>
        </div>
        <!-- ./span12 -->
      </div>    
    
  </section>
    <br />
    <br />


<!-- rodape -->
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


</body>

</html>

