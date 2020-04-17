<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MinhasComprasALUNO.aspx.cs" Inherits="MinhasComprasALUNO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Minhas Compras</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style2MinhasCompras.css">
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

      <form runat = "server">

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
		  <li  class="active"><a href="MinhasComprasALUNO.aspx">Minhas Compras</a></li>
		  <li><a href="MinhaContaALUNO.aspx"> <i class="fas fa-user-graduate"> </i> Minha Conta</a></li>
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
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Compras Efetuadas </h2>
            <p>Bons Estudos !!</p>
          </div>
        </div>
      </div>



      <div class="row mar-bot40">

          <div class="cform" id="contact-form">
            
             <div class="section-header">


       <div class="row mar-bot40" >
           <div class="col-md-offset-1 col-md-10">
                 <asp:Panel ID="pnlGrid" runat="server">
           <asp:GridView ID="gridCompras" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="185px" Width="970px">
                <Columns>
                    <asp:BoundField DataField="nome_curso" HeaderText="Curso" SortExpression="nome_curso" />
                    <asp:BoundField DataField="nome_prof" HeaderText="Professor" SortExpression="nome_prof" />
                    <asp:BoundField DataField="valor_compra" HeaderText="Valor" SortExpression="valor_compra" />
                    <asp:BoundField DataField="data_compra" DataFormatString="{0:d}" HeaderText="Data" SortExpression="data_compra" />
                    <asp:CommandField SelectText="Download" ShowSelectButton="True" ControlStyle-ForeColor="#00c9bc">
                      <ItemStyle ForeColor="Black" />
                       
                      </asp:CommandField>  
                </Columns>
                 <AlternatingRowStyle BackColor="#23D919" />
                  <FooterStyle BackColor="#99FFCC" ForeColor="#660066" />
                  <HeaderStyle BackColor="#00C9BC" Font-Bold="True" Font-Names="Yu Gothic UI" ForeColor="Black" />
                  <PagerStyle BackColor="#993366" ForeColor="#990099" HorizontalAlign="Right" />
                  <RowStyle BackColor="#661A66" Font-Names="Yu Gothic UI" ForeColor="White" />
                  <SelectedRowStyle BackColor="#FF66CC" Font-Bold="True" ForeColor="#000099" />
            </asp:GridView>
                     </asp:Panel>
            <asp:SqlDataSource ID="sqlCompra" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString2 %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString2.ProviderName %>" SelectCommand="SELECT compra.valor_compra, compra.data_compra, curso.nome_curso, professor.nome_prof, compra.id_user, curso.tam_curso, curso.imagem_curso, curso.contem_curso, curso.arquivo_curso, curso.desc_curso, curso.valor_curso FROM compra INNER JOIN curso ON compra.id_curso = curso.id_curso INNER JOIN professor ON curso.id_prof = professor.id_prof WHERE (compra.id_user = @Id_user)">
                <SelectParameters>
                    <asp:SessionParameter Name="Id_user" SessionField="Id_user" />
                </SelectParameters>
            </asp:SqlDataSource>
 
         </div>
           </div>

                 <div class="row mar-bot40">
          <div class="col-md-offset-2 col-md-9">
              <asp:Panel ID="pnlImagem" runat="server">
                 <img src="img/MinhasCompras.png" class="img-responsive" style="margin-top:50px; margin-left:-20px; height:240px; width:770px;" />
              </asp:Panel>
              <br />
              <br />
              <asp:SqlDataSource ID="sqlCompraVerificar" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(id_compra) AS qtd, id_user FROM compra WHERE (id_user = @Id_user)">
                  <SelectParameters>
                      <asp:SessionParameter Name="Id_user" SessionField="Id_user" />
                  </SelectParameters>
              </asp:SqlDataSource>
          </div>
        </div>

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

