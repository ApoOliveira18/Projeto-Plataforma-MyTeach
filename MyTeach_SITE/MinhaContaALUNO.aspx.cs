using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MinhaContaALUNO : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usulogado"] != null)
        {
            if (Session["usulogado"].ToString() != "Aluno")
            {
                Response.Redirect("LoginINICIO.aspx");

            }
        }
        else
        {
            Response.Redirect("LoginINICIO.aspx");
        }

        DataView MinhaConta;

        MinhaConta = (DataView)sqlMinhaConta.
            Select(DataSourceSelectArguments.Empty);
        
        //Carregar a informações
        if (!IsPostBack)
        {                    

            try
            {
                lblNome.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["nome_user"].ToString());
                lblEmail.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["email_user"].ToString());
                lblCpf.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cpf_user"].ToString());
                lblSexo.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["sexo_user"].ToString());
                txtCep.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cep_user"].ToString());
                txtCidade.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cidade_user"].ToString());
                txtRua.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["rua_user"].ToString());
                txtBairro.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["bairro_user"].ToString());
                txtNúmero.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["num_user"].ToString());
                txtTel.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["tel_user"].ToString());
                txtSenha.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["pass_user"].ToString());
                Img.ImageUrl = cripto.Decrypt(MinhaConta.Table.Rows[0]["imagem_user"].ToString());
                Session["Foto"] = cripto.Decrypt(MinhaConta.Table.Rows[0]["imagem_user"].ToString());

                //mudar data para formato certo
                DateTime dt;
                dt = Convert.ToDateTime(MinhaConta.Table.Rows[0]["dataNasc_user"].ToString());
                txtData.Text = dt.ToShortDateString();

            }
            catch
            {
                lblNome.Text = "";
                lblEmail.Text = "";
                txtData.Text = "";
                lblCpf.Text = "";
                lblSexo.Text = "";
                txtCep.Text = "";
                txtCidade.Text = "";
                txtRua.Text = "";
                txtBairro.Text = "";
                txtNúmero.Text = "";
                txtTel.Text = "";
                txtSenha.Text = "";
                Img.ImageUrl = "";
                lblFraca.Text = "";
                lblForte.Text = "";
                
            }
        }
    }

    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        //Verificar a senha 
        try
        {
            if (lblForte.Text != "")
            {
                if (txtConfSenha.Text == "")
                {
                    lblConfSenha.Text = "Confirme a senha para finalizar a alteração";
                    lblData.Text = "";
                }
                else
                {
                    lblConfSenha.Text = "";
                    lblData.Text = "";

                    String foto, foto1BD;

                    foto = flFoto.FileName;

                    if (foto != "")
                    {
                        flFoto.SaveAs(Server.MapPath("\\Imagens\\Aluno\\" + foto));
                        foto1BD = "~\\Imagens\\Aluno\\" + foto;
                    }
                    else
                    {
                        foto1BD = Session["Foto"].ToString();
                    }

                    sqlMinhaConta.UpdateParameters["NovoNome"].DefaultValue = cripto.Encrypt(lblNome.Text);
                    sqlMinhaConta.UpdateParameters["NovoEmail"].DefaultValue = cripto.Encrypt(lblEmail.Text);
                    sqlMinhaConta.UpdateParameters["NovoCPF"].DefaultValue = cripto.Encrypt(lblCpf.Text);
                    sqlMinhaConta.UpdateParameters["NovoSexo"].DefaultValue = cripto.Encrypt(lblSexo.Text);
                    sqlMinhaConta.UpdateParameters["NovoCEP"].DefaultValue = cripto.Encrypt(txtCep.Text);
                    sqlMinhaConta.UpdateParameters["NovaCidade"].DefaultValue = cripto.Encrypt(txtCidade.Text);
                    sqlMinhaConta.UpdateParameters["NovaRua"].DefaultValue = cripto.Encrypt(txtRua.Text);
                    sqlMinhaConta.UpdateParameters["NovoBairro"].DefaultValue = cripto.Encrypt(txtBairro.Text);
                    sqlMinhaConta.UpdateParameters["NovoNum"].DefaultValue = cripto.Encrypt(txtNúmero.Text);
                    sqlMinhaConta.UpdateParameters["NovoTel"].DefaultValue = cripto.Encrypt(txtTel.Text);
                    sqlMinhaConta.UpdateParameters["NovaSenha"].DefaultValue = cripto.Encrypt(txtSenha.Text);
                    sqlMinhaConta.UpdateParameters["NovoFoto"]
                              .DefaultValue = cripto.Encrypt(foto1BD);


                    //se nao colocar nesse formato, pula para o catch
                    Convert.ToDateTime(txtData.Text);
                    sqlMinhaConta.UpdateParameters["NovaDataNasc"].DefaultValue = txtData.Text;

                    sqlMinhaConta.Update();

                    sqlUpdateAluno.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                    sqlUpdateAluno.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Update");
                    sqlUpdateAluno.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Update Conta ALUNO");

                    sqlUpdateAluno.Insert();
                }
            }
        }
        //se der erro só no formato da data
        catch (FormatException)
        {
            lblData.Text = "Data Inválida!!";
            lblConfSenha.Text = "";
        }
       
    }
    

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomeALUNO.aspx");
    }

    protected void btnDesativar_Click(object sender, EventArgs e)
    {
        sqlDesativar.Update();

        sqlDesativarAluno.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
        sqlDesativarAluno.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Desativar");
        sqlDesativarAluno.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Desativar Conta ALUNO");

        sqlDesativarAluno.Insert();
        Response.Redirect("HomeINICIO.aspx");
    }

    protected void lnkSenha_Click(object sender, EventArgs e)
    {
        //Verificação da força da senha
        int qtdLetras;
        int qtdLetMai = 0, qtdLetMin = 0, qtdNum = 0, qtdCar = 0;

        qtdLetras = txtSenha.Text.Length;

        if (qtdLetras < 6)
        {
            lblFraca.Text = "Favor digitar outra senha com 6 caracteres no mínimo";
            lblForte.Text = "";
            txtConfSenha.Text = "";
        }
        else
        {
            txtSenha.Attributes.Add("value", txtSenha.Text);
            lblFraca.Text = "";
            lblForte.Text = "";

            for (int i = 0; i < qtdLetras; i++)
            {
                if (char.IsLower(txtSenha.Text[i]))
                {
                    qtdLetMin++;
                }
                else
                {
                    if (char.IsUpper(txtSenha.Text[i]))
                    {
                        qtdLetMai = qtdLetMai + 1;
                    }
                    else
                    {
                        if (char.IsNumber(txtSenha.Text[i]))
                        {
                            qtdNum++;
                        }
                        else
                        {
                            if (!char.IsWhiteSpace(txtSenha.Text[i]))
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


    protected void lnHelp_Click(object sender, EventArgs e)
    {
        Session["Arquivo"] = "\\Conteudo\\Aluno\\ManualALUNO.pdf";

        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Session["Arquivo"].ToString() + "");
        Response.TransmitFile(Server.MapPath(Session["Arquivo"].ToString()));
        Response.End();
    }
}