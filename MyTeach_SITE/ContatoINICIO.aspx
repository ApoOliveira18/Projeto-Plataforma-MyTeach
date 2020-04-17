<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContatoINICIO.aspx.cs" Inherits="ContatoINICIO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Contato</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style1Contato.css">
  <!-- skin -->
  <link rel="stylesheet" href="skin/default.css">
  <!-- =======================================================
    Theme Name: Vlava
    Theme URL: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
    <link rel="shortcut icon" href="img/logo_site_preta (1).ico" type="image/x-icon"/>

    <script src="js/uikit.js"></script>
    <script src="js/components/notify.js"></script>

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
          <li><a href="MoedaINICIO.aspx">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx">Quem somos</a></li>
		  <li class="active" ><a href="ContatoINICIO.aspx">Contato</a></li>
		  <li><a href="LoginINICIO.aspx"><i class="fas fa-user-circle"></i> Login</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>



 <!-- mapa -->
  <section id="section-map" class="clearfix">
 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3667.2102199414585!2d-45.90733768502907!3d-23.199008284863993!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94cc35f54a9ee7e9%3A0x3b27aa315a722063!2sETEP+Faculdades!5e0!3m2!1spt-BR!2sbr!4v1558729243259!5m2!1spt-BR!2sbr" width="100%" height="380" frameborder="0" style="border:0" allowfullscreen></iframe>
   
  </section>

  <!-- contato -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Fale conosco</h2>
            <p>Tem alguma dúvida? Reclamação? Ou alguma sugestão de cursos? Manda pra gente!</p>
          </div>
        </div>
      </div>



      <div class="row mar-bot40">
        <div class="col-md-8 col-md-offset-2">
          <div class="cform" id="contact-form">

              <div class="field your-name form-group">
                  <asp:TextBox ID="txtNome" runat="server" placeholder="Seu nome" title="Nome" class="cform-text" size="100" data-rule="minlen:4"></asp:TextBox>
                   <div class="validation">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage= "Digite ao menos 4 caracteres" ControlToValidate="txtNome" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
              </div>

              <div class="field your-email form-group">
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Seu email" title="Email" class="cform-text" size="100" data-rule="email" ></asp:TextBox>
                   <div class="validation">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage= "Insira um endereço de email válido." ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                   </div>
              </div>

              <div class="field subject form-group">
                   <asp:TextBox ID="txtAssunto" runat="server" placeholder="Digite o asssunto" title="Assunto" class="cform-text" size="100" data-rule="minlen:4"  ></asp:TextBox>
                   <div class="validation">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage= "Favor digitar ao menos 8 caracteres para o assunto" ForeColor="Red" ControlToValidate="txtAssunto"></asp:RequiredFieldValidator>
                </div>
                  </div>
                 
              <div class="field message form-group">
                   <asp:TextBox ID="txtMensagem" runat="server" placeholder="Digite a mensagem" title="Mensagem" class="cform-textarea" cols="40" rows="10" data-rule="required" size="100" height="150"></asp:TextBox>
                   <div class="validation">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage= "Escreva sua mensagem" ForeColor="Red" ControlToValidate="txtMensagem"></asp:RequiredFieldValidator>
                </div>
                  </div>

              <div class="send-btn">
                  <asp:Button ID="btnEnviar" runat="server" Text="Enviar" class="btn btn-theme" OnClick="btnEnviar_Click" />
              </div>

                <div class="text-center">
                    <asp:Label ID="lblErro" runat="server" EnableViewState="False" ForeColor="Red" ></asp:Label>
                </div>
                 
              </div>
          </div>
        </div>

      </div>    
  </section>

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
          <li class="active"><a href="HomeINICIO.aspx">Home</a></li>
         <li><a href="CursosINICIO.aspx">Cursos</a></li>
          <li><a href="MoedaINICIO.aspx">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx">Quem somos</a></li>
		  <li> <a href="ContatoINICIO.aspx">Contato</a></li>
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

