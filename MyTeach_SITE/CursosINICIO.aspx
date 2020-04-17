<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CursosINICIO.aspx.cs" Inherits="CursosINICIO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Cursos</title>
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

    <script src="js/uikit.js"></script>
    <script src="js/components/notify.js"></script>

    <style>
        section{margin-top:100px;}

        .botoes {
            background-color: #00C9BC;
            color: #FFFFFF;
            text-align: center;
            width:230px; /*nessa pgn os botoes sao um pouco mais largos.*/
            height:70px;
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
        <li><a href="HomeINICIO.aspx">Home</a></li>
          <li class="active"><a href="CursosInicio.aspx">Cursos</a></li>
          <li><a href="MoedaINICIO.aspx">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx">Quem somos</a></li>
		  <li><a href="ContatoINICIO.aspx">Contato</a></li>
		  <li><a href="LoginINICIO.aspx"><i class="fas fa-user-circle"></i> Login</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>

  <!-- Conteudo -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Escolha e veja alguns cursos</h2>
          </div>
        </div>
      </div>



      <div class="row mar-bot40" style="margin-left:70px;">
        <div class="col-md-offset-1 col-md-3">
            <asp:Button ID="btnMaisBarato" runat="server" Text="Mais baratos" class="botoes" OnClick="btnMaisBarato_Click"  />
        </div>

        <div class="col-md-3">
            <asp:Button ID="btnMaisRecentes" runat="server" Text="Adicionados Recentemente" class="botoes" OnClick="btnMaisRecentes_Click"  />
        </div>

        <div class="col-md-3">
            <asp:Button ID="btnMaisPopulares" runat="server" Text="Mais Populares" class="botoes" OnClick="btnMaisPopulares_Click"  />
        </div>
      </div>


<asp:Panel ID="pnlAnuncio" runat="server">            
       
      <div class="row mar-bot40">
          <div class="col-md-offset-2 col-md-9">
              <object data="img/Anuncios/AnuncioNanda3.swf" class="img-responsive" style="margin-top:50px; margin-left:-20px; height:180px; width:770px;" id="ANUNCIO2">
		          <param name="movie" value="ANUNCIO2.swf" />
				  <param name="quality" value="high" />
				  <param name="bgcolor" value="#f7f7f7" />
				  <param name="play" value="true" />
				  <param name="loop" value="true" />
				  <param name="wmode" value="window" />
				  <param name="scale" value="showall" />
				  <param name="menu" value="true" />
				  <param name="devicefont" value="false" />
				  <param name="salign" value="center" />
				  <param name="allowScriptAccess" value="sameDomain" />
	          </object>
          </div>
      </div>
 </asp:Panel>

      <%--///DATALIST DOS ULTIMOS ADICIONADOS--%>
        <div class="row mar-bot40">
            <div class="col-md-offset-1 col-md-10">
                
                <asp:DataList ID="lstCursoUltimos" runat="server" DataKeyField="id_curso" RepeatColumns="3" RepeatDirection="Horizontal">
                   <FooterTemplate>
                       <asp:LinkButton ID="btnVoltar" runat="server" Font-Size="Large" ForeColor="#661A66" OnClick="btnVoltar_Click">&lt;&lt;&lt;&lt;</asp:LinkButton>
                       &nbsp;&nbsp;&nbsp;
                       <asp:LinkButton ID="btnSeguinte" runat="server" Font-Size="Large" ForeColor="#661A66" OnClick="btnSeguinte_Click">&gt;&gt;&gt;&gt;</asp:LinkButton>
                   </FooterTemplate>
                   <ItemTemplate>
                       <div class="section-header">
                           &nbsp;<asp:Label ID="nome_cursoLabel" runat="server" Text='<%# Eval("nome_curso") %>' ForeColor="Black" />
                           <br />
                       <asp:Image ID="Image1" runat="server" class="img-responsive" style="width:310px; height:150px;" ImageUrl='<%# Eval("imagem_curso", "{0}") %>' Height="167px" Width="284px" />
                       <div class="text-center">
                           Categoria:&nbsp;<asp:Label ID="nome_catLabel" runat="server" ForeColor="Black" Text='<%# Eval("nome_cat") %>' />
                           <br />
                           Valor:&nbsp;<asp:Label ID="valor_cursoLabel" runat="server" Text='<%# Eval("valor_curso") %>' ForeColor="Black" />
                           PJMs<br />Professor:&nbsp;<asp:Label ID="nome_profLabel" runat="server" Text='<%# Eval("nome_prof") %>' ForeColor="Black" />

                           <div class="row mar-bot40" style="margin-left:5px; margin-top:20px;">
                               <div class="col-md-offset-2 col-md-2" >
                                   <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/img/MaisInfo (1).png" NavigateUrl='<%# Eval("id_curso", "VerMaisCursoINICIO.aspx?id_curso={0}") %>'>HyperLink</asp:HyperLink>
                             </div>
                           </div>
                       </div>
                     
                           
                       </div>
                   </ItemTemplate>
               </asp:DataList>

       <asp:SqlDataSource ID="sqlCursoUltimos" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT curso.nome_curso, curso.valor_curso, curso.imagem_curso, professor.nome_prof, categoria.nome_cat, curso.id_curso, professor.id_prof, curso.status_curso FROM curso INNER JOIN professor ON curso.id_prof = professor.id_prof INNER JOIN categoria ON curso.id_cat = categoria.id_cat WHERE (curso.status_curso = 'on') ORDER BY curso.id_curso DESC">
                   </asp:SqlDataSource>

            </div>
        </div>
               
      <%--  --%>

      <%--/////DATALIST DOS MAIS BARATOS--%>    
        <div class="row mar-bot40">
            <div class="col-md-offset-1 col-md-10">

       <asp:DataList ID="lstCursosBaratos" runat="server" DataKeyField="id_curso" RepeatColumns="3" RepeatDirection="Horizontal" CellSpacing="4" BorderStyle="NotSet" AlternatingItemStyle-BorderStyle="NotSet" GridLines="None">
                   <FooterTemplate>
                       <asp:LinkButton ID="btnVoltarBaratos" runat="server" Font-Size="Large" ForeColor="#661A66" OnClick="btnVoltarBaratos_Click" >&lt;&lt;&lt;&lt;</asp:LinkButton>
                       &nbsp;&nbsp;&nbsp;
                       <asp:LinkButton ID="btnSeguinteBaratos" runat="server" Font-Size="Large" ForeColor="#661A66" OnClick="btnSeguinteBaratos_Click"  >&gt;&gt;&gt;&gt;</asp:LinkButton>
                   </FooterTemplate>
                   <ItemTemplate>
                           &nbsp;<asp:Label ID="nome_cursoLabel" runat="server" Text='<%# Eval("nome_curso") %>' ForeColor="Black" />
                           <br />
                       <asp:Image ID="Image1" runat="server" style="width:310px; height:150px;" ImageUrl='<%# Eval("imagem_curso", "{0}") %>' Height="167px" Width="284px" />
                       <div class="text-center">
                           Categoria:&nbsp;<asp:Label ID="nome_catLabel" runat="server" ForeColor="Black" Text='<%# Eval("nome_cat") %>' />
                           <br />
                           Valor:&nbsp;<asp:Label ID="valor_cursoLabel" runat="server" Text='<%# Eval("valor_curso") %>' ForeColor="Black" />
                           PJMs<br />Professor:&nbsp;<asp:Label ID="nome_profLabel" runat="server" Text='<%# Eval("nome_prof") %>' ForeColor="Black" />
                           
                           <div class="row mar-bot40" style="margin-left:5px; margin-top:20px;">
                               <div class="col-md-offset-2 col-md-2" >
                           <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/img/MaisInfo (1).png" NavigateUrl='<%# Eval("id_curso", "VerMaisCursoINICIO.aspx?id_curso={0}") %>'>HyperLink</asp:HyperLink>
                           </div>
                           </div>
              
                       </div>
                   </ItemTemplate>
               </asp:DataList>
      <asp:SqlDataSource ID="sqlCursosBaratos" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT curso.nome_curso, curso.valor_curso, curso.imagem_curso, professor.nome_prof, categoria.nome_cat, curso.id_curso, professor.id_prof, curso.status_curso FROM curso INNER JOIN professor ON curso.id_prof = professor.id_prof INNER JOIN categoria ON curso.id_cat = categoria.id_cat WHERE (curso.status_curso = 'on') ORDER BY curso.valor_curso">
                   </asp:SqlDataSource>
                </div>
            </div>
      <%--  --%>      
      <%--/////DATALIST DOS MAIS POPULARES--%>    
        <div class="row mar-bot40">
            <div class="col-md-offset-2 col-md-10">
       <asp:DataList ID="lstCursosPopulares" runat="server" DataKeyField="id_curso" RepeatColumns="3" RepeatDirection="Horizontal">
                   <FooterTemplate>
                       <asp:LinkButton ID="btnVoltarPopulares" runat="server" Font-Size="Large" ForeColor="#661A66" OnClick="btnVoltarPopulares_Click"  >&lt;&lt;&lt;&lt;</asp:LinkButton>
                       &nbsp;&nbsp;&nbsp;
                       <asp:LinkButton ID="btnSeguintePopulares" runat="server" Font-Size="Large" ForeColor="#661A66" OnClick="btnSeguintePopulares_Click"  >&gt;&gt;&gt;&gt;</asp:LinkButton>
                   </FooterTemplate>
                   <ItemTemplate>
                           &nbsp;<asp:Label ID="nome_cursoLabel" runat="server" Text='<%# Eval("nome_curso") %>' ForeColor="Black" />
                          <br />
                       <asp:Image ID="Image1" runat="server"  style="width:310px; height:150px;" ImageUrl='<%# Eval("imagem_curso", "{0}") %>' Height="167px" Width="284px" />
                       <div class="text-center">
                           Categoria:&nbsp;<asp:Label ID="nome_catLabel" runat="server" ForeColor="Black" Text='<%# Eval("nome_cat") %>' />
                           <br />
                           Valor:&nbsp;<asp:Label ID="valor_cursoLabel" runat="server" Text='<%# Eval("valor_curso") %>' ForeColor="Black" />
                           PJMs<br />Professor:&nbsp;<asp:Label ID="nome_profLabel" runat="server" Text='<%# Eval("nome_prof") %>' ForeColor="Black" />
                           
                           <div class="row mar-bot40" style="margin-left:5px; margin-top:20px;">
                               <div class="col-md-offset-2 col-md-2" >
                           <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/img/MaisInfo (1).png" NavigateUrl='<%# Eval("id_curso", "VerMaisCursoINICIO.aspx?id_curso={0}") %>'>HyperLink</asp:HyperLink>
                           </div>
                           </div>

                       </div>
                   </ItemTemplate>
               </asp:DataList>
     
            <asp:SqlDataSource ID="sqlCursosPopulares" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT SUM(compra.id_curso) AS Expr1, compra.id_compra, compra.id_curso, categoria.nome_cat, professor.nome_prof, curso.nome_curso, curso.valor_curso, curso.imagem_curso, professor.id_prof, curso.status_curso FROM compra INNER JOIN curso ON compra.id_curso = curso.id_curso INNER JOIN professor ON curso.id_prof = professor.id_prof INNER JOIN categoria ON curso.id_cat = categoria.id_cat WHERE (curso.status_curso = 'on') GROUP BY compra.id_compra ORDER BY compra.id_curso DESC">

                   </asp:SqlDataSource>
                </div>
            </div>

      <%--  --%>
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
		  <li><a href="LoginINICIO.aspx"> Login</a></li>
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

