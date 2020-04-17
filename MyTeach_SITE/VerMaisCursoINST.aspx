<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerMaisCursoINST.aspx.cs" Inherits="VerMaisCursoINST" %>

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

  <link rel="stylesheet" href="css/style3VerMaisInfo.css">
  <!-- skin -->
  <link rel="stylesheet" href="skin/default.css">
  <!-- =======================================================
    Theme Name: Vlava
    Theme URL: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
      <link rel="shortcut icon" href="img/logo_site_preta (1).ico" type="image/x-icon"/>
     <script src="https://cdn.tiny.cloud/1/rt3964jvrgbn7zicqrrk6sg9fyn3i37vf3j8jybjbh4ziema/tinymce/5/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector: "#mytextarea" 
        });
  </script>
     <script src="js/jquery-2.1.1.min.js"></script>
     <script src="js/jquery.maskedinput.min.js"></script>
     <script type="text/javascript">
         jQuery(function ($) {
             $("#txtPreco").mask("99");
         });
    </script>


    <style>
        section{margin-top:100px;}
        
        .botoes {
            background-color: #00C9BC;
            color: #FFFFFF;
            text-align: center;
            width:130px; /*os botoes nessa pgn sao um pouco menores*/
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
          <a href="MeusCursosINST.aspx"><img data-0="width:180px;" data-300=" width:120px;" src="img/marca_myteach.png" alt=""></a>
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" data-0="margin-top:20px;" data-300="margin-top:5px;">
          <li><a href="MeusCursosINST.aspx">Meus Cursos</a></li>
          <li><a href="MeusPagamentosINST.aspx">Meus Pagamentos</a></li>
		  <li><a href="AdCursoINST.aspx">Adicionar Cursos</a></li>
		  <li><a href="MinhaContaINST.aspx">Minha Conta</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>

<!--titulo, descricao e conteudo-->
<section id="section-contact" class="section appear clearfix">
    <div class="container">
      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Ver Mais Informações do Curso</h2>
          </div>
        </div>
      </div>



        <div class="row mar-bot40">
          <div class="col-md-5">
            Olá, <asp:Label ID="lblNome" runat="server" ></asp:Label>
              <br/>
            Se desejar, altere informações do seu curso:
            <br/>
            <div style="margin-left:20px;">
            <i class="fas fa-circle"></i> Nome (Caso já exista no site você será informado);
                <br/>
            <i class="fas fa-circle"></i> Tamanho do arquivo ;
                  <br/>
            <i class="fas fa-circle"></i> Preço em PJMs (A cada compra o 75% do professor é calculado e adicionado a sua “carteira”);
                  <br/>
            <i class="fas fa-circle"></i> Imagem (Caso já exista no site você será informado);
                  <br/>
            <i class="fas fa-circle"></i> Arquivo em .zip (Caso já exista no site você será informado);
                  <br/>
            <i class="fas fa-circle"></i> Categoria;
                  <br/>
            <i class="fas fa-circle"></i> Descrição;
                  <br/>
           <i class="fas fa-circle"></i> Conteúdo.
           </div>
              <br/>
            Caso continue com alguma dúvida entre em contato pelo nosso email “2p1f1j@gmail.com”.
          </div>
      </div>



      <div class="row mar-bot40">
        <div class="col-md-6">
           Nome: <asp:Label ID="lblNomeVideo" runat="server" ForeColor="Black"></asp:Label>
        </div>

        <div class="col-md-offset-1 col-md-5" style="margin-top:10px;">
           <h5 style="float:left;">Imagem (thumbnail):</h5><asp:FileUpload ID="flImagem"  runat="server" width="250" height="24" style="border:1px solid #c6c6c6;" BackColor="White" BorderColor="White" ForeColor="Black"/>
           <asp:Label ID="lblImagemCheck" runat="server" ForeColor="Red"></asp:Label>
        </div>
      </div>



      <div class="row mar-bot40" style="margin-top:-30px;">
          <div class="col-md-3">
              <asp:TextBox ID="txtTamanho" runat="server"  width="250" height="30" style="border:1px solid #c6c6c6;"  placeholder="Tamanho do curso"  title="Tamanho do curso" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvTamanho" runat="server" ErrorMessage="Digite o tamanho" ControlToValidate="txtTamanho" ForeColor="#CC0000"></asp:RequiredFieldValidator>
          </div>

          <div class="col-md-3">
              <asp:TextBox ID="txtPreco" runat="server" width="250" height="30" style="border:1px solid #c6c6c6;" placeholder="Preço Curso (PJMs)"  title="Preço Curso (PJMs)"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvPreco" runat="server" ErrorMessage="Digite o preço" ControlToValidate="txtPreco" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>

          <div class="col-md-offset-1 col-md-5" style="margin-top:10px;">
             <h5 style="float:left;">Arquivo (material):</h5>
              <asp:FileUpload ID="FlArquivo" runat="server" width="250" height="24" style="border:1px solid #c6c6c6; position:relative; left:18px;" BackColor="White" BorderColor="White" ForeColor="Black"  />
             <asp:Label ID="lblArquivoCheck" runat="server" ForeColor="Red"></asp:Label>
          </div>
      </div>
         


        <div class="row mar-bot40">
          <div class="col-md-3">
              Escolha uma categoria: <asp:Label ID="lblCategoria" runat="server" ForeColor="Black"></asp:Label>
          </div>

          <div class="col-md-offset-1 col-md-3">
              O que está  contido no curso: <asp:Label ID="lblContem" runat="server" ForeColor="Black"></asp:Label>
          </div>
        </div>



        <div class="row mar-bot40" style="margin-top:-20px;">
          <div class="col-md-3">
             <asp:ListBox ID="listBoxCatg" runat="server" title="Categoria" style="width:290px; height:200px;"></asp:ListBox>
                      </div>
          
           <div class="col-md-offset-1 col-md-3">
                <asp:CheckBox ID="chkExercicios" runat="server" /> Exercícios
                <br />
                <asp:CheckBox ID="chkLivros" runat="server" /> Livros
                <br />
                <asp:CheckBox ID="chkExemplos" runat="server" /> Exemplos Externo
                 <br/>
                <asp:CheckBox ID="chkSlides" runat="server" /> Slides                         
            </div>
             <asp:Label ID="lblErroConteudo" runat="server" ForeColor="red"></asp:Label>

            <asp:Image ID="imgProf" runat="server"  class="img-responsive" style="margin-left:15px;" width="200px" height="200px"/>

            <asp:SqlDataSource ID="sqlListaCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_cat, nome_cat, status_cat FROM categoria WHERE (status_cat = 'on')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlCategoriaEscolhida" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_cat, nome_cat FROM categoria WHERE (id_cat = @ID)">
                <SelectParameters>
                    <asp:Parameter Name="ID" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>



        <div class="row mar-bot40">
            <div class="col-md-3">
              Descreva o seu curso:
        </div>
        </div>



        <div class="row mar-bot40" style="margin-top:-20px;">
            <div class="col-md-10">
                  <asp:Label ID="lblMytextarea" runat="server" ForeColor="red"></asp:Label> 
               <textarea id="mytextarea" name="mytextarea" runat="server" title="Descrição" style="width:1100px; height:300px;"></textarea>
          </div>
        </div>



        <div class="row mar-bot40">
            <div class="col-md-2">
                <asp:Button ID="btnVoltar" class="botoes" runat="server" Text="Voltar" OnClick="btnVoltar_Click"  />
            </div>

            <div class="col-md-offset-3 col-md-2">
                <asp:Button ID="btnExcluir" class="botoes" runat="server" Text="Desativar" OnClick="btnExcluir_Click" />
            </div>

            <div class="col-md-offset-3 col-md-2">
                <asp:Button ID="btnSalvar" class="botoes" runat="server" Text="Alterar" OnClick="btnSalvar_Click"  />
            </div>
        </div>

    </div>
              

    <asp:SqlDataSource ID="sqlCurso" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT curso.id_curso, curso.nome_curso, curso.desc_curso, curso.valor_curso, curso.tam_curso, curso.imagem_curso, curso.contem_curso, curso.arquivo_curso, categoria.nome_cat FROM curso INNER JOIN categoria ON curso.id_cat = categoria.id_cat WHERE (curso.id_curso = @id_curso)" DeleteCommand="DELETE FROM curso WHERE (id_curso = @Curso)" UpdateCommand="UPDATE curso SET id_cat = @Categoria, nome_curso = @Nome, valor_curso = @Valor, desc_curso = @Desc , tam_curso = @Tamanho, arquivo_curso = @Arquivo, contem_curso = @Contem, imagem_curso = @Imagem WHERE (id_curso = @Curso)">
      <SelectParameters>          
          <asp:SessionParameter Name="id_curso" SessionField="id_curso" />
      </SelectParameters>
        <DeleteParameters>
            <asp:SessionParameter Name="Curso" SessionField="IdCurso" />
        </DeleteParameters>
       <UpdateParameters>
            <asp:Parameter Name="Categoria" />
            <asp:SessionParameter Name="Curso" SessionField="id_curso" />
            <asp:Parameter Name="Valor" />
             <asp:Parameter Name="Nome" />
            <asp:Parameter Name="Desc" />
            <asp:Parameter Name="Tamanho" />
            <asp:Parameter Name="Imagem" />
            <asp:Parameter Name="Contem" />
            <asp:Parameter Name="Arquivo" />
       </UpdateParameters>
    </asp:SqlDataSource>

            <br />

            <asp:SqlDataSource ID="sqlImagemCheck" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_curso, id_cat, id_prof, nome_curso, valor_curso, desc_curso, tam_curso, imagem_curso, contem_curso, arquivo_curso FROM curso WHERE (imagem_curso = @Imagem)">
                <SelectParameters>
                    <asp:Parameter Name="Imagem" />
                </SelectParameters>
    </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlArquivoCheck" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_curso, id_cat, id_prof, nome_curso, valor_curso, desc_curso, tam_curso, imagem_curso, contem_curso, arquivo_curso FROM curso WHERE (arquivo_curso = @Arquivo)">
                <SelectParameters>
                    <asp:Parameter Name="Arquivo" />
                </SelectParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="sqlAudCur" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriap" InsertCommand="INSERT INTO auditoriap(datahora_audP, id_prof, acao_audP, desc_audP) VALUES (@DATAHORA, @IDPROF, @ACAO, @DESC )">
           <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:SessionParameter Name="IDPROF" SessionField="Id_prof" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                     </InsertParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDesativar" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM curso" UpdateCommand="UPDATE curso SET status_curso = 'off' WHERE (id_curso = @id_curso)">
   <UpdateParameters>        
          <asp:SessionParameter Name="id_curso" SessionField="id_curso" />
     </UpdateParameters>  
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlDesativarAUD" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" InsertCommand="INSERT INTO auditoriap(datahora_audP, id_prof, acao_audP, desc_audP) VALUES (@DATAHORA, @IDPROF, @ACAO, @DESC)" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM auditoriap">
         <InsertParameters>
                         <asp:Parameter Name="DATAHORA" />
                         <asp:Parameter Name="ACAO" />
                         <asp:Parameter Name="DESC" />
                         <asp:SessionParameter Name="IDPROF" SessionField="Id_prof" />
                     </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT MAX(id_cat) AS id FROM categoria WHERE (nome_cat = @Categoria)">
        <SelectParameters>
            <asp:Parameter Name="Categoria" />
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
          <li><a href="MeusCursosINST.aspx">Meus Cursos</a></li>
          <li><a href="MeusPagamentosINST.aspx">Meus Pagamentos</a></li>
		  <li><a href="AdCursoINST.aspx">Adicionar Cursos</a></li>
		  <li><a href="MinhaContaINST.aspx">Minha Conta</a></li>
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