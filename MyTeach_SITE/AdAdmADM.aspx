<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdAdmADM.aspx.cs" Inherits="AdAdmADM" %>

<!DOCTYPE html>
<html>

<head>
 <meta charset="utf-8">
  <title>Adicionar ADMs</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style4AdADM.css">
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
    </style>

</head>

<body>

    <form runat ="server"  method="post" >

<!-- cabecalho -->
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

  <!-- contact -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Cadastre  <i class="fas fa-user-tie"> </i></h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="cform" id="contact-form">

               <div class="field your-name form-group" style="font-size: 16px; color: #000000">
           <asp:TextBox ID="txtNome" runat="server"  class="cform-text"  placeholder="Nome e sobrenome" title="Nome e sobrenome"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Digite seu nome completo" ControlToValidate="txtNome" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
			 <div class="field your-name form-group" style="margin-left:-15px; font-size: 16px; color: #000000">
                <div class="col-md-3">
                   Selecione seu sexo:
                </div>
                 <div class="col-md-7">
                   <asp:RadioButtonList ID="rbnSexo" runat="server" title ="Selecione um sexo">
                       <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                       <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                       <asp:ListItem Value="Prefiro não dizer">Prefiro não dizer</asp:ListItem>
                   </asp:RadioButtonList> 
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rbnSexo" ErrorMessage="Selecione um sexo" ForeColor="Red"></asp:RequiredFieldValidator>
                 </div>
             </div>
			  			  			  
			  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
               <asp:TextBox ID="txtEmail" style="margin-top:30px;" runat="server"   placeholder="Dgite seu email" title ="Email"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Digite seu email corretamente" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                  <asp:Label ID="lblErroEmail" runat="server" ForeColor="Red"></asp:Label>
               </div>
			  
			  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
            <asp:TextBox ID="txtCpf" runat="server"  class="cform-text" placeholder="Digite seu CPF" title="CPF"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Digite seu CPF correto" ControlToValidate="txtCpf" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblErroCPF" runat="server" ForeColor="Red"></asp:Label> 
              </div>

                <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                 <asp:TextBox ID="txtTel" runat="server"   title="Telefone" placeholder="Digite seu telefone"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Digite seu telefone" ControlToValidate="txtTel" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
			  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                 <asp:TextBox ID="txtData" runat="server"   title="Data de Nascimento" placeholder="Digite sua data de nascimento"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Digite sua data de nascimento" ControlToValidate="txtData" ForeColor="Red"></asp:RequiredFieldValidator>
                  <asp:Label ID="lblData" runat="server" ForeColor="Red"></asp:Label>
               </div>
			  
			  <div class="field message form-group" style="margin-left:-15px; font-size: 16px; color: #000000">
                 <div class="col-md-8">
                    <asp:TextBox ID="txtCep" runat="server"  class="cform-text" placeholder="Digite seu CEP" tilte="CEP"></asp:TextBox>
                 </div>
                 <div class="col-md-1">
                    <asp:LinkButton ID="lkbCEP" runat="server"  ForeColor="#3399FF" Font-Size="Medium" Font-Underline="True" OnClick="LinkButton2_Click" CausesValidation="False">Buscar CEP</asp:LinkButton>
                 </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Digite seu CEP" ControlToValidate="txtCep" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>

			  <div class="field message form-group"font-size: 16px; color: #000000">
                <asp:TextBox ID="txtRua" runat="server" style="margin-top:30px;" class="cform-text"  placeholder="Digite o nome de sua rua" title="Rua"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Digite o nome da sua rua" ControlToValidate="txtRua" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
			  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
             <asp:TextBox ID="txtNúmero" runat="server"  class="cform-text"  placeholder="Digite o número da sua casa" title="Número da Casa"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Digite o número da sua moradia" ControlToValidate="txtNúmero" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
              <div class="field your-email form-group"style="font-size: 16px; color: #000000">
                <asp:TextBox ID="txtBairro" runat="server"  class="cform-text"  placeholder="Digite seu bairro" title="Bairro"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Digite o nome do seu bairro" ControlToValidate="txtBairro" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
			   <div class="field your-email form-group"style="font-size: 16px; color: #000000">
                <asp:TextBox ID="txtCidade" runat="server"  class="cform-text"  placeholder="Digite sua cidade" title="Cidade"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Digite o nome da sua cidade" ControlToValidate="txtCidade" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>

                <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                Nome do seu professor favorito:                                  
                    <asp:TextBox ID="txtResp" runat="server"   placeholder="Digite a resposta secreta" title="Resposta secreta"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Digite a resposta secreta" ControlToValidate="txtResp" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
                            

			  <div class="row mar-bot40">
                  <div class="col-md-2" style="margin-top:50px; color: #000000; font-family: Arial; font-size: 16px;">
                      Foto do Administrador:
                  </div>

                  <div class="col-md-3 "style="margin-top:50px;">
                      <asp:FileUpload ID="flFoto" runat="server" title="Anexe uma foto do Administrador" />
                  </div>

                  <div class="col-md-5">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Anexe uma foto" ControlToValidate="flFoto" ForeColor="Red"></asp:RequiredFieldValidator>
                  </div>
              </div>
                      
                  </div>
                 
                  <div class="row mar-bot40">
                     
                      <div class="col-md-2">
                          <asp:Button ID="btnVoltar" runat="server" Text="VOLTAR" class="botoes" CausesValidation="False" OnClick="btnVoltar_Click" />
                      </div>

                      <div class="col-md-7"></div>

                      <div class="col-md-2">
                          <asp:Button ID="btnCadastrar" runat="server" Text="CADASTRAR" class="botoes" OnClick="btnCadastrar_Click" />
                      </div>

                  </div>

                <br />

                <asp:SqlDataSource ID="sqlADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM adm" InsertCommand="INSERT INTO adm(nome_adm, email_adm, dataNasc_adm, cpf_adm, sexo_adm, cep_adm, cidade_adm, rua_adm, bairro_adm, num_adm, tel_adm, pass_adm, imagem_adm, status_adm, pergsecre_adm, datacad_adm, acesso_adm, pass2_adm, pass1_adm) VALUES (@Nome, @Email, @DataNasc, @CPF, @Sexo, @CEP, @Cidade, @Rua, @Bairro, @Num, @Tel, @Senha, @Foto, 'on', @Resposta, @Data, '0', @Senha1, @Senha2)">
                    <InsertParameters>
                        <asp:Parameter Name="Nome" />
                        <asp:Parameter Name="Email" />
                        <asp:Parameter Name="DataNasc" />
                        <asp:Parameter Name="CPF" />
                        <asp:Parameter Name="Sexo" />
                        <asp:Parameter Name="CEP" />
                        <asp:Parameter Name="Cidade" />
                        <asp:Parameter Name="Rua" />
                        <asp:Parameter Name="Bairro" />
                        <asp:Parameter Name="Num" />
                        <asp:Parameter Name="Tel" />
                        <asp:Parameter Name="Senha" />
                        <asp:Parameter Name="Foto" />
                        <asp:Parameter Name="Resposta" />
                        <asp:Parameter Name="Data" />
                        <asp:Parameter Name="Senha1" />
                        <asp:Parameter Name="Senha2" />
            </InsertParameters>
                </asp:SqlDataSource>
                
                   <asp:SqlDataSource ID="sqlEmailCheckADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_adm, nome_adm, email_adm, dataNasc_adm, cpf_adm, sexo_adm, cep_adm, cidade_adm, rua_adm, bairro_adm, num_adm, tel_adm, pass_adm, imagem_adm FROM adm WHERE (email_adm = @Email)">
                       <SelectParameters>
                           <asp:Parameter Name="Email" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                 <asp:SqlDataSource ID="sqlEmailCheckAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_user, nome_user, email_user, dataNasc_user, cpf_user, sexo_user, cep_user, cidade_user, rua_user, bairro_user, num_user, tel_user, pass_user, imagem_user FROM aluno WHERE (email_user = @Email)">
                      <SelectParameters>
                           <asp:Parameter Name="Email" />
                       </SelectParameters>
                 </asp:SqlDataSource>
                 <asp:SqlDataSource ID="sqlEmailCheckProf" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_prof, nome_prof, email_prof, dataNasc_prof, cpf_prof, sexo_prof, cep_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, pass_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, id_pagtprof FROM professor WHERE (email_prof = @Email)">
                      <SelectParameters>
                           <asp:Parameter Name="Email" />
                       </SelectParameters>
                 </asp:SqlDataSource>
                   <asp:SqlDataSource ID="sqlCPFCheckADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_adm, nome_adm, email_adm, dataNasc_adm, cpf_adm, sexo_adm, cep_adm, cidade_adm, rua_adm, bairro_adm, num_adm, tel_adm, pass_adm, imagem_adm FROM adm WHERE (cpf_adm = @Cpf)">
                       <SelectParameters>
                           <asp:Parameter Name="Cpf" />
                       </SelectParameters>
                   </asp:SqlDataSource><asp:SqlDataSource ID="sqlCPFCheckAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_user, nome_user, email_user, dataNasc_user, cpf_user, sexo_user, cep_user, cidade_user, rua_user, bairro_user, num_user, tel_user, pass_user, imagem_user FROM aluno WHERE (cpf_user = @Cpf)">
                      <SelectParameters>
                           <asp:Parameter Name="Cpf" />
                       </SelectParameters>
                 </asp:SqlDataSource>
                 <asp:SqlDataSource ID="sqlCPFCheckProf" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_prof, nome_prof, email_prof, dataNasc_prof, cpf_prof, sexo_prof, cep_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, pass_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, id_pagtprof FROM professor WHERE (cpf_prof = @Cpf)">
                      <SelectParameters>
                           <asp:Parameter Name="Cpf" />
                       </SelectParameters>
                 </asp:SqlDataSource>
                
                
             <asp:SqlDataSource ID="sqlAudAdm" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" InsertCommand="INSERT INTO auditoriaa(datahora_audA, acao_audA, desc_audA, id_adm) VALUES (@DATAHORA, @ACAO, @DESC , @ID)"  SelectCommand="SELECT * FROM auditoriaa">
                     <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                           <asp:SessionParameter Name="ID" SessionField="Id_adm" />
                     </InsertParameters>
            </asp:SqlDataSource>

                
         <br />
                
          </div>
        </div>
        <!-- ./span12 -->
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
