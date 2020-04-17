<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MinhaContaALUNO.aspx.cs" Inherits="MinhaContaALUNO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Minha Conta</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style2MinhaConta.css">
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
             $("#txtData").mask("99/99/9999");
             $("#txtTel").mask("(99) 99999-9999");
             $("#txtCep").mask("99999-999");
             $("#txtCpf").mask("999.999.999-99");
         });
    </script>
     <style>
        section{margin:100px;}
        
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

        .auto-style1 {
            width: 193px;
        }


    </style>
</head>

<body>

    <form runat ="server"  method="post" >

<!-- cabecalho -->
  <section id="header" class="appear"></section>
  <div class="navbar navbar-fixed-top" role="navigation" data-0="line-height:100px; height:100px; background-color:rgba(102, 26, 102,1);" data-300="line-height:60px; height:60px; background-color:rgba(102, 26, 102,1);">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      	  <span class="fa fa-bars color-white"></span>
        </button>
        <div class="navbar-logo">
          <a href="HomeALUNO.aspx"><img data-0="width:180px;" data-300=" width:120px;" src="img/marca_myteach.png" alt=""></a>
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" data-0="margin-top:20px;" data-300="margin-top:5px;">
          <li><a href="HomeALUNO.aspx">Home</a></li>
          <li><a href="CursoALUNO.aspx">Cursos</a></li>
          <li><a href="MinhasPjmALUNO.aspx">Minhas πJM</a></li>
		  <li><a href="MinhasComprasALUNO.aspx">Minhas Compras</a></li>
		  <li class="active"><a href="MinhaContaALUNO.aspx"> <i class="fas fa-user-graduate"> </i> Minha Conta</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>


<!--conteudo-->
<section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp"> Minha Conta</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="cform" id="contact-form">

                <div class="field your-name form-group" style="font-size: 16px; color: #000000">
                Nome:  <asp:Label ID="lblNome" runat="server" class="cform-text" ></asp:Label> </div>
			  
			   <div class="field your-name form-group" style="font-size: 16px; color: #000000; margin-top:50px;">
                Sexo:  <asp:Label ID="lblSexo" runat="server" class="cform-text" ></asp:Label> </div>
			  			  			  
			  <div class="field your-name form-group"style="font-size: 16px; color: #000000; margin-top:50px;">
                 Email: <asp:Label ID="lblEmail" runat="server" class="cform-text" ></asp:Label>             
                  </div>
			  
			  <div class="field your-name form-group"style="font-size: 16px; margin-top:50px; color: #000000">
                CPF:  <asp:Label ID="lblCpf" runat="server" class="cform-text" Text="Label"></asp:Label>
              </div>

                <div class="field your-name form-group"style="font-size: 16px; margin-top:50px; color: #000000">
                 Telefone: <asp:TextBox ID="txtTel" runat="server"   ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Digite seu telefone" ControlToValidate="txtTel" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
			  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                Data de Nascimento:  <asp:TextBox ID="txtData" runat="server"  ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Digite sua data de nascimento" ControlToValidate="txtData" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblData" runat="server" ForeColor="red"></asp:Label> 
              </div>
			  
			  <div class="field message form-group"style="font-size: 16px; color: #000000">
                CEP:  <asp:TextBox ID="txtCep" runat="server"  class="cform-text"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Digite seu CEP" ControlToValidate="txtCep" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>

			  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                Rua:  <asp:TextBox ID="txtRua" runat="server"  class="cform-text"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Digite o nome da sua rua" ControlToValidate="txtRua" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
			  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                  Número:<asp:TextBox ID="txtNúmero" runat="server"  class="cform-text"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Digite o número da sua moradia" ControlToValidate="txtNúmero" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
              <div class="field your-email form-group"style="font-size: 16px; color: #000000">
               Bairro:   <asp:TextBox ID="txtBairro" runat="server"  class="cform-text"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Digite o nome do seu bairro" ControlToValidate="txtBairro" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
			   <div class="field your-email form-group"style="font-size: 16px; color: #000000">
                 Cidade:  <asp:TextBox ID="txtCidade" runat="server"  class="cform-text"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Digite o nome da sua cidade" ControlToValidate="txtCidade" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>

               <p>Sua senha deve ter mínino 6 e no máximo 12 caracteres, contendo:
               <p> - Uma letra minúscula;</p>
                   <p> - Uma letra maiúscula;</p>
               <p> - Um número;</p>
                  <p>   - Um caractere especial.</p>

                <div class="field your-name form-group"style="font-size: 16px; color: #000000; margin-top:50px;">
                Senha:<asp:TextBox ID="txtSenha" runat="server"  class="cform-text" type="password" Height="55px" Width="750px"></asp:TextBox>
			   <asp:LinkButton ID="lnkSenha" runat="server" OnClick="lnkSenha_Click" ForeColor="#9933FF" CausesValidation="False"><i class="fas fa-exclamation-circle"></i> Verificar Senha</asp:LinkButton>
                    <asp:Label ID="lblFraca" runat="server" ForeColor="Red" ></asp:Label>
                    &nbsp;&nbsp;
                    <asp:Label ID="lblForte" runat="server" ForeColor="#00CC00"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Digite sua senha" ControlToValidate="txtSenha" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>

                <div class="field your-name form-group"style="font-size: 16px; color: #000000">
               Confirmar Senha:<asp:TextBox ID="txtConfSenha" runat="server"  class="cform-text" type="password" Height="55px" Width="750px"></asp:TextBox>
			  <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="As senhas não conhecidem" ControlToValidate="txtConfSenha" ControlToCompare="txtSenha" ForeColor="Red"></asp:CompareValidator>
                    <asp:Label ID="lblConfSenha" runat="server" title ="Checagem de confimar senha" ForeColor="Red"> </asp:Label>
                    </div>

              <div class="row mar-bot40">
                     
                      <div class="col-md-2" style="margin-top:50px; color: #000000; font-family: Arial; font-size: 16px;">
                          Sua foto:
                      </div>

                      <div class="col-md-3 auto-style1">
                          <asp:Image ID="Img" runat="server" Height="138px" Width="161px" />
                      </div>

                      <div class="col-md-offset-1 col-md-3"style="margin-top:50px;">
                          <asp:FileUpload ID="flFoto" runat="server" />
                      </div>

                  </div>



              <div class="row mar-bot40" style="margin-left:50px;">
                     
                      <div class="col-md-2">
                          <asp:Button ID="btnVoltar" runat="server" Text="VOLTAR" class="botoes" width="120px" Height="50px" OnClick="btnVoltar_Click" CausesValidation="False"   />
                      </div>

                      <div class="col-md-offset-2 col-md-2">
                          <asp:Button ID="btnDesativar" runat="server" Text="DESATIVAR" class="botoes" width="120px" Height="50px" OnClick="btnDesativar_Click" />
                      </div>

                      <div class="col-md-offset-2 col-md-2">
                          <asp:Button ID="btnAlterar" runat="server" Text="ALTERAR" class="botoes" width="120px" Height="50px" OnClick="btnAlterar_Click"   />
                      </div>

              </div>

                  </div>

              </div>
                 
          </div>
        </div>
        <!-- ./span12 -->
    
            <asp:SqlDataSource ID="sqlMinhaConta" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_user, nome_user, email_user, dataNasc_user, cpf_user, sexo_user, cep_user, cidade_user, rua_user, bairro_user, num_user, tel_user, pass_user, imagem_user FROM aluno WHERE (id_user = @ID)" DeleteCommand="DELETE FROM aluno WHERE (id_user = @ID)" UpdateCommand="UPDATE aluno SET  nome_user = @NovoNome, email_user = @NovoEmail, dataNasc_user = @NovaDataNasc, cpf_user = @NovoCPF, sexo_user = @NovoSexo, cep_user = @NovoCEP, cidade_user = @NovaCidade, rua_user = @NovaRua, bairro_user = @NovoBairro, num_user = @NovoNum, tel_user = @NovoTel, pass_user = @NovaSenha, imagem_user = @NovoFoto WHERE (id_user = @ID)">
                 <DeleteParameters>
                        <asp:SessionParameter Name="ID" SessionField="Id_user" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ID" SessionField="Id_user" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NovoNome"/>
                        <asp:Parameter Name="NovoEmail"  />
                        <asp:Parameter Name="NovaDataNasc" />
                        <asp:Parameter Name="NovoCPF" />
                        <asp:Parameter Name="NovoSexo"/>
                        <asp:Parameter Name="NovoCEP"  />
                        <asp:Parameter Name="NovaCidade"  />
                        <asp:Parameter Name="NovaRua"  />
                        <asp:Parameter Name="NovoBairro" />
                        <asp:Parameter Name="NovoNum" />
                        <asp:Parameter Name="NovoTel"  />
                        <asp:Parameter Name="NovaSenha"  />
                        <asp:Parameter Name="NovoFoto" />
                        <asp:SessionParameter Name="ID" SessionField="Id_user" />
                    </UpdateParameters>
            </asp:SqlDataSource>    

                 <asp:SqlDataSource ID="sqlDesativar" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [aluno]" UpdateCommand="UPDATE aluno SET status_user = 'off' WHERE (id_user = @IDALUNO)">
                     <UpdateParameters>
                         <asp:SessionParameter Name="IDALUNO" SessionField="Id_user" />
                     </UpdateParameters>
                     </asp:SqlDataSource>
              <asp:SqlDataSource ID="sqlUpdateAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriau" InsertCommand="INSERT INTO auditoriau(datahora_audU, id_user, acao_audU, desc_audU) VALUES (@DATAHORA, @IDALUNO, @ACAO, @DESC )">
              <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:SessionParameter Name="IDALUNO" SessionField="Id_user" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                     </InsertParameters>
                  </asp:SqlDataSource>
      <asp:SqlDataSource ID="sqlDesativarAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriau" InsertCommand="INSERT INTO auditoriau(datahora_audU, id_user, acao_audU, desc_audU) VALUES (@DATAHORA, @IDALUNO, @ACAO, @DESC )">
              <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:SessionParameter Name="IDALUNO" SessionField="Id_user" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                     </InsertParameters>
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
        <li><a href="HomeALUNO.aspx">Home</a></li>
          <li><a href="CursoALUNO.aspx">Cursos</a></li>
          <li><a href="MinhasPjmALUNO.aspx">Minhas πJM</a></li>
		  <li><a href="MinhasComprasALUNO.aspx">Minhas Compras</a></li>
		  <li><a href="MinhaContaALUNO.aspx"> Minha Conta</a></li>
            <li><asp:LinkButton ID="lnHelp" runat="server" OnClick="lnHelp_Click">Help</asp:LinkButton></li>
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




