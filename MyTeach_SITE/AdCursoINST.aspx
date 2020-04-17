<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdCursoINST.aspx.cs" Inherits="AdCursoINST" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Adicionar Cursos</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style3AdCursos.css">
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
          <a href="MeusCursosINST.aspx"><img data-0="width:180px;" data-300=" width:120px;" src="img/marca_myteach.png" alt=""></a>
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" data-0="margin-top:20px;" data-300="margin-top:5px;">
          <li><a href="MeusCursosINST.aspx">Meus Cursos</a></li>
          <li ><a href="MeusPagamentosINST.aspx">Meus Pagamentos</a></li>
		  <li class="active"><a href="AdCursoINST.aspx">Adicionar Cursos</a></li>
		  <li><a href="MinhaContaINST.aspx"><i class="fas fa-chalkboard-teacher"></i> Minha Conta</a></li>
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
            <h2 class="section-heading animated" data-animation="bounceInUp">Adicionar cursos</h2>
          </div>
        </div>
      </div>

      <div class="row mar-bot40">
          <div class="col-md-4">
            Olá, <asp:Label ID="lblNome" runat="server" ></asp:Label>
              <br/>
            Para cadastrar seu novo curso é necessário:
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
            <i class="fas fa-circle"></i> Descrição (É possível personalizar, deve ser escrito quais assuntos seu curso irá tratar);
                  <br/>
           <i class="fas fa-circle"></i> Conteúdo (O que contém no curso).
           </div>
              <br/>
            Caso continue com alguma dúvida entre em contato pelo nosso email “2p1f1j@gmail.com”.
          </div>
      </div>

      <div class="row mar-bot40">
        <div class="col-md-6">
            
            <asp:TextBox ID="txtNomeVideo" runat="server" width="543" height="30" style="border:1px solid #c6c6c6;"    placeholder="Título do curso"  Title="Título do curso"   ></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNome" runat="server" ErrorMessage="Digite o nome do vídeo!" ControlToValidate="txtNomeVideo" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:Label ID="lblNomeCheck" runat="server" ForeColor="Red"></asp:Label>
        </div>

        <div class="col-md-offset-1 col-md-5">
           <h5 style="float:left;">Imagem (thumbnail):</h5><asp:FileUpload ID="FlImagem" runat="server" width="250" height="24" style="border:1px solid #c6c6c6;" BackColor="White" BorderColor="White" ForeColor="Black"/>
           <asp:Label ID="lblImagemCheck" runat="server" ForeColor="Red"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ID="rfvImagem" runat="server" ErrorMessage="Anexe a imagem do curso" ControlToValidate="FlImagem" ForeColor="#CC0000"></asp:RequiredFieldValidator>
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

          <div class="col-md-offset-1 col-md-5">
             <h5 style="float:left;">Arquivo (material):</h5>
              <asp:FileUpload ID="FlArquivo" runat="server" width="250" height="24" accept=".zip" multiple="false" style="border:1px solid #c6c6c6; position:relative; left:18px;" BackColor="White" BorderColor="White" ForeColor="Black"  />
             <asp:Label ID="lblArquivoCheck" runat="server" ForeColor="Red"></asp:Label>
          &nbsp;<asp:RequiredFieldValidator ID="rfvArquivo" runat="server" ErrorMessage="Anexe o arquivo .zip do curso" ForeColor="#CC0000" ControlToValidate="FlArquivo" ></asp:RequiredFieldValidator>
          </div>
      </div>
         


        <div class="row mar-bot40">
          <div class="col-md-3">
              Escolha uma categoria:
          </div>

          <div class="col-md-offset-1 col-md-3">
              O que está  contido no curso: 
          </div>
        </div>



        <div class="row mar-bot40" style="margin-top:-20px;">
          <div class="col-md-3">
             <asp:ListBox ID="ListBoxCategoria" runat="server" style="width:290px; height:130px;" OnSelectedIndexChanged="ListBoxCategoria_SelectedIndexChanged">
                   
               </asp:ListBox>
                      &nbsp;<asp:RequiredFieldValidator ID="rfvCategoria" runat="server" ControlToValidate="ListBoxCategoria" ErrorMessage="Escolha uma categoria" ForeColor="Red"></asp:RequiredFieldValidator>
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
            
           <asp:SqlDataSource ID="sqlListaCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_cat, nome_cat, status_cat FROM categoria WHERE (status_cat = 'on')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlCategoriaEscolhida" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_cat, nome_cat, status_cat FROM categoria WHERE (id_cat = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBoxCategoria" Name="ID" PropertyName="SelectedValue" />
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
                <textarea id="mytextarea" name="mytextarea" runat="server" style="width:1100px; height:300px;"></textarea>
                
                </div>
        </div>



        <div class="row mar-bot40">
            <div class="col-md-offset-5">
                <asp:Button class="botoes" runat="server" Text="Cadastrar" style="margin-left:10px;" OnClick="btnCadastrar_Click" />
            </div>
        </div>

    </div>
              

    <asp:SqlDataSource ID="sqlCurso" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT nome_curso, valor_curso, desc_curso, tam_curso, imagem_curso, contem_curso, arquivo_curso, status_curso, id_curso, id_cat, id_prof FROM curso" InsertCommand="INSERT INTO curso(id_cat, id_prof, valor_curso, desc_curso, tam_curso, imagem_curso, contem_curso, arquivo_curso, nome_curso, status_curso) VALUES (@Categoria, @Prof, @Valor, @Desc , @Tamanho, @Imagem, @Contem, @Arquivo, @Nome, 'on')">
        <InsertParameters>
            <asp:ControlParameter ControlID="ListBoxCategoria" Name="Categoria" PropertyName="SelectedValue" />
            <asp:SessionParameter Name="Prof" SessionField="Id_prof" />
            <asp:Parameter Name="Valor" />
             <asp:Parameter Name="Nome" />
            <asp:Parameter Name="Desc" />
            <asp:Parameter Name="Tamanho" />
            <asp:Parameter Name="Imagem" />
            <asp:Parameter Name="Contem" />
            <asp:Parameter Name="Arquivo" />
        </InsertParameters>
    </asp:SqlDataSource>

            <br />

            <asp:SqlDataSource ID="sqlNomeCheck" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_curso, id_cat, id_prof, nome_curso, valor_curso, desc_curso, tam_curso, imagem_curso, contem_curso, arquivo_curso FROM curso WHERE (nome_curso = @Nome)">
                <SelectParameters>
                    <asp:Parameter Name="Nome" />
                </SelectParameters>
    </asp:SqlDataSource>
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



    </section>


        <br />



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
            <li></li>
            <li></li>
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