<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroProfINICIO.aspx.cs" Inherits="CadastroProfINICIO" %>

<!DOCTYPE html>
<html>

<head>
  <!-- BASICS -->
  <meta charset="utf-8">
  <title>Cadastro Professor</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen">
  <link rel="stylesheet" href="css/flexslider.css" type="text/css">
  <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700">

  <link rel="stylesheet" href="css/style1CadastroProf.css">
  <!-- skin -->
  <link rel="stylesheet" href="skin/default.css">
  <!-- =======================================================
    Theme Name: Vlava
    Theme URL: https://bootstrapmade.com/vlava-free-bootstrap-one-page-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
    <link rel="shortcut icon" href="img/logo_site_preta (1).ico" type="image/x-icon"/>

    <script src="js/jquery-2.1.1.min.js"></script>
     <script src="js/jquery.maskedinput.min.js"></script>
     <script type="text/javascript">
         jQuery(function ($) {
             $("#txtDataNascProf").mask("99/99/9999");
             $("#txtTelProf").mask("(99) 99999-9999");
             $("#txtCEPProf").mask("99999-999");
             $("#txtCPFProf").mask("999.999.999-99");
             $("#txtAgenciaProf").mask('9999-9');    // Máscara para AGÊNCIA BANCÁRIA
            $("#txtContaProf").mask('99.999-9');    // Máscara para CONTA BANCÁRIA
             $("#txtDataPagamento").mask("99");

         });
    </script>

    <style>

        section {margin-top:100px;}

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

      <form runat ="server"  >

<!-- cabecalho -->
   <section id="header" class="appear">
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
          <li><a href="CursosINICIO.aspx">Cursos</a></li>
          <li><a href="MoedaINICIO.aspx">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx">Quem somos</a></li>
		  <li><a href="ContatoINICIO.aspx">Contato</a></li>
		  <li><a href="LoginINICIO.aspx"><i class="fas fa-user-circle"></i> Login</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse -->
    </div>
  </div>
       </section>



<section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Cadastro de Professores <i class="fas fa-chalkboard-teacher"></i> </h2>
           
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="cform" id="contact-form">

              <div class="field your-name form-group">
                  <asp:TextBox ID="txtNomeProf" runat="server" placeholder="Nome e sobrenome" title="Nome e sobrenome" class="cform-text"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNomeProf" ErrorMessage="Digite o seu nome completo" ForeColor="Red"></asp:RequiredFieldValidator>

              </div>			  
			  
             <div class="field your-name form-group" style="margin-left:-15px; font-size: 16px; color: #000000">
                <div class="col-md-3">
                   Selecione seu sexo:
                </div>
                 <div class="col-md-3">
                   <asp:RadioButtonList ID="brnSexoProf" runat="server" title="Sexo">
                       <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                       <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                       <asp:ListItem Value="Prefiro não dizer">Prefiro não dizer</asp:ListItem>
                   </asp:RadioButtonList> 
                   <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="brnSexoProf" ErrorMessage="Selecione um sexo" ForeColor="Red"></asp:RequiredFieldValidator>
                 </div>
             </div>
           
			  
			  <div class="field your-name form-group">
                  <asp:TextBox ID="txtEmailProf" style="margin-top:30px;" runat="server" title="Email" placeholder="Digite seu email" class="cform-text"></asp:TextBox>
                &nbsp;
                  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmailProf" ErrorMessage="Digite seu email" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="lblEmailCheck" runat="server" ForeColor="Red" title="Checagem do Email"></asp:Label>
              </div>
			  			  			  
			  <div class="field your-name form-group">
                  <asp:TextBox ID="txtCPFProf" runat="server" placeholder="Seu CPF" title="CPF"  class="cform-text"></asp:TextBox>
                &nbsp;
                  <asp:RequiredFieldValidator ID="rfvCPF" runat="server" ControlToValidate="txtCPFProf" ErrorMessage="Digite o seu CPF" ForeColor="Red"></asp:RequiredFieldValidator>
              <br />
                  <asp:Label ID="lblCpfCheck" runat="server" ForeColor="Red" title="Checagem do CPF" ></asp:Label>
              </div>

                       <div class="field your-name form-group">
                  <asp:TextBox ID="txtTelProf" runat="server"  placeholder="Digite seu telefone" title="Telefone"></asp:TextBox>
                &nbsp;
                    <asp:RequiredFieldValidator ID="rfvTelefone" runat="server" ControlToValidate="txtTelProf" ErrorMessage="Digite seu telefone" ForeColor="Red"></asp:RequiredFieldValidator>

              </div>
			  
			  <div class="field your-name form-group">
                  <asp:TextBox ID="txtDataNascProf" runat="server"  placeholder="Digite sua data de nascimento" title="Data de nascimento"></asp:TextBox>
                &nbsp;
                  <asp:RequiredFieldValidator ID="rfvDataNasc" runat="server" ControlToValidate="txtDataNascProf" ErrorMessage="Digite sua data de nascimento" ForeColor="Red"></asp:RequiredFieldValidator>
                   <asp:Label ID="lblData" runat="server" title="Checagem data de nascimento"  ForeColor="Red"></asp:Label>
              </div>
			  
              <div class="field message form-group" style="margin-left:-15px; font-size: 16px; color: #000000">
                 <div class="col-md-9">
                    <asp:TextBox ID="txtCEPProf" runat="server"  class="cform-text"  placeholder="Digite seu CEP" title="CEP"></asp:TextBox>
                 </div>
                 <div class="col-md-1">
                    <asp:LinkButton ID="lhkCEP" runat="server" title="Pesquisa do CEP" ForeColor="#3399FF" Font-Size="Medium" Font-Underline="True" OnClick="LinkButton2_Click" CausesValidation="False">Buscar CEP</asp:LinkButton>
                 </div>
                 <asp:RequiredFieldValidator ID="rfvCEP" runat="server" ErrorMessage="Digite seu CEP" ControlToValidate="txtCEPProf" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>
                
			  <div class="field message form-group">
                  <asp:TextBox ID="txtRuaProf" style="margin-top:30px;" runat="server" placeholder="Digite sua rua" title="Rua" class="cform-text"></asp:TextBox>
                &nbsp;
                  <asp:RequiredFieldValidator ID="rfvRua" runat="server" ControlToValidate="txtRuaProf" ErrorMessage="Digite o nome da sua rua" ForeColor="Red"></asp:RequiredFieldValidator>

              </div>
			  
			  <div class="field your-name form-group">
                  <asp:TextBox ID="txtNumProf" runat="server" placeholder="Digite o número da sua moradia" title="Número" class="cform-text" ></asp:TextBox>
                &nbsp;
                  <asp:RequiredFieldValidator ID="rfvNumero" runat="server" ControlToValidate="txtNumProf" ErrorMessage="Digite o número da sua casa" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>
			  
              <div class="field your-email form-group">
                  <asp:TextBox ID="txtBairroProf" runat="server" placeholder="Digite seu bairro" title="Bairro" class="cform-text"></asp:TextBox>
                &nbsp;
                  <asp:RequiredFieldValidator ID="rfvBairro" runat="server" ControlToValidate="txtBairroProf" ErrorMessage="Digite nome do seu bairro" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>
			  
			   <div class="field your-email form-group">
                   <asp:TextBox ID="txtCidProf" runat="server" placeholder="Digite sua cidade" title="Cidade" class="cform-text"></asp:TextBox>
                &nbsp;
                   <asp:RequiredFieldValidator ID="rfvCidade" runat="server" ControlToValidate="txtCidProf" ErrorMessage="Digite o nome da sua cidade" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>
                   
              <div class="field your-name form-group" style="margin-left:-15px; font-size: 16px; color: #000000">
                <div class="col-md-3">
                  Tpo de Conta:
                </div>
                 <div class="col-md-7">
                   <asp:RadioButtonList ID="rbnConta" runat="server" title="Tipo de conta">
                       <asp:ListItem Value="Corrente">Corrente</asp:ListItem>
                       <asp:ListItem Value="Poupança">Poupança</asp:ListItem>
                   </asp:RadioButtonList> 
                 <asp:RequiredFieldValidator ID="rfvTipoConta" runat="server" ControlToValidate="rbnConta" ErrorMessage="Escolha um tipo da sua conta" ForeColor="Red"></asp:RequiredFieldValidator>
                 </div>
             </div>
                        <div class="field your-name form-group">
                  <asp:TextBox ID="txtBancoProf" runat="server" placeholder="Digite o nome do banco" title="Nome do banco"  ></asp:TextBox>
                &nbsp;
                            <asp:RequiredFieldValidator ID="rfvBanco" runat="server" ControlToValidate="txtBancoProf" ErrorMessage="Digite o nome do seu banco" ForeColor="Red"></asp:RequiredFieldValidator>

              </div>
              <div class="field your-name form-group">
                  <asp:TextBox ID="txtDataPagamento" runat="server" placeholder="Digite sua data de pagamento" title="Data de Pagamento" ></asp:TextBox>
                &nbsp;
                           <asp:RequiredFieldValidator ID="rfvDataPagamento" runat="server" ErrorMessage="Digite uma da de pagamento" ControlToValidate="txtDataPagamento" ForeColor="Red"></asp:RequiredFieldValidator> <%--<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Escolha um data entre o dia 1 á dia 28" MaximumValue="28" MinimumValue="01" ControlToValidate="txtDataPagamento" ForeColor="Red"></asp:RangeValidator>--%>
             <asp:Label ID="lblDataPagamento" runat="server" title="Checagem data de pagamento"  ForeColor="Red"></asp:Label>
                  </div>
                        <div class="field your-name form-group">
                  <asp:TextBox ID="txtAgenciaProf" runat="server" placeholder="Digite a agência do cartão" Title="Agência do cartão"  ></asp:TextBox>
                &nbsp;
                            <asp:RequiredFieldValidator ID="rfvAgencia" runat="server" ControlToValidate="txtAgenciaProf" ErrorMessage="Digite o número da sua agência" ForeColor="Red"></asp:RequiredFieldValidator>

              </div>
                       <div class="field your-name form-group">
                  <asp:TextBox ID="txtContaProf" runat="server" placeholder="Digite a conta do cartão" title="Conta do cartão" ></asp:TextBox>
                &nbsp;
                            <asp:RequiredFieldValidator ID="rfvConta" runat="server" ControlToValidate="txtContaProf" ErrorMessage="Digite número da usa conta" ForeColor="Red"></asp:RequiredFieldValidator>

              </div>

               <p>Sua senha deve ter minino 6 e no maximo 12 caracteres, contendo:
               <p> - Uma letra minuscula;</p> 
                   <p> - Uma letra maiuscula;</p>
               <p> - Um número;</p>
                  <p>   - Um caractere especial.</p>

                       <div class="field your-name form-group" style="margin-top:50px;">
                  <asp:TextBox ID="txtSenhaProf" runat="server" name="senha" placeholder="Digite sua senha" title="Senha" type="password" Height="55px" Width="750px"  ></asp:TextBox>
                                      <asp:LinkButton ID="lnkSenha" runat="server" OnClick="lnkSenha_Click" ForeColor="#9933FF" CausesValidation="False"><i class="fas fa-exclamation-circle"></i> Verificar Senha</asp:LinkButton>
                    <asp:Label ID="lblFraca" runat="server" ForeColor="Red"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:Label ID="lblForte" runat="server" ForeColor="#00CC00"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="txtSenhaProf" ErrorMessage="Digite uma senha que siga os caracteres" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>
                        <div class="field your-name form-group">
                  <asp:TextBox ID="txtConfSenhaProf" runat="server" placeholder="Digite a confirmação Senha" Title="Confirmar Senha" type="password" Height="55px" Width="750px" ></asp:TextBox>
                            <asp:CompareValidator ID="cpSenha" runat="server" ErrorMessage="As senhas são diferentes" ControlToCompare="txtSenhaProf" ControlToValidate="txtConfSenhaProf" ForeColor ="Red"></asp:CompareValidator>
                &nbsp;<div class="validation"></div>
                             <asp:Label ID="lblConfSenha" runat="server" ForeColor="red"></asp:Label>
              </div>


			  <div class="field your-email form-group">
              <table style="width: 100%;">
                  <tr>
                      <td class="field your-email form-group" style="color: #000000; font-family: Arial; font-size: 16px; width: 336px;">Anexe uma foto do seu diploma:</td>
                      
                      <td><asp:FileUpload ID="flDiploma" runat="server" Title ="Foto do Diploma"/> 
                            <asp:RequiredFieldValidator ID="rfvDiploma" runat="server" ControlToValidate="flDiploma" ErrorMessage="Anexe a foto do seu diploma" ForeColor="Red"></asp:RequiredFieldValidator>

                      </td>
                  </tr>
                  <tr> <td class="auto-style3"> &nbsp; &nbsp; &nbsp;</td>
                      <td class="auto-style3"> &nbsp; &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="field your-email form-group" style="font-family: Arial; color: #000000; font-size: 16px; width: 336px;"> Anexe uma foto da parte de trás do diploma:</td>
                    
                      <td><asp:FileUpload ID="flDiplomaTras" runat="server" Title ="Foto verso do Diploma "/>
                            <asp:RequiredFieldValidator ID="rfvDiplomaTras" runat="server" ControlToValidate="flDiplomaTras" ErrorMessage="Anexe a foto de trás do seu diploma" ForeColor="Red"></asp:RequiredFieldValidator>

                      </td>
                  </tr> 
                  <tr> <td class="auto-style3"> &nbsp; &nbsp; &nbsp;</td>
                      <td class="auto-style3"> &nbsp; &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="field your-email form-group" style="font-family: Arial; color: #000000; font-size: 16px; width: 336px;"> Anexe uma foto sua:</td>
                    
                      <td><asp:FileUpload ID="flfotoProf" runat="server" Title ="Foto do Professor"/>
                            <asp:RequiredFieldValidator ID="rfvFoto" runat="server" ControlToValidate="flfotoProf" ErrorMessage="Anexe uma foto sua" ForeColor="Red"></asp:RequiredFieldValidator>

                      </td>
                  </tr> 
              </table>
                  </div>
                 
                  <div class="row mar-bot40">
                     
                      <div class="col-md-2">
                          <asp:Button ID="btnVoltar" runat="server" Text="VOLTAR" class="botoes" style="width:160px;" CausesValidation="False" OnClick="btnVoltar_Click" />
                      </div>

                      <div class="col-md-7"></div>

                      <div class="col-md-2">
                          <asp:Button ID="btnCadastrar" runat="server" Text="CADASTRAR" class="botoes" style="width:160px;" OnClick="btnCadastrar_Click" />
                      </div>

                  </div>

                  </div>
              </div>
            </div>

     <asp:SqlDataSource ID="sqlPagamento" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" InsertCommand="INSERT INTO pagamento_prof(tipo_pagtprof, banco_pagtprof, agencia_pagtprof, conta_pagtprof, data_pagtprof, pagt_pagtprof) VALUES (@Tipo, @Banco, @Agencia, @Conta, @Data, @Pagamento)" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT MAX(id_pagtprof)AS id_pagto FROM pagamento_prof">
         <InsertParameters>
             <asp:Parameter Name="Tipo"  />
             <asp:Parameter Name="Banco" />
             <asp:Parameter Name="Conta" />
             <asp:Parameter Name="Agencia" />
             <asp:Parameter Name="Data" />
             <asp:Parameter Name="Pagamento" />
         </InsertParameters>
     </asp:SqlDataSource>
          
        <asp:SqlDataSource ID="sqlProfessor" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT * FROM professor" InsertCommand="INSERT INTO professor(nome_prof, email_prof, dataNasc_prof, cpf_prof, sexo_prof, cep_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, pass_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, id_pagtprof, status_prof) VALUES (@Nome, @Email, @DataNasc, @CPF, @Sexo, @CEP, @Cidade, @Rua, @Bairro, @Num, @Tel, @Senha, @Foto, @Diploma, @DiplomaTras, @id_pagto, 'on')">
            <InsertParameters>
                <asp:Parameter Name="Nome" />
                <asp:Parameter Name="Email"  />
                <asp:Parameter Name="DataNasc" />
                <asp:Parameter Name="CPF"/>
                <asp:Parameter Name="Sexo"  />
                <asp:Parameter Name="CEP"  />
                <asp:Parameter Name="Cidade" />
                <asp:Parameter Name="Rua"  />
                <asp:Parameter Name="Bairro" />
                <asp:Parameter Name="Num"  />
                <asp:Parameter Name="Tel"  />
                <asp:Parameter Name="Senha"  />
                <asp:Parameter Name="Diploma" />
                <asp:Parameter Name="DiplomaTras" />
                <asp:Parameter Name="Foto" />
                <asp:SessionParameter Name="id_pagto" SessionField="id_pagto" />
            </InsertParameters>
        </asp:SqlDataSource>

                   <asp:SqlDataSource ID="sqlEmailCheckADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_adm, nome_adm, email_adm, dataNasc_adm, cpf_adm, sexo_adm, cep_adm, cidade_adm, rua_adm, bairro_adm, num_adm, tel_adm, pass_adm, imagem_adm FROM adm WHERE (email_adm = @Email)">
                       <SelectParameters>
                           <asp:Parameter Name="Email" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                 <asp:SqlDataSource ID="sqlEmailCheckAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_user, nome_user, email_user, dataNasc_user, cpf_user, sexo_user, cep_user, cidade_user, rua_user, bairro_user, num_user, tel_user, pass_user, imagem_user FROM aluno WHERE (email_user = @Email)">
                      <SelectParameters>
                           <asp:Parameter Name="Email" />
                       </SelectParameters>
                 </asp:SqlDataSource>
                 <asp:SqlDataSource ID="sqlEmailCheckProf" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_prof, nome_prof, email_prof, dataNasc_prof, cpf_prof, sexo_prof, cep_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, pass_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, id_pagtprof FROM professor WHERE (email_prof = @Email)">
                      <SelectParameters>
                           <asp:Parameter Name="Email" />
                       </SelectParameters>
                 </asp:SqlDataSource>
                   <asp:SqlDataSource ID="sqlCPFCheckADM" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_adm, nome_adm, email_adm, dataNasc_adm, cpf_adm, sexo_adm, cep_adm, cidade_adm, rua_adm, bairro_adm, num_adm, tel_adm, pass_adm, imagem_adm FROM adm WHERE (cpf_adm = @Cpf)">
                       <SelectParameters>
                           <asp:Parameter Name="Cpf" />
                       </SelectParameters>
                   </asp:SqlDataSource><asp:SqlDataSource ID="sqlCPFCheckAluno" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_user, nome_user, email_user, dataNasc_user, cpf_user, sexo_user, cep_user, cidade_user, rua_user, bairro_user, num_user, tel_user, pass_user, imagem_user FROM aluno WHERE (cpf_user = @Cpf)">
                      <SelectParameters>
                           <asp:Parameter Name="Cpf" />
                       </SelectParameters>
                 </asp:SqlDataSource>
                 <asp:SqlDataSource ID="sqlCPFCheckProf" runat="server" ConnectionString="<%$ ConnectionStrings:myteachConnectionString %>" ProviderName="<%$ ConnectionStrings:myteachConnectionString.ProviderName %>" SelectCommand="SELECT id_prof, nome_prof, email_prof, dataNasc_prof, cpf_prof, sexo_prof, cep_prof, cidade_prof, rua_prof, bairro_prof, num_prof, tel_prof, pass_prof, imagem_prof, diplomafrente_prof, diplomatras_prof, id_pagtprof FROM professor WHERE (cpf_prof = @Cpf)">
                      <SelectParameters>
                           <asp:Parameter Name="Cpf" />
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
            <li><a href="HomeINICIO.aspx">Home</a></li>
          <li><a href="CursosINICIO.aspx">Cursos</a></li>
          <li><a href="MoedaINICIO.aspx">Moeda</a></li>
		  <li><a href="QuemSomosINICIO.aspx">Quem somos</a></li>
		  <li><a href="ContatoINICIO.aspx">Contato</a></li>
		  <li><a href="LoginINICIO.aspx">Login</a></li>
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



