using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CadastroAlunoINICIO : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCadastrarAluno_Click(object sender, EventArgs e)
    {
        //Verificar se o Email ou CPF existem em alguma das três tabelas
        DataView dvEmailADM;
        sqlEmailCheckADM.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailAluno.Text);
        dvEmailADM = (DataView)sqlEmailCheckADM.Select(DataSourceSelectArguments.Empty);

        DataView dvEmailAluno;
        sqlEmailCheckAluno.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailAluno.Text);
        dvEmailAluno = (DataView)sqlEmailCheckAluno.Select(DataSourceSelectArguments.Empty);

        DataView dvEmailProf;
        sqlEmailCheckProf.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailAluno.Text);
        dvEmailProf = (DataView)sqlEmailCheckProf.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfADM;
        sqlCPFCheckADM.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCPFAluno.Text);
        dvCpfADM = (DataView)sqlCPFCheckADM.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfAluno;
        sqlCPFCheckAluno.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCPFAluno.Text);
        dvCpfAluno = (DataView)sqlCPFCheckAluno.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfProf;
        sqlCPFCheckProf.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCPFAluno.Text);
        dvCpfProf = (DataView)sqlCPFCheckProf.Select(DataSourceSelectArguments.Empty);

        //Validação do Email
        if (ValidarEmail(txtEmailAluno.Text) == false)
        {
            lblEmailCheck.Text = "Formato incorreto";
            lblCpfCheck.Text = "";
            lblConfSenha.Text = "";
            lblData.Text = "";
            
        }
        
        else
        {//Validação do CPF
            if (CPF.Validar(txtCPFAluno.Text) == false)
            {
                lblCpfCheck.Text = "Formato Incorreto";
                lblEmailCheck.Text = "";
                lblConfSenha.Text = "";
                lblData.Text = "";
            }

            else
            {
                //Caso o Email Exista
                if (dvEmailADM.Table.Rows.Count > 0 || dvEmailProf.Table.Rows.Count > 0 || dvEmailAluno.Table.Rows.Count > 0)
                {
                    lblEmailCheck.Text = "Já cadastrado";
                    lblCpfCheck.Text = "";
                    lblConfSenha.Text = "";
                    lblData.Text = "";
                }
                else
                {
                    //Caso o CPF exista
                    if (dvCpfAluno.Table.Rows.Count > 0 || dvCpfProf.Table.Rows.Count > 0 || dvCpfADM.Table.Rows.Count > 0)
                    {
                        lblCpfCheck.Text = "Já cadastrado";
                        lblEmailCheck.Text = "";
                        lblConfSenha.Text = "";
                        lblData.Text = "";
                    }
                    else
                    {
                        lblCpfCheck.Text = "";
                        lblConfSenha.Text = "";
                        lblData.Text = "";
                        lblEmailCheck.Text = "";

                        if (lblForte.Text != "")
                        {
                            if (txtConfSenhaAluno.Text != "")
                            {
                                try
                                {

                                    sqlAluno.InsertParameters["Nome"].DefaultValue = cripto.Encrypt(txtNomeAluno.Text);
                                    sqlAluno.InsertParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailAluno.Text);
                                    sqlAluno.InsertParameters["CPF"].DefaultValue = cripto.Encrypt(txtCPFAluno.Text);
                                    sqlAluno.InsertParameters["Sexo"].DefaultValue = cripto.Encrypt(rbnSexoAluno.SelectedValue);
                                    sqlAluno.InsertParameters["CEP"].DefaultValue = cripto.Encrypt(txtCepAluno.Text);
                                    sqlAluno.InsertParameters["Cidade"].DefaultValue = cripto.Encrypt(txtCidAluno.Text);
                                    sqlAluno.InsertParameters["Rua"].DefaultValue = cripto.Encrypt(txtRuaAluno.Text);
                                    sqlAluno.InsertParameters["Bairro"].DefaultValue = cripto.Encrypt(txtBairroAluno.Text);
                                    sqlAluno.InsertParameters["Num"].DefaultValue = cripto.Encrypt(txtNumAluno.Text);
                                    sqlAluno.InsertParameters["Tel"].DefaultValue = cripto.Encrypt(txtTelAluno.Text);
                                    sqlAluno.InsertParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenhaAluno.Text);

                                    //Arrumar a data para Cadastrar
                                    Convert.ToDateTime(txtDataNascAluno.Text);
                                    sqlAluno.InsertParameters["DataNasc"].DefaultValue = txtDataNascAluno.Text;
                                    /////////////////////////////////////////////////////// DATA

                                    // INICIO CÓDIGO PARA UPLOAD DE IMAGENS
                                    String foto, urlBD;

                                    foto = flFotoAluno.FileName;

                                    if (foto != "")
                                    {
                                        flFotoAluno.SaveAs(Server.MapPath("\\Imagens\\Aluno\\" + foto));
                                        urlBD = "~\\Imagens\\Aluno\\" + foto;
                                    }
                                    else
                                    {
                                        urlBD = "~\\Imagens\\Aluno\\sem-imagem.jpg";
                                    }

                                    sqlAluno.InsertParameters["Foto"].DefaultValue = cripto.Encrypt(urlBD);
                                    //////////////////////////////////////////////////////


                                    sqlAluno.Insert();

                                    Response.Redirect("LoginINICIO.aspx");
                                }
                                //Caso a data esteja no formato incorreto
                                catch (FormatException)
                                {
                                    lblData.Text = "Data Inválida";
                                    lblCpfCheck.Text = "";
                                    lblConfSenha.Text = "";
                                    lblEmailCheck.Text = "";
                                }
                            }
                            else
                            {
                                lblCpfCheck.Text = "";
                                lblData.Text = "";
                                lblEmailCheck.Text = "";
                                lblConfSenha.Text = "Confirme a senha para finalizar sue cadastro";
                            }
                        }
                    }
                }
            }
        }       
                    
    }     

    protected void btnVoltarAluno_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginINICIO.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Busca no site dos Correios
        BuscadoCorreio.AtendeClienteClient
            webServiceCorreios = new BuscadoCorreio.AtendeClienteClient("AtendeClientePort");

        try
        {
            var infoCep = webServiceCorreios.consultaCEP(txtCepAluno.Text);

            txtCidAluno.Text = infoCep.cidade;
            txtBairroAluno.Text = infoCep.bairro;
            txtRuaAluno.Text = infoCep.end;
        }
        catch (Exception)
        {
            txtCidAluno.Text = "";
            txtBairroAluno.Text = "";
            txtRuaAluno.Text = "";
        }
    }


    protected void lnkSenha_Click(object sender, EventArgs e)
    {
        //Verificação da força da senha
        int qtdLetras;
        int qtdLetMai = 0, qtdLetMin = 0, qtdNum = 0, qtdCar = 0;

        qtdLetras = txtSenhaAluno.Text.Length;

        if (qtdLetras < 6)
        {
            lblFraca.Text = "Favor digitar outra senha com 6 caracteres no mínimo";
            lblForte.Text = "";
            txtConfSenhaAluno.Text = "";
        }
        else
        {
            txtSenhaAluno.Attributes.Add("value", txtSenhaAluno.Text);
            lblFraca.Text = "";
            lblForte.Text = "";

            for (int i = 0; i < qtdLetras; i++)
            {
                if (char.IsLower(txtSenhaAluno.Text[i]))
                {
                    qtdLetMin++;
                }
                else
                {
                    if (char.IsUpper(txtSenhaAluno.Text[i]))
                    {
                        qtdLetMai = qtdLetMai + 1;
                    }
                    else
                    {
                        if (char.IsNumber(txtSenhaAluno.Text[i]))
                        {
                            qtdNum++;
                        }
                        else
                        {
                            if (!char.IsWhiteSpace(txtSenhaAluno.Text[i]))
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
        //Validação do Email
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