<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerMaisProfADM.aspx.cs" Inherits="VerMaisProfADM" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Ver Mais Informações</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style4VerMaisInfoProf.css">
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
        section{margin:100px;}
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

<!--conteudo-->
<section id="section-about" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">

        <div class="col-md-6">
          <div class="section-header">
            <h2 style="float:left;" class="section-heading animated" data-animation="bounceInUp"><asp:Label ID="lblNome" runat="server" ></asp:Label></h2>
          </div>
        </div>
      </div>



        <div class="row mar-bot40" style="margin-top:-30px;">

           <div class="col-md-3">
              <asp:Image ID="imgProf" runat="server"  class="img-responsive" width="200px" height="200px"/>
           </div>

           <div class="col-md-3" style="margin-left:-50px; margin-top:10px;" >
              <div><h4>Idade: </h4><asp:Label ID="lblIdade" runat="server"></asp:Label></div>
              <div><h4>Sexo: </h4><asp:Label ID="lblSexo" runat="server"></asp:Label></div>
               <div><h4>Email: </h4><asp:Label ID="lblEmail" runat="server"></asp:Label></div>
               <div><h4>Telefone: </h4><asp:Label ID="lblTelefone" runat="server"></asp:Label></div>
                 


              </div>
               
               <div class="row mar-bot40">
               <div class="col-md-6" style="margin-left:50px; margin-top:10px;">                        
               <div><h4>Cidade: </h4><asp:Label ID="lblCidade" runat="server"></asp:Label></div>
               <div><h4>Bairro: </h4><asp:Label ID="lblBairro" runat="server"></asp:Label></div>
               <div><h4>Rua: </h4><asp:Label ID="lblRua" runat="server"></asp:Label></div>          
              <div><h4>Número: </h4><asp:Label ID="lblNúmero" runat="server"></asp:Label> </div>
          
             
               </div>
           </div>
        </div>



        <div class="row mar-bot40">
           <div class="col-md-1">
              <h4>Diploma: </h4>      
           </div>
        </div>

        <div  class="row mar-bot40">
           <div class="col-md-6">       
              <asp:Image ID="Diploma" runat="server" class="img-responsive" width="500px" height="300px"/>
           </div>
                 
            <div class="col-md-12"  style="margin-left:580px; margin-top:-300px;">       
              <asp:Image ID="DiplomaFrente" runat="server"  class="img-responsive" width="500px" height="300px"/>
           </div>
        </div>

        
          <asp:Button ID="btnExcluir" runat="server" Text="Desativar"   class="btn btn-theme" style="background-color:#00c9bc;  left:62px; top: 100px; " Height="50px" Font-Size="X-Large" Width="156px" OnClick="btnExcluir_Click1" />

           <br />
        <br />
        <br />
        <asp:SqlDataSource ID="sqlProf" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" DeleteCommand="DELETE FROM professor WHERE (email_prof = @EmailProf)" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT nome_prof, email_prof, sexo_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, dataNasc_prof, cpf_prof, pass_prof, id_prof FROM professor WHERE (email_prof = @EmailProf)" UpdateCommand="UPDATE professor SET status_prof = 'off' WHERE (id_prof = @idProf)">
            <DeleteParameters>
                <asp:Parameter Name="EmailProf" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="EmailProf" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="idProf" />
            </UpdateParameters>
        </asp:SqlDataSource>

           <asp:SqlDataSource ID="sqlProfEscolhido" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT nome_prof, email_prof, sexo_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, dataNasc_prof, cpf_prof, pass_prof, id_prof FROM professor WHERE (nome_prof = @NomeProf)" UpdateCommand="UPDATE professor SET status_prof = 'off' WHERE (id_prof = @idProfEscolhido)">
               <SelectParameters>
                   <asp:Parameter Name="NomeProf" />
               </SelectParameters>
               <UpdateParameters>
                   <asp:Parameter Name="idProfEscolhido" />
               </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="sqlAudAdm" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" InsertCommand="INSERT INTO auditoriaa(datahora_audA, id_adm, acao_audA, desc_audA) VALUES (@DATAHORA, @IDADM, @ACAO, @DESC )" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriaa">
                     <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:SessionParameter Name="IDADM" SessionField="Id_adm" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                     </InsertParameters>
            </asp:SqlDataSource>

           <div class="col-md-12"  style="margin-left:910px; margin-top: -55px"> 
        <asp:Button ID="BtnVoltar" runat="server" Text="VOLTAR"   class="btn btn-theme" style="background-color:#00c9bc;  left:62px; top: 100px; " Height="50px" Font-Size="X-Large" Width="156px" OnClick="btnVoltar_Click" />
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





