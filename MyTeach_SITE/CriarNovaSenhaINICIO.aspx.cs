using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CriarNovaSenhaINICIO : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");


    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void lnkSenha_Click(object sender, EventArgs e)
    {
        //Verificação da força da senha
        int qtdLetras;
        int qtdLetMai = 0, qtdLetMin = 0, qtdNum = 0, qtdCar = 0;

        qtdLetras = txtNovaSenha.Text.Length;

        if (qtdLetras < 6)
        {
            lblFraca.Text = "Favor digitar outra senha com 6 caracteres no mínimo";
            lblForte.Text = "";
            txtNovaSenha.Text = "";
        }
        else
        {
            txtNovaSenha.Attributes.Add("value", txtNovaSenha.Text);
            lblFraca.Text = "";
            lblForte.Text = "";

            for (int i = 0; i < qtdLetras; i++)
            {
                if (char.IsLower(txtNovaSenha.Text[i]))
                {
                    qtdLetMin++;
                }
                else
                {
                    if (char.IsUpper(txtNovaSenha.Text[i]))
                    {
                        qtdLetMai = qtdLetMai + 1;
                    }
                    else
                    {
                        if (char.IsNumber(txtNovaSenha.Text[i]))
                        {
                            qtdNum++;
                        }
                        else
                        {
                            if (!char.IsWhiteSpace(txtNovaSenha.Text[i]))
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

    protected void Unnamed2_Click(object sender, EventArgs e)
    {//Verificar se o txtConf está vazio
        if (txtConfSenha.Text != "")
        {
            if (lblForte.Text != "")
            {
                sqlADM.UpdateParameters["SenhaAtual"].DefaultValue = cripto.Encrypt(txtSenha.Text);
                sqlADM.UpdateParameters["SenhaNova"].DefaultValue = cripto.Encrypt(txtNovaSenha.Text);
                sqlADM.UpdateParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                sqlADM.UpdateParameters["Senha1"].DefaultValue = Session["Senha1"].ToString();
                sqlADM.Update();

                if (Session["Motivo"] != null)
                {
                    if (Session["Motivo"].ToString() == "Primeiro acesso")
                    {
                        sqlAudAdm.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                        sqlAudAdm.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Mudou a senha");
                        sqlAudAdm.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Mudou a senha primeiro acesso");

                        sqlAudAdm.Insert();
                    }
                    else
                    {
                        sqlAudAdm.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                        sqlAudAdm.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Mudou a senha");
                        sqlAudAdm.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Mudou a senha expirou a senha");

                        sqlAudAdm.Insert();
                    }

                }
            }

            Response.Redirect("LoginINICIO.aspx");
        }
        
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginINICIO.aspx");
    }


    protected void lnkSenha_Click1(object sender, EventArgs e)
    {

        //Verificação da força da senha
        int qtdLetras;
        int qtdLetMai = 0, qtdLetMin = 0, qtdNum = 0, qtdCar = 0;

        qtdLetras = txtNovaSenha.Text.Length;

        if (qtdLetras < 6)
        {
            lblFraca.Text = "Favor digitar outra senha com 6 caracteres no mínimo";
            lblForte.Text = "";
            txtConfSenha.Text = "";
        }
        else
        {
            txtNovaSenha.Attributes.Add("value", txtNovaSenha.Text);
            lblFraca.Text = "";
            lblForte.Text = "";

            for (int i = 0; i < qtdLetras; i++)
            {
                if (char.IsLower(txtNovaSenha.Text[i]))
                {
                    qtdLetMin++;
                }
                else
                {
                    if (char.IsUpper(txtNovaSenha.Text[i]))
                    {
                        qtdLetMai = qtdLetMai + 1;
                    }
                    else
                    {
                        if (char.IsNumber(txtNovaSenha.Text[i]))
                        {
                            qtdNum++;
                        }
                        else
                        {
                            if (!char.IsWhiteSpace(txtNovaSenha.Text[i]))
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
}