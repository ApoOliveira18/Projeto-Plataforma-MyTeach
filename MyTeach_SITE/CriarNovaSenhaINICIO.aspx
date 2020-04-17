<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CriarNovaSenhaINICIO.aspx.cs" Inherits="CriarNovaSenhaINICIO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Alterar Senha</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style1CriarNovaSenha.css">
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
        section{margin-top:100px}

        .btnVoltar {
    margin: 0 auto 20px auto !important;
    position: relative; top: 50px; left:-86px;
}

       .btnVoltarProf {
    margin: 0 auto 20px auto !important;
    position: relative;
    top: 50px; 
    left:-285px;
}
        .btnCadastrarProf {
            margin: 0 auto 20px auto !important;
            position: relative;
            top: -30px;
            left: 275px;
        }
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css" media="screen">
		html, body { height:100%; background-color: #ffffff;}
		body { margin:0; padding:0; overflow:hidden; }
		#flashContent { width:100%; height:100%; }     

    
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
          <li><a href="MoedaINICIO.aspx">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx">Quem somos</a></li>
		  <li><a href="ContatoINICIO.aspx">Contato</a></li>
		  <li><a href="LoginINICIO.aspx"><i class="fas fa-user-circle"></i> Login</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>

  <!-- Conteudo-->
<section id="section-about" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Alterar Senha</h2>
          </div>
        </div>
      </div>


      <div class="cform" id="contact-form" style="margin-top:70px;">

      <div class="row mar-bot40">

            <div class="col-md-offset-2 col-md-8" style="font-size: 16px; color: #000000;">
                <asp:TextBox ID="txtSenha" runat="server" name="senha" placeholder="Senha" title ="Senha Antiga" type="password" Height="55px" Width="750px"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSenha" ErrorMessage="Digite uma senha que siga os caracteres" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
          <div class="col-md-offset-2 col-md-8">
             <p>Sua senha deve ter mínino 6 e no máximo 12 caracteres, contendo:
               <p> - Uma letra minúscula;</p>
                   <p> - Uma letra maiúscula;</p>
               <p> - Um número;</p>
                  <p>   - Um caractere especial.</p>
          </DIV>

            <div class="col-md-offset-2 col-md-8">
                <asp:TextBox ID="txtNovaSenha" style="margin-top:20px;" runat="server" placeholder="Nova senha" title ="Senha Nova" type="password" Height="55px" Width="750px"></asp:TextBox>
                
                <asp:LinkButton ID="lnkSenha" runat="server" ForeColor="#9933FF" CausesValidation="False" OnClick="lnkSenha_Click1"><i class="fas fa-exclamation-circle"></i> Verificar Senha</asp:LinkButton>
                <asp:Label ID="lblFraca" runat="server" ForeColor="Red" ></asp:Label>
                    &nbsp;&nbsp;
                <asp:Label ID="lblForte" runat="server" ForeColor="#00CC00"></asp:Label>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNovaSenha" ErrorMessage="Digite uma senha que siga os caracteres" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="col-md-offset-2 col-md-8">
                <asp:TextBox ID="txtConfSenha" style="margin-top:20px;" runat="server" placeholder="Confirmar nova senha" title ="Confirmar Senha" type="password" Height="55px" Width="750px" ></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Senhas não coincidem" ForeColor="Red" ControlToCompare="txtNovaSenha" ControlToValidate="txtConfSenha"></asp:CompareValidator>
              <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label>
            </div>

      </div>

            <div class="row mar-bot40">
              
            </div>
      


      <div class="row mar-bot40">

            <div class="col-md-offset-2 col-md-2" style="float:left;">
               <asp:Button runat="server" BackColor="#00C9BC" style="width:160px;" Text="VOLTAR" OnClick="Unnamed1_Click"/>
            </div>

            <div class="col-md-offset-4 col-md-2">
               <asp:Button runat="server" Text="ALTERAR" style="width:160px;" BackColor="#00C9BC" OnClick="Unnamed2_Click"/>
            </div>

      </div>

              <asp:SqlDataSource ID="sqlADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM adm" UpdateCommand="UPDATE adm SET pass_adm = @SenhaNova, pass1_adm = @SenhaAtual, pass2_adm = @Senha1, datacad_adm = @DATAHORA, acesso_adm = '1' WHERE (id_adm = @Id_adm)">
                  <UpdateParameters>
                      <asp:Parameter Name="SenhaAtual" />
                      <asp:Parameter Name="SenhaNova" />
                      <asp:Parameter Name="DATAHORA" />
                      <asp:SessionParameter Name="Id_adm" SessionField="Id_adm" />
                      <asp:Parameter Name="Senha1" />
                  </UpdateParameters>
              </asp:SqlDataSource>
                
                
             <asp:SqlDataSource ID="sqlAudAdm" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" InsertCommand="INSERT INTO auditoriaa(datahora_audA, acao_audA, desc_audA, id_adm) VALUES (@DATAHORA, @ACAO, @DESC , @ID)"  SelectCommand="SELECT * FROM auditoriaa">
                     <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                           <asp:SessionParameter Name="ID" SessionField="Id_adm" />
                     </InsertParameters>
            </asp:SqlDataSource>

                
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

