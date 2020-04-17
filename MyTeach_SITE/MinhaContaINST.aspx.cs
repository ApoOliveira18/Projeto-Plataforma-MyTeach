using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MinhaContaINST : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usulogado"] != null)
        {
            if (Session["usulogado"].ToString() != "Professor")
            {
                Response.Redirect("LoginINICIO.aspx");

            }
        }
        else
        {
            Response.Redirect("LoginINICIO.aspx");
        }

        //Verificar se existe e carregar a informação
        if (!IsPostBack)
        {
            DataView MinhaConta;

            MinhaConta = (DataView)sqlMinhaConta.
                Select(DataSourceSelectArguments.Empty);

            try
            {                
                lblNome.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["nome_prof"].ToString());
                lblEmail.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["email_prof"].ToString());
                lblCpf.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cpf_prof"].ToString());
                lblSexo.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["sexo_prof"].ToString());
                txtCep.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cep_prof"].ToString());
                txtCidade.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["cidade_prof"].ToString());
                txtRua.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["rua_prof"].ToString());
                txtBairro.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["bairro_prof"].ToString());
                txtNúmero.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["num_prof"].ToString());
                txtTel.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["tel_prof"].ToString());
                txtSenha.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["pass_prof"].ToString());
                Image.ImageUrl = cripto.Decrypt(MinhaConta.Table.Rows[0]["imagem_prof"].ToString());
                ImgDiploma.ImageUrl = cripto.Decrypt(MinhaConta.Table.Rows[0]["diplomafrente_prof"].ToString());
                ImgDiplomaTras.ImageUrl = cripto.Decrypt(MinhaConta.Table.Rows[0]["diplomatras_prof"].ToString());

                //mudar data para formato certo
                DateTime dt;
                dt = Convert.ToDateTime(MinhaConta.Table.Rows[0]["dataNasc_prof"].ToString());
                txtData.Text = dt.ToShortDateString();

                txtDataPagamento.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["data_pagtprof"].ToString());
                txtTipoContaProf.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["tipo_pagtprof"].ToString());
                txtBancoProf.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["banco_pagtprof"].ToString());
                txtAgenciaProf.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["agencia_pagtprof"].ToString());
                txtContaProf.Text = cripto.Decrypt(MinhaConta.Table.Rows[0]["conta_pagtprof"].ToString());
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
                Image.ImageUrl = "";
                ImgDiploma.ImageUrl = "";
                ImgDiplomaTras.ImageUrl = "";
                txtTipoContaProf.Text = "";
                txtBancoProf.Text = "";
                txtAgenciaProf.Text = "";
                txtContaProf.Text = "";
            }
        }
    }

    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        //Converter a data
        double data;
        data = Convert.ToDouble(txtDataPagamento.Text);
        
        try
        {
            if (lblForte.Text != "")
            {
                //Verificar o valor atribuido a data
                if (data < 1 || data > 28)
                {
                    lblDatapagemento.Text = "Escolha um dia entre o dia 1 á dia 28";
                    lblConfSenha.Text = "";
                    lblData.Text = "";
                }
                else
                {
                    //Verificar se esta confimando a senha
                    if (txtConfSenha.Text == "")
                    {
                        lblConfSenha.Text = "Confirme a senha para finalizar a alteração";
                        lblDatapagemento.Text = "";
                        lblData.Text = "";
                    }
                    else
                    {
                        lblDatapagemento.Text = "";
                        lblConfSenha.Text = "";
                        lblData.Text = "";
                        sqlMinhaConta.UpdateParameters["NovoNome"].DefaultValue = cripto.Encrypt(lblNome.Text);
                        sqlMinhaConta.UpdateParameters["NovoEmail"].DefaultValue = cripto.Encrypt(lblEmail.Text);
                        sqlMinhaConta.UpdateParameters["NovoCPF"].DefaultValue = cripto.Encrypt(lblCpf.Text);
                        sqlMinhaConta.UpdateParameters["NovoCEP"].DefaultValue = cripto.Encrypt(txtCep.Text);
                        sqlMinhaConta.UpdateParameters["NovaCidade"].DefaultValue = cripto.Encrypt(txtCidade.Text);
                        sqlMinhaConta.UpdateParameters["NovaRua"].DefaultValue = cripto.Encrypt(txtRua.Text);
                        sqlMinhaConta.UpdateParameters["NovoBairro"].DefaultValue = cripto.Encrypt(txtBairro.Text);
                        sqlMinhaConta.UpdateParameters["NovoNum"].DefaultValue = cripto.Encrypt(txtNúmero.Text);
                        sqlMinhaConta.UpdateParameters["NovoTel"].DefaultValue = cripto.Encrypt(txtTel.Text);
                        sqlMinhaConta.UpdateParameters["NovaSenha"].DefaultValue = cripto.Encrypt(txtSenha.Text);
                        sqlMinhaConta.UpdateParameters["NovoSexo"].DefaultValue = cripto.Encrypt(lblSexo.Text);

                        //se nao colocar nesse formato, pula para o catch
                        Convert.ToDateTime(txtData.Text);
                        sqlMinhaConta.UpdateParameters["NovaDataNasc"].DefaultValue = txtData.Text;


                        String foto, foto1BD;

                        foto = flImagem.FileName;

                        if (foto != "")
                        {
                            flImagem.SaveAs(Server.MapPath("\\IMG\\" + foto));
                            foto1BD = "~\\IMG\\" + foto;
                        }
                        else
                        {
                            foto1BD = Image.ImageUrl;
                        }
                        sqlMinhaConta.UpdateParameters["NovaFoto"]
                            .DefaultValue = cripto.Encrypt(foto1BD);
                        ///////////////////////////////

                        String fotoDiploma, fotoDiplomaBD;

                        fotoDiploma = flDiploma.FileName;

                        if (fotoDiploma != "")
                        {
                            flDiploma.SaveAs(Server.MapPath("\\IMG\\" + fotoDiploma));
                            fotoDiplomaBD = "~\\IMG\\" + fotoDiploma;
                        }
                        else
                        {
                            fotoDiplomaBD = ImgDiploma.ImageUrl;
                        }
                        sqlMinhaConta.UpdateParameters["NovoDiploma"]
                            .DefaultValue = cripto.Encrypt(fotoDiplomaBD);
                        //////////////////////////////////////

                        String fotoDiplomaTras, fotoDiplomaTrasBD;

                        fotoDiplomaTras = flDiplomaTras.FileName;

                        if (foto != "")
                        {
                            flDiplomaTras.SaveAs(Server.MapPath("\\IMG\\" + fotoDiplomaTras));
                            fotoDiplomaTrasBD = "~\\IMG\\" + fotoDiplomaTras;
                        }
                        else
                        {
                            fotoDiplomaTrasBD = ImgDiplomaTras.ImageUrl;
                        }
                        sqlMinhaConta.UpdateParameters["NovoDiplomaTras"]
                            .DefaultValue = cripto.Encrypt(fotoDiplomaTrasBD);

                        sqlMinhaConta.Update();
                        sqlUpdateProf.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                        sqlUpdateProf.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Update");
                        sqlUpdateProf.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Update Conta PROFESSOR");

                        sqlUpdateProf.Insert();

                    }
                }
            }
        }
        catch (FormatException)
        {
            lblData.Text = "Data Inválida";
            lblDatapagemento.Text="";
            lblConfSenha.Text = "";
        }
    }


    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("MeusCursosINST.aspx");
    }

    protected void btnDesativar_Click(object sender, EventArgs e)
    {        
        //Fazer o a desativação
        sqlDesativar.Update();

        //Salvar a disativação no auditoria
        sqlDesativarAUD.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
        sqlDesativarAUD.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Desativar");
        sqlDesativarAUD.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Desativar Conta PROFESSOR");

        sqlDesativarAUD.Insert();
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
        Session["Arquivo"] = "\\Conteudo\\Professor\\ManualProf.pdf";

        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Session["Arquivo"].ToString() + "");
        Response.TransmitFile(Server.MapPath(Session["Arquivo"].ToString()));
        Response.End();

    }
}