<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FinanceiroADM.aspx.cs" Inherits="FinanceiroADM" %>
<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Financeiro</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style4Financeiro.css">
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
      <!--/.navbar-collapse -->
    </div>
  </div>

  <!-- conteudo -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

    <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">FINANCEIRO</h2>
            <p>Escolha uma data e veja os proximos pagamentos</p>
          </div>
        </div>
      </div>
      


            <div class="row mar-bot40">
                 <div class="col-md-offset-3 col-md-3">
                     Até qual data deseja ver o vencimento:
                 </div>

                <div class="col-md-3">
                    <asp:TextBox ID="txtData" runat="server" style="width:250px;"></asp:TextBox>
                </div>

                <asp:Label ID="lblErro" runat="server" ForeColor="red"></asp:Label>

            </div>

                    


        
      <div class="row mar-bot40">
          <div class="col-md-offset-3 col-md-2">
              <asp:Button ID="btnVoltar" runat="server" Text="Voltar" class="botoes" CausesValidation="False" OnClick="btnVoltar_Click"  />
          </div>

          <div class=" col-md-offset-2 col-md-2">
              <asp:Button ID="btnProsseguir" runat="server" Text="Prosseguir" class="botoes" OnClick="btnProsseguir_Click"  ValidateRequestMode="Inherit" />
          </div>
      </div>



        <div class="row mar-bot40">
            <div class="col-md-offset-2 col-md-10">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="720">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkOP" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nome_prof" HeaderText="Nome" SortExpression="nome_prof" />
                        <asp:BoundField DataField="tipo_pagtprof" HeaderText="Tipo Conta" SortExpression="tipo_pagtprof" />
                        <asp:BoundField DataField="banco_pagtprof" HeaderText="Banco" SortExpression="banco_pagtprof" />
                        <asp:BoundField DataField="agencia_pagtprof" HeaderText="Agencia" SortExpression="agencia_pagtprof" />
                        <asp:BoundField DataField="conta_pagtprof" HeaderText="Conta" SortExpression="conta_pagtprof" />
                        <asp:BoundField DataField="pagt_pagtprof" DataFormatString="{0:c}" HeaderText="Valor" SortExpression="pagt_pagtprof" />
                        <asp:BoundField DataField="data_pagtprof" DataFormatString="{0:d}" HeaderText="Data" SortExpression="data_pagtprof" />
                    </Columns>
                  <AlternatingRowStyle BackColor="#23D919" />
                  <FooterStyle BackColor="#99FFCC" ForeColor="#660066" />
                  <HeaderStyle BackColor="#00C9BC" Font-Bold="True" Font-Names="Yu Gothic UI" ForeColor="Black" />
                  <PagerStyle BackColor="#993366" ForeColor="#990099" HorizontalAlign="Right" />
                  <RowStyle BackColor="#661A66" Font-Names="Yu Gothic UI" ForeColor="White" />
                  <SelectedRowStyle BackColor="#FF66CC" Font-Bold="True" ForeColor="#000099" />
                </asp:GridView>

            </div>

            <div class="col-md-offset-5 col-md-2">
              <asp:Panel ID="pnlPago" runat="server">
            <asp:Button ID="btnPago" class="botoes" runat="server" OnClick="btnPago_Click" Text="Pago" />
              </asp:Panel>
          </div>
        </div>
                
                <asp:SqlDataSource ID="sqlFinanceiro" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT professor.nome_prof, pagamento_prof.tipo_pagtprof, pagamento_prof.banco_pagtprof, pagamento_prof.agencia_pagtprof, pagamento_prof.conta_pagtprof, pagamento_prof.pagt_pagtprof, pagamento_prof.data_pagtprof, pagamento_prof.data_pagtprof AS Expr1, professor.id_prof, professor.status_prof, pagamento_prof.id_pagtprof FROM professor INNER JOIN pagamento_prof ON professor.id_pagtprof = pagamento_prof.id_pagtprof WHERE (professor.status_prof = 'on')"></asp:SqlDataSource>

      <asp:SqlDataSource ID="sqlPagamento" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_pagtprof, tipo_pagtprof, banco_pagtprof, agencia_pagtprof, conta_pagtprof, pagt_pagtprof, data_pagtprof FROM pagamento_prof" UpdateCommand="UPDATE pagamento_prof SET pagt_pagtprof = @Valor WHERE (id_pagtprof = @IdPagto)">
                    <UpdateParameters>
                        <asp:SessionParameter Name="IdPagto" SessionField="IdPagto" />
                        <asp:Parameter Name="Valor" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
      <asp:SqlDataSource ID="sqlPagamentoAuditoria" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriaa" InsertCommand="INSERT INTO auditoriaa(datahora_audA, acao_audA, id_adm, desc_audA) VALUES (@DATAHORA, @ACAO, @IDADM, @DESC )">
          <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:SessionParameter Name="IDADM" SessionField="Id_adm" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                     </InsertParameters>
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