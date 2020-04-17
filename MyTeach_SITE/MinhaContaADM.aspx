<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MinhaContaADM.aspx.cs" Inherits="MinhaContaADM" %>
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

  <link rel="stylesheet" href="css/style4MinhaConta.css">
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
        position: relative;
        min-height: 1px;
        float: left;
        width: 16.66666667%;
        padding-left: 15px;
        padding-right: 15px;
    }
    </style>



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
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>

<br />
<br />
<br />

  <!-- contact -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header"><h2 class="section-heading animated" data-animation="bounceInUp">Minha Conta ADM </h2>
            <p>Atuzalize suas informações</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="cform" id="contact-form">
            <form runat ="server"  method="post" >

             
         <div class="field your-name form-group" style="font-size: 16px; color: #000000">
                Nome:  <asp:Label ID="lblNome" runat="server" class="cform-text"> </asp:Label>
                <br />
                <br />
               </div>
			  
			   <div class="field your-name form-group" style="font-size: 16px; color: #000000">
                Sexo:  <asp:Label ID="lblSexo" runat="server" class="cform-text"></asp:Label> </div>
			  			  			  
			   <div class="field your-name form-group" style ="font-size: 16px; margin-top:50px; color: #000000">
                 Email: <asp:Label ID="lblEmail" runat="server"  class="cform-text" ></asp:Label>
                  </div>
			  
			  <div class="field your-name form-group" style="font-size: 16px; margin-top:50px; color: #000000">
                CPF: <asp:Label ID="lblCpf" runat="server"  class="cform-text"></asp:Label> 
              </div>

                <div class="field your-name form-group"style="font-size: 16px; margin-top:50px; color: #000000">
                 Telefone: <asp:TextBox ID="txtTel" runat="server"   ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Digite seu telefone" ControlToValidate="txtTel" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
			  
			  <div class="field your-name form-group"style="font-size: 16px; color: #000000">
                Data de Nascimento:  <asp:TextBox ID="txtData" runat="server"  ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Digite sua data de nascimento" ControlToValidate="txtData" ForeColor="Red"></asp:RequiredFieldValidator>
              <asp:Label ID="lblData" runat="server" ForeColor="Red"></asp:Label>  
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
                        

                <div class="row mar-bot40">
                     
                      <div class="col-md-2" style="margin-top:50px; color: #000000; font-family: Arial; font-size: 16px;">
                          Sua foto:
                      </div>

                      <div class="col-md-3 auto-style1">
                          <asp:Image ID="Image3" runat="server" Height="138px" Width="161px" />
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
                <div class="row mar-bot40">
                    <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label>
                </div>


              <asp:SqlDataSource ID="sqlMinhaConta" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_adm, nome_adm, email_adm, dataNasc_adm, cpf_adm, sexo_adm, cep_adm, cidade_adm, rua_adm, bairro_adm, num_adm, tel_adm, imagem_adm, pass_adm, datacad_adm, pergsecre_adm, status_adm, pass1_adm, pass2_adm FROM adm WHERE (id_adm = @ID)" DeleteCommand="DELETE FROM adm WHERE (id_adm = @ID)"  UpdateCommand="UPDATE adm SET nome_adm = @NovoNome, email_adm = @NovoEmail, dataNasc_adm = @NovaDataNasc, cpf_adm = @NovoCPF, sexo_adm = @NovoSexo, cep_adm = @NovoCEP, cidade_adm = @NovaCidade, rua_adm = @NovaRua, bairro_adm = @NovoBairro, num_adm = @NovoNum, tel_adm = @NovoTel, imagem_adm = @NovoFoto WHERE (id_adm = @ID)">
                    <DeleteParameters>
                        <asp:SessionParameter Name="ID" SessionField="Id_adm" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ID" SessionField="Id_adm" />
                    </SelectParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="NovoNome" />
                        <asp:Parameter Name="NovoEmail" />
                        <asp:Parameter Name="NovaDataNasc" />
                        <asp:Parameter Name="NovoCPF"  />
                        <asp:Parameter Name="NovoSexo" />
                        <asp:Parameter Name="NovoCEP" />
                        <asp:Parameter Name="NovaCidade"  />
                        <asp:Parameter Name="NovaRua" />
                        <asp:Parameter Name="NovoBairro" />
                        <asp:Parameter Name="NovoNum" />
                        <asp:Parameter Name="NovoTel" />
                        <asp:Parameter Name="NovoFoto" />
                        <asp:SessionParameter Name="ID" SessionField="Id_adm" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                  <asp:SqlDataSource ID="sqlDesativar" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_adm, status_adm FROM adm WHERE (id_adm = @IDADM)" UpdateCommand="UPDATE adm SET status_adm = 'off' WHERE (id_adm = @IDADM)">
                      <SelectParameters>
                          <asp:SessionParameter Name="IDADM" SessionField="Id_adm" />
                      </SelectParameters>
                      <UpdateParameters>
                          <asp:SessionParameter Name="IDADM" SessionField="Id_adm" />
                      </UpdateParameters>
                      </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="sqlCount" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(id_adm) AS qtd FROM adm"></asp:SqlDataSource>
                 <asp:SqlDataSource ID="sqlUpdateADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriaa" InsertCommand="INSERT INTO auditoriaa(datahora_audA, id_adm, acao_audA, desc_audA) VALUES (@DATAHORA, @IDADM, @ACAO, @DESC )">
                <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:SessionParameter Name="IDADM" SessionField="Id_adm" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                     </InsertParameters>
                     </asp:SqlDataSource>
      
                <asp:SqlDataSource ID="sqlAuditoriaDesativar" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriaa" InsertCommand="INSERT INTO auditoriaa(id_adm, acao_audA, datahora_audA, desc_audA) VALUES (@IDADM, @ACAO, @DATAHORA, @DESC )">
                     <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:SessionParameter Name="IDADM" SessionField="Id_adm" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                     </InsertParameters>
                </asp:SqlDataSource>
                
            </form>
              </div>
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


</body>

</html>
