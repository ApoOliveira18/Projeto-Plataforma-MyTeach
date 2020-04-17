<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CursosADM.aspx.cs" Inherits="CursosADM" %>

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

  <link rel="stylesheet" href="css/style4Cursos.css">
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
      <div class="navbar-collapse collapse">
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>

  <!-- CONTEUDO -->
 <section id="section-contact" class="section appear clearfix">
    <div class="container">

         <div class="row mar-bot40">  
           <div class="col-md-12">
             <div class="section-header">
                <h2 class="section-heading animated" data-animation="bounceInUp">Olá, Administrador</h2>
             </div>
           </div>
         </div>

      <div class="row mar-bot40" style="margin-left:100px;">
        <div class="col-md-3" style="margin-top:20px;">
           <asp:Button ID="btnCursos" runat="server" Text="Cursos" class="botoes" style="background-color:#00c9bc;" Height="80px" Width="206px" Font-Size="16px" OnClick="btnCursos_Click" />
        </div>

        <div class="col-md-offset-1 col-md-3" style="margin-top:20px;">
          <asp:Button ID="btnProfessores" runat="server" Text="Professores" class="botoes" style="background-color:#00c9bc;" Height="80px" Width="206px" Font-Size="16px" OnClick="btnProfessores_Click"/>
        </div>

        <div class="col-md-offset-1 col-md-3" style="margin-top:20px;">
          <asp:Button ID="btnCategorias" runat="server" Text="Categorias" class="botoes" style="background-color:#00c9bc;" Height="80px" Width="206px" Font-Size="16px" OnClick="btnCategrorias_Click" />
        </div>      
      </div>
        
    </div>
</section>

    <!--./Panel do Cursos-->
      <asp:Panel ID="pnlCursos" runat="server">
      <section class="section appear clearfix">
    <div class="container">
        <div class="row">
        <div class="col-md-10 col-md-offset-2">
          <div class="cform">

                <div class="col-md-3">
                    <div style="margin-left:10px;">Pesquise um curso (nome):</div>
                </div>

                <div class="col-md-4">
                    <asp:TextBox ID="txtCurso" runat="server" Width="265px"></asp:TextBox>
                </div>

                <div class="col-md-1">
                    <asp:Button ID="btnPesquisarCursos" runat="server" Text="Pesquisar" class="botoes" BackColor="#00C9BC"  style="width: 107px; height:35px; font-size: 14px;" OnClick="btnPesquisarCursos_Click"/>
                </div> 
              </div> 
            </div>      
     


       <div class="row mar-bot40" style="margin-top:100px;">
           <div class="col-md-offset-1 col-md-10">
               <asp:GridView ID="gvCurso" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvCurso_SelectedIndexChanged" Height="185px" Width="970px">
                   <Columns>
                      <asp:BoundField DataField="nome_curso" HeaderText="Nome" SortExpression="nome_curso" />
                      <asp:BoundField DataField="valor_curso" HeaderText="Valor" SortExpression="valor_curso" DataFormatString="{0:c}" />
                      <asp:BoundField DataField="nome_cat" HeaderText="Categoria" SortExpression="nome_cat" />
                      <asp:BoundField DataField="nome_prof" HeaderText="Professor" SortExpression="nome_prof" />
                      <asp:TemplateField HeaderText="Imagem" SortExpression="imagem_curso">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imagem_curso") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Image ID="Image1" runat="server" Height="160px" Width="300px" ImageUrl='<%# Eval("imagem_curso", "{0}") %>' />
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:CommandField SelectText="Ver Mais..." ShowSelectButton="True">
                      <ItemStyle ForeColor="white" />
                       
                      </asp:CommandField>                      
                  </Columns>
                      <AlternatingRowStyle BackColor="#23D919" />
                  <FooterStyle BackColor="#99FFCC" ForeColor="#660066" />
                  <HeaderStyle BackColor="#00C9BC" Font-Bold="True" Font-Names="Yu Gothic UI" ForeColor="Black" />
                  <PagerStyle BackColor="#993366" ForeColor="#990099" HorizontalAlign="Right" />
                  <RowStyle BackColor="#661A66" Font-Names="Yu Gothic UI" ForeColor="White" />
                  <SelectedRowStyle BackColor="#FF66CC" Font-Bold="True" ForeColor="#000099" />
              </asp:GridView>
           </div>
       </div>
              
              <asp:SqlDataSource ID="sqlCurso" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT curso.nome_curso, curso.valor_curso, categoria.nome_cat, professor.nome_prof, curso.imagem_curso, curso.status_curso FROM curso INNER JOIN categoria ON curso.id_cat = categoria.id_cat INNER JOIN professor ON curso.id_prof = professor.id_prof WHERE (curso.status_curso = 'on')"></asp:SqlDataSource>
                 </div>
            
        </div>                
     </section>
     </asp:Panel>
                 
     
  <!--./Panel do Professores-->   
      <asp:Panel ID="pnlProfessores" runat="server">
             <section class="section appear clearfix">
    <div class="container">
        <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="cform">
             
              <div class="col-md-4">
                    <div style="margin-left:10px;">Pesquise um(a) professor(a):</div>
                </div>

                <div class="col-md-5">
                    <asp:TextBox ID="txtProf" runat="server" Width="265px"></asp:TextBox>
                </div>

                <div class="col-md-1">
                    <asp:Button ID="btnProf" runat="server" Text="Pesquisar" class="botoes" BackColor="#00C9BC"  style="font-size: 14px;" Height="35px" Width="107" OnClick="btnProf_Click"/>
                </div>

              </div> 
            </div>   



            <div class="row mar-bot40" style="margin-top:100px;">
           <div class="col-md-offset-1 col-md-10">

              <asp:GridView ID="gvProf" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvProf_SelectedIndexChanged" Height="185px" Width="970px">
                  <Columns>
                      <asp:BoundField DataField="nome_prof" HeaderText="Professor" SortExpression="nome_prof" />
                      <asp:BoundField DataField="email_prof" HeaderText="Email" SortExpression="email_prof" />
                      <asp:BoundField DataField="sexo_prof" HeaderText="Sexo" SortExpression="sexo_prof" />
                      <asp:BoundField DataField="dataNasc_prof" HeaderText="Data nascimento" SortExpression="dataNasc_prof" DataFormatString="{0:d}" />
                      <asp:CommandField SelectText="Ver mais" ShowSelectButton="True">
                      <HeaderStyle ForeColor="Black" />
                      <ItemStyle ForeColor="white" />
                      </asp:CommandField>
                  </Columns>
                   <AlternatingRowStyle BackColor="#23D919" />
                  <FooterStyle BackColor="#99FFCC" ForeColor="#660066" />
                  <HeaderStyle BackColor="#00C9BC" Font-Bold="True" Font-Names="Yu Gothic UI" ForeColor="Black" />
                  <PagerStyle BackColor="#993366" ForeColor="#990099" HorizontalAlign="Right" />
                  <RowStyle BackColor="#661A66" Font-Names="Yu Gothic UI" ForeColor="White" />
                  <SelectedRowStyle BackColor="#FF66CC" Font-Bold="True" ForeColor="#000099" />
              </asp:GridView>
              
               </div>
       </div>

              <asp:SqlDataSource ID="sqlProfessor" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT nome_prof, email_prof, sexo_prof, dataNasc_prof, status_prof FROM professor WHERE (status_prof = 'on')" ></asp:SqlDataSource>

     </div>
        </div>                
     </section>
              </asp:Panel>
                  

     <!--./Panel do Categoria-->
      <asp:Panel ID="pnCategoria" runat="server">
     <section class="section appear clearfix">
    <div class="container">
        <div class="row mar-bot40">
        <div class="col-md-10 col-md-offset-2">
          <div class="cform">
                
             <div class="col-md-3">
                    <div style="margin-left:10px;">Adicione uma categoria:</div>
                </div>

                <div class="col-md-4">
                    <asp:TextBox ID="txtCatg" runat="server" Width="265px"></asp:TextBox>
                </div>

                <div class="col-md-1">
                    <asp:Button ID="btnCatg" runat="server" Text="Cadastrar" class="botoes" BackColor="#00C9BC"  style="width: 107px; height:35px; font-size: 14px;" OnClick="btnCatg_Click"/>
                </div>

              <asp:Label ID="lblCategoriaCheck" runat="server"></asp:Label>

                   </div> 
            </div>      
     


       <div class="row mar-bot40" style="margin-top:100px;">
           <div class="col-md-offset-1 col-md-10">

             <asp:GridView ID="gvCategoria" runat="server" AutoGenerateColumns="False" Height="150px" Width="970px" OnSelectedIndexChanged="gvCategoria_SelectedIndexChanged">
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:CheckBox ID="chkOP" runat="server" />
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="nome_cat" HeaderText="Categoria" SortExpression="nome_cat" />
                 </Columns>
                  <AlternatingRowStyle BackColor="#23D919" />
                  <FooterStyle BackColor="#99FFCC" ForeColor="#660066" />
                  <HeaderStyle BackColor="#00C9BC" Font-Bold="True" Font-Names="Yu Gothic UI" ForeColor="Black" />
                  <PagerStyle BackColor="#993366" ForeColor="#990099" HorizontalAlign="Right" />
                  <RowStyle BackColor="#661A66" Font-Names="Yu Gothic UI" ForeColor="White" />
                  <SelectedRowStyle BackColor="#FF66CC" Font-Bold="True" ForeColor="#000099" />
             </asp:GridView>
                    </div>
           </div>

              <div class="row mar-bot40">
                  <div class="col-md-offset-1 col-md-2">

                      <asp:Button ID="btnExcluirCatg" runat="server" Text="Desativar" class="botoes" style="margin-left:15px;" BackColor="#00C9BC" OnClick="btnExcluirCatg_Click"/>
                      
                  </div>
              </div>

            <asp:SqlDataSource ID="sqlCatg" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" DeleteCommand="DELETE FROM categoria WHERE (nome_cat = @nome)" InsertCommand="INSERT INTO categoria(nome_cat, status_cat) VALUES (@Categoria, 'on')" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT nome_cat, id_cat, status_cat FROM categoria WHERE (status_cat = 'on')" UpdateCommand="UPDATE categoria SET status_cat = 'off' WHERE (nome_cat = @nome)">
                          <DeleteParameters>
                              <asp:Parameter Name="nome" />
                          </DeleteParameters>
                          <InsertParameters>
                              <asp:Parameter Name="Categoria" />
                          </InsertParameters>
                          <UpdateParameters>
                              <asp:Parameter Name="nome" />
                          </UpdateParameters>
                      </asp:SqlDataSource>
                      <asp:SqlDataSource ID="sqlAudInserir" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" InsertCommand="INSERT INTO auditoriaa(datahora_audA, acao_audA, desc_audA, id_adm) VALUES (@DATAHORA, @ACAO, @DESC , @ID)" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriaa">
                          <InsertParameters>
                              <asp:Parameter Name="DATAHORA" />
                              <asp:Parameter Name="ACAO" />
                              <asp:Parameter Name="DESC" />
                              <asp:SessionParameter Name="ID" SessionField="Id_adm" />
                          </InsertParameters>
                      </asp:SqlDataSource>
                      <asp:SqlDataSource ID="sqlCategoriaCheck" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_cat, nome_cat FROM categoria WHERE (nome_cat = @Categoria)">
                          <SelectParameters>
                              <asp:Parameter Name="Categoria" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                      <asp:SqlDataSource ID="sqlAudDesativar" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" InsertCommand="INSERT INTO auditoriaa(datahora_audA, acao_audA, desc_audA, id_adm) VALUES (@DATAHORA, @ACAO, @DESC , @ID)"  SelectCommand="SELECT * FROM auditoriaa">
                     <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                           <asp:SessionParameter Name="ID" SessionField="Id_adm" />
                     </InsertParameters>
                      </asp:SqlDataSource>
      
            </div>

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

