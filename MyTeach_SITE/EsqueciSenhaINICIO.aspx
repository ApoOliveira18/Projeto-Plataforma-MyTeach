<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EsqueciSenhaINICIO.aspx.cs" Inherits="EsqueciSenhaINICIO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Esqueci a Senha</title>
    <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style1EsqueciSenhaINICIO.css">
  <!-- skin -->
  <link rel="stylesheet" href="skin/default.css">
  <!-- =======================================================
    Theme Name: Vlava
    Theme URL: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
    <link rel="shortcut icon" href="img/logo_site_preta (1).ico" type="image/x-icon"/>

     <script src="js/jquery-2.1.1.min.js"></script>
     <script src="js/jquery.maskedinput.min.js"></script>
     <script type="text/javascript">
         jQuery(function ($) {
             $("#txtCPF").mask("999.999.999-99");
         });
    </script>


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
          <li ><a href="HomeINICIO.aspx" style="color: #80ed2d;">Home</a></li>
          <li><a href="CursosINICIO.aspx" style="color: #80ed2d;">Cursos</a></li>
          <li><a href="MoedaINICIO.aspx" style="color: #80ed2d;">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx" style="color: #80ed2d;">Quem somos</a></li>
		  <li><a href="ContatoINICIO.aspx" style="color: #80ed2d;">Contato</a></li>
		  <li class="active"><a href="LoginINICIO.aspx" style="color: #80ed2d;"><i class="fas fa-user-circle"></i> Login</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>

  <!-- contact -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Esqueci a Senha</h2>
            <p>Preencha corretamente o campo d o Email que será enviado a senha cadastrada por ele</p> 
          </div>
        </div>
      </div>



    <div class="cform" id="contact-form">

        
        <div class="row mar-bot40">
            <div class="col-md-8 col-md-offset-2">
                <asp:TextBox ID="txtCPF" runat="server" placeholder="Digite seu CPF" title ="CPF" class="cform-text" size="40" data-rule="minlen:4"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCPF" runat="server" ErrorMessage="Digite seu CPF" ForeColor="Red" ControlToValidate="txtCPF"></asp:RequiredFieldValidator>
            </div>
        </div> 

        <div class="row mar-bot40">
            <div class="col-md-8 col-md-offset-2">
                <asp:TextBox ID="txtEsqueciMinhaSennha" runat="server" placeholder="Digite seu email" title="Email" class="cform-text" size="40" data-rule="minlen:4" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Digite seu email" ForeColor="Red" ControlToValidate="txtEsqueciMinhaSennha"></asp:RequiredFieldValidator>
             <asp:Label ID="lblErroTentativa" runat="server" ForeColo="00000" ForeColor="Red"></asp:Label>
         
            </div>
        </div>
        <div class="row mar-bot40">
                  </div>

        <div class="row mar-bot40" style="margin-left:25px;">
            <div class="col-md-offset-3 col-md-3">
                <asp:Button ID="btnVoltarEsqueciSenha" runat="server" Text="Voltar"  style="color: #FFFFFF; background-color: #00c9bc; text-align: center;" OnClick="btnVoltarEsqueciSenha_Click" CausesValidation="False" />
            </div>

            <div class="col-md-3">
                <asp:Button ID="btnEsqueciSenha" runat="server" Text="Enviar"  style="color: #FFFFFF; background-color: #00c9bc; text-align: center;" OnClick="btnEsqueciSenhaEntrar_Click" />
            </div>
        </div>

                    <asp:SqlDataSource ID="sqlTentativaAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT email_user, pass_user,Cpf_user FROM aluno WHERE (email_user = @Email) and (cpf_user = @CPF)">
                        <SelectParameters>
                            <asp:Parameter Name="Email"/>
                             <asp:Parameter Name="CPF" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="sqlTentativaProf" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT email_prof, pass_prof, cpf_prof FROM professor WHERE (email_prof = @Email) AND (cpf_prof = @CPF)" >
                         <SelectParameters>
                            <asp:Parameter Name="Email" />
                             <asp:Parameter Name="CPF" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="sqlTentativaADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT email_adm, pass_adm, cpf_adm FROM adm WHERE (email_adm = @Email) AND (cpf_adm = @CPF)" >
                         <SelectParameters>
                            <asp:Parameter  Name="Email" />
                             <asp:Parameter Name="CPF" />
                             </SelectParameters>
                    </asp:SqlDataSource>

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

