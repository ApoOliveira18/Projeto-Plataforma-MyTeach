using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CadastroProfINICIO : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {

        //Vai verificar se exite email ou cpf iguais nas três tabelas de usuários
        DataView dvEmailADM;

        sqlEmailCheckADM.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailProf.Text);
        dvEmailADM = (DataView)sqlEmailCheckADM.Select(DataSourceSelectArguments.Empty);

        DataView dvEmailAluno;
        sqlEmailCheckAluno.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailProf.Text);
        dvEmailAluno = (DataView)sqlEmailCheckAluno.Select(DataSourceSelectArguments.Empty);

        DataView dvEmailProf;
        sqlEmailCheckProf.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailProf.Text);
        dvEmailProf = (DataView)sqlEmailCheckProf.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfADM;

        sqlCPFCheckADM.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCPFProf.Text);
        dvCpfADM = (DataView)sqlCPFCheckADM.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfAluno;
        sqlCPFCheckAluno.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCPFProf.Text);
        dvCpfAluno = (DataView)sqlCPFCheckAluno.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfProf;
        sqlCPFCheckProf.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCPFProf.Text);
        dvCpfProf = (DataView)sqlCPFCheckProf.Select(DataSourceSelectArguments.Empty);

        //Validação do Email
        if (ValidarEmail(txtEmailProf.Text) == false)
        {
            lblEmailCheck.Text = "Formato incorreto";
            lblCpfCheck.Text = "";
            lblData.Text = "";
            lblConfSenha.Text = "";
            lblDataPagamento.Text = "";
        }
        else
        {
            //Validação do CPF
            if (CPF.Validar(txtCPFProf.Text) == false)
            {
                lblCpfCheck.Text = "Formato Incorreto";
                lblEmailCheck.Text = "";
                lblData.Text = "";
                lblConfSenha.Text = "";
                lblDataPagamento.Text = "";
            }

            else
            {
                //Caso ja exista o Email
                if (dvEmailADM.Table.Rows.Count > 0 || dvEmailProf.Table.Rows.Count > 0 || dvEmailAluno.Table.Rows.Count > 0)
                {
                    lblEmailCheck.Text = "Já cadastrado";
                    lblCpfCheck.Text = "";
                    lblData.Text = "";
                    lblConfSenha.Text = "";
                    lblDataPagamento.Text = "";
                }
                else
                {
                    //Caso ja exista o CPF
                    if (dvCpfAluno.Table.Rows.Count > 0 || dvCpfProf.Table.Rows.Count > 0 || dvCpfADM.Table.Rows.Count > 0)
                    {
                        lblCpfCheck.Text = "Já cadastrado";
                        lblEmailCheck.Text = "";
                        lblData.Text = "";
                        lblConfSenha.Text = "";
                        lblDataPagamento.Text = "";
                    }
                    else
                    {
                        lblCpfCheck.Text = "";
                        lblEmailCheck.Text = "";
                        lblData.Text = "";
                        lblConfSenha.Text = "";
                        lblDataPagamento.Text = "";

                        if (lblForte.Text != "")
                        {

                            //Verificar se a do Data do pagamento está entre o dia 1 á dia 28
                            double data;
                            data = Convert.ToDouble(txtDataPagamento.Text);

                            if (data < 1 || data > 28)
                            {
                                lblDataPagamento.Text = "Escolha uma data entre o dia 1 á 28";
                                lblCpfCheck.Text = "";
                                lblEmailCheck.Text = "";
                                lblData.Text = "";
                                lblConfSenha.Text = "";
                            }
                            else
                            {
                                if (txtConfSenhaProf.Text != "")
                                {
                                    try
                                    {
                                        lblDataPagamento.Text = "";
                                        //Cadastro primeiro na tabela do pagamento 
                                        DataView pagamento;

                                        pagamento = (DataView)sqlPagamento.Select(DataSourceSelectArguments.Empty);

                                        sqlPagamento.InsertParameters["Tipo"].DefaultValue = cripto.Encrypt(rbnConta.SelectedValue);
                                        sqlPagamento.InsertParameters["Banco"].DefaultValue = cripto.Encrypt(txtBancoProf.Text);
                                        sqlPagamento.InsertParameters["Conta"].DefaultValue = cripto.Encrypt(txtContaProf.Text);
                                        sqlPagamento.InsertParameters["Agencia"].DefaultValue = cripto.Encrypt(txtAgenciaProf.Text);
                                        sqlPagamento.InsertParameters["Data"].DefaultValue = cripto.Encrypt(txtDataPagamento.Text);
                                        sqlPagamento.InsertParameters["Pagamento"].DefaultValue = cripto.Encrypt("0");
                                        sqlPagamento.Insert();

                                        Session["id_pagto"] = pagamento.Table.Rows[0]["id_pagto"];
                                        /////////////////////////////////////////// PAGAMENTO           

                                        sqlProfessor.InsertParameters["Nome"].DefaultValue = cripto.Encrypt(txtNomeProf.Text);
                                        sqlProfessor.InsertParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailProf.Text);
                                        sqlProfessor.InsertParameters["CPF"].DefaultValue = cripto.Encrypt(txtCPFProf.Text);
                                        sqlProfessor.InsertParameters["Sexo"].DefaultValue = cripto.Encrypt(brnSexoProf.SelectedValue);
                                        sqlProfessor.InsertParameters["CEP"].DefaultValue = cripto.Encrypt(txtCEPProf.Text);
                                        sqlProfessor.InsertParameters["Cidade"].DefaultValue = cripto.Encrypt(txtCidProf.Text);
                                        sqlProfessor.InsertParameters["Rua"].DefaultValue = cripto.Encrypt(txtRuaProf.Text);
                                        sqlProfessor.InsertParameters["Bairro"].DefaultValue = cripto.Encrypt(txtBairroProf.Text);
                                        sqlProfessor.InsertParameters["Num"].DefaultValue = cripto.Encrypt(txtNumProf.Text);
                                        sqlProfessor.InsertParameters["Tel"].DefaultValue = cripto.Encrypt(txtTelProf.Text);
                                        sqlProfessor.InsertParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenhaProf.Text);

                                        /////////////////
                                        Convert.ToDateTime(txtDataNascProf.Text);
                                        sqlProfessor.InsertParameters["DataNasc"].DefaultValue = txtDataNascProf.Text;
                                        /////////////////////////////////////////////////////// DATA

                                        // INICIO CÓDIGO PARA UPLOAD DE IMAGENS
                                        String foto, urlBD;

                                        foto = flfotoProf.FileName;

                                        if (foto != "")
                                        {
                                            flfotoProf.SaveAs(Server.MapPath("\\Imagens\\Professor\\" + foto));
                                            urlBD = "~\\Imagens\\Professor\\" + foto;
                                        }
                                        else
                                        {
                                            urlBD = "~\\Imagens\\Professor\\sem-imagem.jpg";
                                        }

                                        sqlProfessor.InsertParameters["Foto"].DefaultValue = cripto.Encrypt(urlBD);

                                        //////////////////////////////////////////////////////


                                        // INICIO CÓDIGO PARA UPLOAD DO DIPLOMA
                                        String foto1, urlBD1;

                                        foto1 = flDiploma.FileName;

                                        if (foto1 != "")
                                        {
                                            flDiploma.SaveAs(Server.MapPath("\\Imagens\\Professor\\" + foto1));
                                            urlBD1 = "~\\Imagens\\Professor\\" + foto1;
                                        }
                                        else
                                        {
                                            urlBD1 = "~\\Imagens\\Professor\\sem-imagem.jpg";
                                        }

                                        sqlProfessor.InsertParameters["Diploma"].DefaultValue = cripto.Encrypt(urlBD1);
                                        //////////////////////////////////////////////////////


                                        // INICIO CÓDIGO PARA UPLOAD DO DIPLOMA TRAS
                                        String foto2, urlBD2;

                                        foto2 = flDiplomaTras.FileName;

                                        if (foto2 != "")
                                        {
                                            flDiplomaTras.SaveAs(Server.MapPath("\\Imagens\\Professor\\" + foto2));
                                            urlBD2 = "~\\Imagens\\Professor\\" + foto2;
                                        }
                                        else
                                        {
                                            urlBD2 = "~\\Imagens\\Professor\\sem-imagem.jpg";
                                        }

                                        sqlProfessor.InsertParameters["DiplomaTras"].DefaultValue = cripto.Encrypt(urlBD2);
                                        //////////////////////////////////////////////////////

                                        sqlProfessor.Insert();
                                        Response.Redirect("LoginINICIO.aspx");
                                    }

                                    //Caso a data esteja invalida
                                    catch (FormatException)
                                    {
                                        lblData.Text = "Data Inválida";
                                    }
                                }
                                else
                                {
                                    lblCpfCheck.Text = "";
                                    lblEmailCheck.Text = "";
                                    lblData.Text = "";
                                    lblConfSenha.Text = "Confirme a senha para finalizar o cadastro";
                                    lblDataPagamento.Text = "";

                                }
                            }
                        }
                    }
                }
            }
        }
    
    }      

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginINICIO.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        //Busca no site dos Correios 
        BuscadoCorreio.AtendeClienteClient
            webServiceCorreios = new BuscadoCorreio.AtendeClienteClient("AtendeClientePort");

        try
        {
            //Caso exista
            var infoCep = webServiceCorreios.consultaCEP(txtCEPProf.Text);

            txtCidProf.Text = infoCep.cidade;
            txtBairroProf.Text = infoCep.bairro;
            txtRuaProf.Text = infoCep.end;
        }
        catch (Exception)
        {
            //Caso não exista
            txtCidProf.Text = "";
            txtBairroProf.Text = "";
            txtRuaProf.Text = "";
        }
    }


    protected void lnkSenha_Click(object sender, EventArgs e)
    {
        //Verificação da força da senha
        int qtdLetras;
        int qtdLetMai = 0, qtdLetMin = 0, qtdNum = 0, qtdCar = 0;

        qtdLetras = txtSenhaProf.Text.Length;

        if (qtdLetras < 6)
        {
            lblFraca.Text = "Favor digitar outra senha com 6 caracteres no mínimo";
            lblForte.Text = "";
            txtConfSenhaProf.Text = "";
        }
        else
        {
            txtSenhaProf.Attributes.Add("value", txtSenhaProf.Text);
            lblFraca.Text = "";
            lblForte.Text = "";

            for (int i = 0; i < qtdLetras; i++)
            {
                if (char.IsLower(txtSenhaProf.Text[i]))
                {
                    qtdLetMin++;
                }
                else
                {
                    if (char.IsUpper(txtSenhaProf.Text[i]))
                    {
                        qtdLetMai = qtdLetMai + 1;
                    }
                    else
                    {
                        if (char.IsNumber(txtSenhaProf.Text[i]))
                        {
                            qtdNum++;
                        }
                        else
                        {
                            if (!char.IsWhiteSpace(txtSenhaProf.Text[i]))
                            {
                                qtdCar++;
                            }
                        }
                    }
                }
            }

            if (qtdCar != 0 &&
                qtdLetMai != 0 &&
                qtdLetMin != 0 &&
                qtdNum != 0)
            {
                lblForte.Text = "Senha Forte";
                lblFraca.Text = "";
            }
            else
            {
                if (qtdCar != 0)
                {
                    if (qtdLetMai != 0 && qtdLetMin != 0)
                    {
                       lblFraca.Text = "Senha Média";
                        lblForte.Text = "";
                    }
                    if (qtdLetMai != 0 && qtdNum != 0)
                    {
                        lblFraca.Text = "Senha Média";
                        lblForte.Text = "";

                    }
                    if (qtdLetMin != 0 && qtdNum != 0)
                    {
                        lblFraca.Text = "Senha Média";
                        lblForte.Text = "";
                    }
                }
                else
                {
                    if (qtdLetMai != 0)
                    {
                        if (qtdLetMin != 0 && qtdNum != 0)
                        {
                            lblFraca.Text = "Senha Média";
                            lblForte.Text = "";
                        }
                    }
                    else
                    {
                        lblFraca.Text = "Senha Fraca";
                        lblForte.Text = "";
                    }

                }
            }
        }
    }

    public static bool ValidarEmail(string strEmail)
    {
        //Código para verficar o Email
        string strModelo = "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$";
        if (System.Text.RegularExpressions.Regex.IsMatch(strEmail, strModelo))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}