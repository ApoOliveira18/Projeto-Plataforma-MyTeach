<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MeusCursosINST.aspx.cs" Inherits="MeusCursosINST" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Meus Cursos</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style3MeusCursos.css">
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
        section{margin-top:100px;}
    </style>

</head>

<body>

    <form runat="server" >

<!-- cabecalho -->
  <section id="header" class="appear"></section>
  <div class="navbar navbar-fixed-top" role="navigation" data-0="line-height:100px; height:100px; background-color:rgba(102, 26, 102,1);" data-300="line-height:60px; height:60px; background-color:rgba(102, 26, 102,1);">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      	  <span class="fa fa-bars color-white"></span>
        </button>
        <div class="navbar-logo">
          <a href="MeusCursosINST.aspx"><img data-0="width:180px;" data-300=" width:120px;" src="img/marca_myteach.png" alt=""></a>
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" data-0="margin-top:20px;" data-300="margin-top:5px;">
           <li class="active"><a href="MeusCursosINST.aspx">Meus Cursos</a></li>
          <li><a href="MeusPagamentosINST.aspx">Meus Pagamentos</a></li>
		  <li><a href="AdCursoINST.aspx">Adicionar Cursos</a></li>
		  <li><a href="MinhaContaINST.aspx"><i class="fas fa-chalkboard-teacher"></i> Minha Conta</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>

  <!-- conteudo -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header"> <h2 class="section-heading animated" data-animation="bounceInUp">Meus Cursos</h2>
              <p>Veja, altere ou exclua os conteúdos você disponibilizou no MyTeach</p>
          </div>
        </div>
      </div>
      


      <div class="row mar-bot40">
         <div class="col-md-offset-1 col-md-10">
             <asp:Panel ID="pnlDataList" runat ="server">
              <asp:DataList ID="lstCurso" runat="server" DataKeyField="id_curso" RepeatColumns="3" RepeatDirection="Horizontal">
                   <FooterTemplate>
                       <asp:LinkButton ID="btnVoltar" runat="server" Font-Size="Large" ForeColor="#661A66" OnClick="btnVoltar_Click">&lt;&lt;&lt;&lt;</asp:LinkButton>
                       &nbsp;&nbsp;&nbsp;
                       <asp:LinkButton ID="btnSeguinte" runat="server" Font-Size="Large" ForeColor="#661A66" OnClick="btnSeguinte_Click">&gt;&gt;&gt;&gt;</asp:LinkButton>
                   </FooterTemplate>
                   <ItemTemplate>
                       <div class="text-center">
                           &nbsp;<asp:Label ID="nome_cursoLabel" runat="server" Text='<%# Eval("nome_curso") %>' ForeColor="Black" />
                           <br />
                       </div>
                       <asp:Image ID="Image1" runat="server" class="img-responsive" style="width:310px; height:150px;" ImageUrl='<%# Eval("imagem_curso", "{0}") %>' Height="167px" Width="227px" />
                       <div class="text-center">
                           Valor:&nbsp;<asp:Label ID="valor_cursoLabel" runat="server" Text='<%# Eval("valor_curso") %>' ForeColor="Black" />
                           PJMs<br />Professor:&nbsp;<asp:Label ID="nome_profLabel" runat="server" Text='<%# Eval("nome_prof") %>' ForeColor="Black" />
                           
                           <div class="row mar-bot40" style="margin-left:5px; margin-top:20px;">
                               <div class="col-md-offset-2 col-md-2" >
                           <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/img/MaisInfo (1).png" NavigateUrl='<%# Eval("id_curso", "VerMaisCursoINST.aspx?id_curso={0}") %>'>HyperLink</asp:HyperLink>
                           </div>
                       </div>
                         
                       </div>
                   </ItemTemplate>
               </asp:DataList>
                 </asp:Panel>
          </div>
      </div>



        <div class="row mar-bot40">
          <div class="col-md-offset-2 col-md-9">
              <asp:Panel ID="PnlImagem" runat="server">
                 <img src="img/MeusCursos.png" class="img-responsive" style="margin-top:50px; margin-left:-20px; height:210px; width:770px;" />
              </asp:Panel>
          </div>
        </div>

                   <asp:SqlDataSource ID="sqlCurso" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT curso.nome_curso, curso.valor_curso, curso.imagem_curso, professor.nome_prof, categoria.nome_cat, curso.id_curso, curso.status_curso, curso.id_prof FROM curso INNER JOIN professor ON curso.id_prof = professor.id_prof INNER JOIN categoria ON curso.id_cat = categoria.id_cat WHERE (curso.status_curso = 'on') AND (curso.id_prof = @Id_prof)">
                       <SelectParameters>
                           <asp:SessionParameter Name="Id_prof" SessionField="Id_prof" />
                       </SelectParameters>
                   </asp:SqlDataSource>
               
        <br />
        <asp:SqlDataSource ID="sqlCount" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(id_curso) AS qtd, id_prof FROM curso WHERE (id_prof = @Id_prof)">
            <SelectParameters>
                <asp:SessionParameter Name="Id_prof" SessionField="Id_prof" />
            </SelectParameters>
        </asp:SqlDataSource>
               
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
  <li class="active"><a href="MeusCursosINST.aspx">Meus Cursos</a></li>
          <li><a href="MeusPagamentosINST.aspx">Meus Pagamentos</a></li>
		  <li><a href="AdCursoINST.aspx">Adicionar Cursos</a></li>
		  <li><a href="MinhaContaINST.aspx"> Minha Conta</a></li>
<asp:LinkButton ID="lnHelp" runat="server" OnClick="lnHelp_Click">Help</asp:LinkButton>
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
