<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompraALUNO.aspx.cs" Inherits="CompraALUNO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Comprar</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style1VerMaisInfo.css">
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
        
<!--Conteudo-->
          <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Compras</h2>           
          </div>
        </div>
      </div>
            


      <div class=" row mar-bot40">
        <div class="col-md-5">
              <asp:Image ID="Image" runat="server" class="img-responsive" width="380px" height="240px"/>
        </div>

        <div class="col-md-4" style="margin-top:35px;">                                  
            <div><h4>Professor: <asp:Label ID="lblProf" runat="server"></asp:Label></h4></div>            
            
            <div><h4>Tamanho Curso: <asp:Label ID="lblTamanho" runat="server"></asp:Label></h4></div>

            <div><h4>Preço R$: <asp:Label ID="lblPreco" runat="server"></asp:Label></h4></div>                         
            
            <div><asp:Button ID="btnComprar" runat="server" Text="Confirmar Compra" style=" background-color: #00C9BC; width: 180px; height: 39px; text-align:center;" class="btn btn-theme" OnClick="btnComprar_Click"/></div>
        </div>

        <div class="col-md-3" style="margin-top:25px;">
              <div class="uk-width-2-5 saldoDisponivel">Saldo disponível</div> <div class="uk-width-3-5 saldoDisponivel">R$&nbsp; <asp:Label ID="LblSaldo" runat="server" Text="00,00"></asp:Label></div>
              <div class="uk-width-2-5 valorProd">Valor do produto</div>
              <div class="uk-width-3-5 valorProd">R$&nbsp; <asp:Label ID="lblValor" runat="server" Text="00,00"></asp:Label></div>
          
              <hr class="uk-width-1-1 linhaDivCompra"/> 

              <div class="uk-width-2-5 novoSaldo"> Novo saldo</div> <div class="uk-width-3-5 novoSaldo"> <asp:Label ID="lblNovoSaldo" ForeColor="Blue" runat="server" Text="00,00"></asp:Label></div>
          </div>
      </div>
               <br /> 
              <br />

               <div class="col-md-12">			
              <img class="img-responsive" style="margin-top:-50px; margin-left:-15px;" alt="" src="img/anuncio_3.png"  width="1400" height:"500">
        
               </div>
              </div>

</section>
          
          <br />
    <asp:SqlDataSource ID="sqlCount" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(id_cart) AS qtd FROM carteira WHERE (id_user = @Id_user)">
        <SelectParameters>
            <asp:SessionParameter Name="Id_user" SessionField="Id_user" />
        </SelectParameters>
          </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCurso" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT curso.id_curso, curso.valor_curso, curso.imagem_curso, professor.nome_prof, curso.tam_curso, curso.id_prof FROM curso INNER JOIN professor ON curso.id_prof = professor.id_prof"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCarteira" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_user, valor_cart, qnt_cart FROM carteira WHERE (id_user = @Id_user)" UpdateCommand="UPDATE carteira SET valor_cart = @NovoSaldo, qnt_cart = @QntCompra WHERE (id_user = @Id_user)">
        <SelectParameters>
            <asp:SessionParameter Name="Id_user" SessionField="Id_user" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="Id_user" SessionField="Id_user" />
            <asp:Parameter Name="NovoSaldo" />
            <asp:Parameter Name="QntCompra" />
        </UpdateParameters>
          </asp:SqlDataSource>

          <asp:SqlDataSource ID="sqlProfessor" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_prof, nome_prof, email_prof, dataNasc_prof, cpf_prof, sexo_prof, cep_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, pass_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, id_pagtprof, status_prof FROM professor WHERE (id_prof = @idProfessor)">
              <SelectParameters>
                  <asp:SessionParameter Name="idProfessor" SessionField="idProfessor" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="sqlPagamento" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_pagtprof, tipo_pagtprof, banco_pagtprof, agencia_pagtprof, conta_pagtprof, pagt_pagtprof, data_pagtprof FROM pagamento_prof WHERE (id_pagtprof = @idPagamento)" UpdateCommand="UPDATE pagamento_prof SET pagt_pagtprof = @Pagamento WHERE (id_pagtprof = @idPagamento)">
              <SelectParameters>
                  <asp:SessionParameter Name="idPagamento" SessionField="idPagamento" />
              </SelectParameters>
              <UpdateParameters>
                  <asp:SessionParameter Name="idPagamento" SessionField="idPagamento" />
                  <asp:Parameter Name="Pagamento" />
              </UpdateParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="sqlCompra" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" InsertCommand="INSERT INTO compra(id_user, id_curso, data_compra, valor_compra) VALUES (@Id_user, @id_curso, @DataHora, @ValorCurso)" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM compra">
              <InsertParameters>
                  <asp:SessionParameter Name="Id_user" SessionField="Id_user" />
                  <asp:Parameter Name="ValorCurso" />
                  <asp:Parameter Name="DataHora" />
                  <asp:SessionParameter Name="id_curso" SessionField="id_curso" />
              </InsertParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="sqlAuditoria" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" InsertCommand="INSERT INTO auditoriau(desc_audU, acao_audU, id_user, datahora_audU) VALUES ( @DESC , @ACAO, @Id_user, @DATAHORA)" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriau">
              <InsertParameters>
                  <asp:Parameter Name="DATAHORA" />
                  <asp:Parameter Name="ACAO" />
                  <asp:Parameter Name="DESC" />
                  <asp:SessionParameter Name="Id_user" SessionField="Id_user" />
              </InsertParameters>
          </asp:SqlDataSource>

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


