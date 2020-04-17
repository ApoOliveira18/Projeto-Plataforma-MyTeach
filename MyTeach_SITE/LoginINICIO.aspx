<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginINICIO.aspx.cs" Inherits="LoginINICIO" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Login</title>
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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
    async defer></script>
<script type="text/javascript">
    var onloadCallback = function () {
        grecaptcha.render('dvCaptcha', {
            'sitekey': '<%=ReCaptcha_Key %>',
            'callback': function (response) {
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/VerifyCaptcha",
                    data: "{response: '" + response + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var captchaResponse = jQuery.parseJSON(r.d);
                        if (captchaResponse.success) {
                            $("[id*=txtCaptcha]").val(captchaResponse.success);
                            $("[id*=rfvCaptcha]").hide();
                        } else {
                            $("[id*=txtCaptcha]").val("");
                            $("[id*=rfvCaptcha]").show();
                            var error = captchaResponse["error-codes"][0];
                            $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                        }
                    }
                });
            }
        });
    };
</script>

    <style>

        section{margin-top:100px;}

        .botoes {
            background-color: #00C9BC;
            color: #FFFFFF;
            text-align: center;
            width:150px;
            height:50px;
            margin-top:20px;
            text-shadow: none;
            font-size: 14px;
            padding: 0.5em;
            letter-spacing: 0.05em;
            display: block;
            border: 0;
            text-transform: none;
            border-radius: 0;
            -moz-border-radius: 0;
            -webkit-border-radius: 0;
            box-shadow: none;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
        }

    </style>
</head>

<body>

      <form runat ="server">

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
          <li><a href="HomeINICIO.aspx" style="color: #80ed2d;">Home</a></li>
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


  
  <!-- section works -->
  <section id="section-works" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Nossos cursos</h2>
            <p>Aqui estão alguns dos cursos de nossa plataforma, caso queira conhecer mais cadastre-se.</p>
          </div>
        </div>
      </div>

        <div class="cform" id="contact-form">

          <div class="row mar-bot40">
              <div class="col-md-8 col-md-offset-2">
                  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                      <asp:TextBox ID="txtLogin" runat="server" placeholder="E-mail" class="cform-text" size="40" data-rule="minlen:4" ></asp:TextBox>
                  </div>

                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Digite seu email" ForeColor="Red" ControlToValidate="txtLogin"></asp:RequiredFieldValidator>

                  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                      <asp:TextBox ID="txtSenha" runat="server"  class="cform-text"  placeholder="Senha" type="password" Height="55px" Width="750px"></asp:TextBox>
                      
                  </div>

                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Digite sua senha" ForeColor="Red" ControlToValidate="txtSenha"></asp:RequiredFieldValidator>
              </div>
          </div>
        </div>

        <div class="row mar-bot40">
                    <!--PANEL DA TENTATIVA -->
                <asp:Panel ID="pnlTenativa" runat="server">
                    <div class="field your-name form-group">
                        <div class="col-md-offset-3 col-md-3">
                    <div id="dvCaptcha">

   <asp:Panel ID="pnlEsconder" runat="server" Height="100px" Width="200px">
    </asp:Panel>
</div>

<asp:TextBox ID="txtCaptcha" runat="server"  Style="display: none" />
<asp:RequiredFieldValidator ID = "rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
    runat="server" ForeColor = "Red" Display = "Dynamic" Enabled="False" />
                        </div>
                </div>

                <div class="col-md-offset-1 col-md-2">
                    <asp:Button ID="btnProsseguir" runat="server" class="botoes" Text="Prosseguir" OnClick="btnProsseguir_Click" CausesValidation="False" />
                </div>
                </asp:Panel>
          </div>

          <div class="row mar-bot40">
              <div class="col-md-offset-5 col-md-2">
                  <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label>             
                  <asp:Button ID="btnEntrar" runat="server" class="botoes" Text="Entrar" OnClick="btnEntrar_Click" />                
              </div>
          </div>      
				
          <div class="row mar-bot40">
              <div class="col-md-offset-3 col-md-6">
                  <p>Ainda não possui uma conta? <asp:LinkButton ID="LinkButton1" runat="server" class="cadastro" OnClick="LinkButton1_Click" CausesValidation="False" ForeColor="#00C9BC">Cadastre-se aqui!</asp:LinkButton></p>
              </div>

              <div class="col-md-offset-3 col-md-6">
                  <p>Esqueceu sua senha? <asp:LinkButton ID="EsqueciMinhaSenha" runat="server" class="cadastro" OnClick="LinkButton2_Click" CausesValidation="False" ForeColor="#00C9BC"> Esqueci Minha Senha!</asp:LinkButton></p>
              </div>
          </div>

      </div>
 
        <asp:SqlDataSource ID="sqlAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_user, email_user, pass_user, nome_user, status_user FROM aluno WHERE (email_user = @Email) AND (pass_user = @Senha)" UpdateCommand="UPDATE aluno SET status_user = 'on' WHERE (id_user = @Id_user)" >
     <SelectParameters>
         <asp:Parameter  Name="Email" />
         <asp:Parameter  Name="Senha" />
     </SelectParameters>
          <UpdateParameters>
              <asp:SessionParameter Name="Id_user" SessionField="Id_user" />
          </UpdateParameters>
 </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlProfessor" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT email_prof, pass_prof, id_prof, id_pagtprof, nome_prof, status_prof FROM professor WHERE (email_prof = @Email) AND (pass_prof = @Senha)" UpdateCommand="UPDATE professor SET status_prof = 'on' WHERE (id_prof = @Id_prof)">
 <SelectParameters>
         <asp:Parameter Name="Email"  />
         <asp:Parameter Name="Senha" />
     </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="Id_prof" SessionField="Id_prof" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_adm, nome_adm, email_adm, dataNasc_adm, cpf_adm, sexo_adm, cep_adm, cidade_adm, rua_adm, bairro_adm, num_adm, tel_adm, pass_adm, imagem_adm, datacad_adm, pass1_adm, pass2_adm, acesso_adm, status_adm, pergsecre_adm FROM adm WHERE (email_adm = @Email) AND (pass_adm = @Senha)" UpdateCommand="UPDATE adm SET status_adm = 'on' WHERE (id_adm = @Id_adm)">
      <SelectParameters>
         <asp:Parameter  Name="Email"  />
         <asp:Parameter  Name="Senha"/>
     </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="Id_adm" SessionField="Id_adm" />
        </UpdateParameters>
 </asp:SqlDataSource>
                 
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



