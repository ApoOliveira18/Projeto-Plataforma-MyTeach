<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AuditoriaADM.aspx.cs" Inherits="AuditoriaADM" %>


<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Auditoria</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style4Auditoria.css">
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

        section{margin-top:100px}

        .botoes {
            background-color: #00C9BC;
            color: #FFFFFF;
            text-align: center;
            width:206px;
            height:80px;
            text-shadow: none;
            font-size: 16px;
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
        .col-md-offset-2 {
            top: -3px;
            left: 0px;
        }
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

 <!-- CONTEUDO -->
 <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp"> Auditoria </h2>
          </div>
        </div>
      </div>



      <div class="row mar-bot40" style="margin-left:100px;">
        <div class="col-md-3" style="margin-top:20px;">
           <asp:Button ID="btnAdm" runat="server" Text="Administradores" class="botoes" OnClick="btnAdm_Click"/>
        </div>

        <div class="col-md-offset-1 col-md-3" style="margin-top:20px;">
          <asp:Button ID="btnAluno" runat="server" Text="Aluno" class="botoes" OnClick="btnAluno_Click"/>
        </div>

        <div class="col-md-offset-1 col-md-3" style="margin-top:20px;">
          <asp:Button ID="btnProf" runat="server" Text="Instrutores" class="botoes" OnClick="btnProf_Click"/>
        </div>      
      </div>
         
     </div>
 </section>

<!--/Panel do Adm-->
      <asp:Panel ID="pnlAdm" runat="server" style="margin-top:-70px;">
      <section class="section appear clearfix">
    <div class="container">
        <div class="row mar-bot40">
        <div class="col-md-10 col-md-offset-2">
          <div class="cform">

                <div class="col-md-3">
                    <div style="margin-top:10px; margin-left:10px;">Pesquise um Administrador:</div>
                </div>

                <div class="col-md-4">
                    <asp:TextBox ID="txtAdm" style="margin-top:10px;" runat="server" Width="265px"></asp:TextBox>
                </div>

                <div class="col-md-1">
                    <asp:Button ID="btnPesqAdm" runat="server" Text="Pesquisar" class="botoes" BackColor="#00C9BC"  style="width: 107px; height:35px; font-size: 14px; margin-top:10px; margin-left:10px;" OnClick="btnPesqAdm_Click"/>
                </div>   

          </div>
            </div>
            </div>  
     
        <div class="row mar-bot40">
            <div class="col-md-offset-2 col-md-10">
              <asp:GridView ID="gvAdm" runat="server" AutoGenerateColumns="False" Width="720">
                   <Columns>
                      <asp:BoundField DataField="nome_adm" HeaderText="Nome Administrador" SortExpression="nome_adm" />
                      <asp:BoundField DataField="acao_audA" HeaderText="Ação" SortExpression="acao_audA" />
                      <asp:BoundField DataField="desc_audA" HeaderText="Descrição" SortExpression="desc_audA" />
                      <asp:BoundField DataField="datahora_audA" HeaderText="Data Hora" SortExpression="datahora_audA" />
                  </Columns>
                       <HeaderStyle BackColor="#661A66" Font-Names="Trebuchet MS" Font-Overline="False" Font-Strikeout="False" ForeColor="White" />
                    <RowStyle BackColor="#9AF396" Font-Names="Trebuchet MS" ForeColor="Black" />
              </asp:GridView>
                 </div>
            </div>
            
        <asp:SqlDataSource ID="sqlAuditoriaAdm" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT auditoriaa.datahora_audA, auditoriaa.acao_audA, auditoriaa.desc_audA, adm.nome_adm FROM auditoriaa INNER JOIN adm ON auditoriaa.id_adm = adm.id_adm"></asp:SqlDataSource>

        </div>
     </section>
     </asp:Panel>

<!--/Panel do Aluno-->
      <asp:Panel ID="pnlAluno" runat="server" style="margin-top:-70px;">
      <section class="section appear clearfix">
    <div class="container">
        <div class="row mar-bot40">
        <div class="col-md-10 col-md-offset-2">
          <div class="cform">

                <div class="col-md-3">
                    <div style="margin-top:10px; margin-left:10px;">Pesquise um Aluno:</div>
                </div>

                <div class="col-md-4">
                    <asp:TextBox ID="txtAluno" style="margin-top:10px;" runat="server" Width="265px"></asp:TextBox>
                </div>

                <div class="col-md-1">
                    <asp:Button ID="btnPesqAluno" runat="server" Text="Pesquisar" class="botoes" BackColor="#00C9BC"  style="width: 107px; height:35px; font-size: 14px; margin-top:10px; margin-left:10px;" OnClick="btnPesqAluno_Click"/>
                </div>   

          </div>   
            </div>
            </div>  
     
        <div class="row mar-bot40">
            <div class="col-md-offset-2 col-md-10">
              <asp:GridView ID="gvAluno" runat="server" AutoGenerateColumns="False" Width="720">
                   <Columns>
                      <asp:BoundField DataField="nome_user" HeaderText="Nome Aluno" SortExpression="nome_user" />
                      <asp:BoundField DataField="acao_audU" HeaderText="Ação" SortExpression="acao_audU" />
                      <asp:BoundField DataField="desc_audU" HeaderText="Descrição" SortExpression="desc_audU" />
                      <asp:BoundField DataField="datahora_audU" HeaderText="Data Hora" SortExpression="datahora_audU" />
                  </Columns>
                       <HeaderStyle BackColor="#661A66" Font-Names="Trebuchet MS" Font-Overline="False" Font-Strikeout="False" ForeColor="White" />
                    <RowStyle BackColor="#9AF396" Font-Names="Trebuchet MS" ForeColor="Black" />
              </asp:GridView>
                 </div>
            </div>
            
        <asp:SqlDataSource ID="sqlAuditoriaAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT auditoriau.datahora_audU, auditoriau.acao_audU, auditoriau.desc_audU, aluno.nome_user FROM auditoriau INNER JOIN aluno ON auditoriau.id_user = aluno.id_user"></asp:SqlDataSource>

        </div>
     </section>
     </asp:Panel>

<!--Panel do Prof-->
      <asp:Panel ID="pnlProf" runat="server" style="margin-top:-70px;">
      <section class="section appear clearfix">
    <div class="container">
        <div class="row mar-bot40">
        <div class="col-md-10 col-md-offset-2">
          <div class="cform">

                <div class="col-md-3">
                    <div style="margin-top:10px; margin-left:10px;">Pesquise um Professor:</div>
                </div>

                <div class="col-md-4">
                    <asp:TextBox ID="txtProf" style="margin-top:10px;" runat="server" Width="265px"></asp:TextBox>
                </div>

                <div class="col-md-1">
                    <asp:Button ID="btnPesqProf" runat="server" Text="Pesquisar" class="botoes" BackColor="#00C9BC"  style="width: 107px; height:35px; font-size: 14px; margin-top:10px; margin-left:10px;" OnClick="btnPesqProf_Click"/>
                </div>   

          </div>
            </div>
            </div>   
     
        <div class="row mar-bot40">
            <div class="col-md-offset-2 col-md-10">
              <asp:GridView ID="gvProf" runat="server" AutoGenerateColumns="False" Width="720">
                  <Columns>
                      <asp:BoundField DataField="nome_prof" HeaderText="Nome Professor" SortExpression="nome_prof" />
                      <asp:BoundField DataField="acao_audP" HeaderText="Ação" SortExpression="acao_audP" />
                      <asp:BoundField DataField="desc_audP" HeaderText="Descrição" SortExpression="desc_audP" />
                      <asp:BoundField DataField="datahora_audP" HeaderText="Data Hora" SortExpression="datahora_audP" />
                  </Columns>
                       <HeaderStyle BackColor="#661A66" Font-Names="Trebuchet MS" Font-Overline="False" Font-Strikeout="False" ForeColor="White" />
                    <RowStyle BackColor="#9AF396" Font-Names="Trebuchet MS" ForeColor="Black" />
              </asp:GridView>
                 </div>
            </div>
           
        <asp:SqlDataSource ID="sqlAuditoriaProf" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT auditoriap.datahora_audP, auditoriap.acao_audP, auditoriap.desc_audP, professor.nome_prof FROM auditoriap INNER JOIN professor ON auditoriap.id_prof = professor.id_prof" ></asp:SqlDataSource>

        </div>
     </section>
     </asp:Panel>

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






