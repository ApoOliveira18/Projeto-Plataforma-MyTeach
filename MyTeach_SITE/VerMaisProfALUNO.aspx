<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerMaisProfALUNO.aspx.cs" Inherits="VerMaisProfALUNO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Ver Mais Informações Professor</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style2VerMaisProf.css">
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

        .botoes {
            background-color: #00C9BC;
            color: #FFFFFF;
            text-align: center;
            width:150px;
            height:50px;
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
          <a href="HomeALUNO.aspx"><img data-0="width:180px;" data-300=" width:120px;" src="img/marca_myteach.png" alt=""></a>
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" data-0="margin-top:20px;" data-300="margin-top:5px;">
          <li><a href="HomeALUNO.aspx">Home</a></li>
          <li><a href="CursoALUNO.aspx">Cursos</a></li>
          <li><a href="MinhasPjmALUNO.aspx">Minhas πJM</a></li>
		  <li><a href="MinhasComprasALUNO.aspx">Minhas Compras</a></li>
		  <li><a href="MinhaContaALUNO.aspx"> <i class="fas fa-user-graduate"> </i> Minha Conta</a></li>
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

           <div class="col-md-2">
              <asp:Image ID="imgProf" runat="server"  class="img-responsive" width="182px" height="172px"/>
           </div>

           <div class="col-md-3" style="margin-top:10px; margin-left:30px;" >
              <div><h4>Idade: </h4><asp:Label ID="lblIdade" runat="server"></asp:Label></div>
              <div><h4>Sexo: </h4><asp:Label ID="lblSexo" runat="server"></asp:Label></div>
              <div><h4>Email: </h4><asp:Label ID="lblEmail" runat="server"></asp:Label></div>
           </div>
               
           <div class="col-md-6" style="margin-left:30px; margin-top:10px;">                        
               <div><h4>Cidade: </h4><asp:Label ID="lblCidade" runat="server"></asp:Label></div>
           </div>

        </div>



        <div class="row mar-bot40" style="margin-top:70px;">
           <div class="col-md-1">
              <h4>Diploma: </h4>      
           </div>
        </div>

        <div  class="row mar-bot40">
           <div class="col-md-6">       
              <asp:Image ID="Diploma" style="margin-top:-30px;" runat="server" class="img-responsive" width="500px" height="300px"/>
           </div>
                 
            <div class="col-md-12"  style="margin-left:580px; margin-top:-300px;">       
              <asp:Image ID="DiplomaFrente" runat="server"  class="img-responsive" width="500px" height="300px"/>
           </div>
        </div>

         
           <br />
        <br />
        <asp:SqlDataSource ID="sqlProf" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>"  ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_prof, nome_prof, email_prof, sexo_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, imagem_prof, diplomafrente_prof, diplomatras_prof FROM professor WHERE (id_prof = @ProfPesq)">
                  <SelectParameters>
                <asp:SessionParameter Name="ProfPesq" SessionField="ProfPesq" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="row mar-bot40" style="margin-top:-30px;">
            <div class="col-md-2"> 
                <asp:Button ID="BtnVoltar" runat="server" Text="VOLTAR" class="botoes" OnClick="btnVoltar_Click" />
	        </div>
        </div>
           
     </div>

           <asp:SqlDataSource ID="sqlProfEscolhido" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT nome_prof, email_prof, sexo_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, dataNasc_prof, cpf_prof, pass_prof FROM professor WHERE (nome_prof = @ProfPesq)">
               <SelectParameters>
                   <asp:Parameter Name="ProfPesq" />
               </SelectParameters>
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
		  <li class="active"><a href="MinhaContaALUNO.aspx">Minha Conta</a></li>
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

