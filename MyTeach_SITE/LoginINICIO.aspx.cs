using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Web.Services;

public partial class LoginINICIO : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");

    protected static string ReCaptcha_Key = "6Ld0OLUUAAAAAIVu_g7ZM_mMYNIb5O9ZfBNiK3Pp";
    protected static string ReCaptcha_Secret = "6Ld0OLUUAAAAAFwqeY-oqiLgx-Rcsd0NU7LrfZ_i";

    int contador;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["contador"] = 0;
        }

        pnlTenativa.Visible = false;
        rfvCaptcha.Enabled = false;


    }


    [WebMethod]
    public static string VerifyCaptcha(string response)
    {
        string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
        return (new WebClient()).DownloadString(url);
    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        DataView Aluno, prof, adm;

        sqlAluno.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtLogin.Text);
        sqlAluno.SelectParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenha.Text);
        Aluno = (DataView)sqlAluno.Select(DataSourceSelectArguments.Empty);



        sqlProfessor.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtLogin.Text);
        sqlProfessor.SelectParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenha.Text);
        prof = (DataView)sqlProfessor.Select(DataSourceSelectArguments.Empty);



        sqlADM.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtLogin.Text);
        sqlADM.SelectParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenha.Text);
        adm = (DataView)sqlADM.Select(DataSourceSelectArguments.Empty);



        //criando session para armazenar contador pois a variável normal não funciona
        //se ele não for nulo colocar mais um clique
        if (Session["contador"] != null)
        {
            contador = (int)Session["contador"];

        }



        if (Aluno.Table.Rows.Count == 0 && prof.Table.Rows.Count == 0 && adm.Table.Rows.Count == 0)
        {
            //quando não tiver nenhum cliqe, colocar um clique
            contador++;
            Session["contador"] = contador;
            lblErro.Text = "Login ou senha errado.";

            // quando passar 3 cliques, mostrar pergunta secreta

            if (contador >= 3)
            {
                pnlTenativa.Visible = true;
                lblErro.Text = "";               
                btnEntrar.Visible = false;

                if (pnlEsconder.Visible == true)
                {
                    rfvCaptcha.Enabled = true;
                    pnlEsconder.Visible = false;
                }
                if (txtCaptcha.Text == "true")
                {
                    rfvCaptcha.Enabled = false;

                }

            }

        }

        else
        {
            if (Aluno.Table.Rows.Count > 0)
            {
                Session["Id_user"] = Aluno.Table.Rows[0]["id_user"].ToString();
                string statusAluno = Aluno.Table.Rows[0]["status_user"].ToString();

                if (statusAluno == "on")
                {
                    Session["usulogado"] = "Aluno";
                    Session["NomeAluno"] = cripto.Decrypt(Aluno.Table.Rows[0]["nome_user"].ToString());
                    Response.Redirect("HomeALUNO.aspx");
                }
                else
                {
                    sqlAluno.Update();
                    Session["usulogado"] = "Aluno";
                    Session["NomeAluno"] = cripto.Decrypt(Aluno.Table.Rows[0]["nome_user"].ToString());
                    Response.Redirect("HomeALUNO.aspx");
                }

            }

            if (prof.Table.Rows.Count > 0)
            {
                Session["Id_prof"] = prof.Table.Rows[0]["id_prof"].ToString();
                string statusProf = prof.Table.Rows[0]["status_Prof"].ToString();


                if (statusProf == "on")
                {
                    Session["NomeProf"] = cripto.Decrypt(prof.Table.Rows[0]["nome_prof"].ToString());
                    Session["usulogado"] = "Professor";
                    Session["id_pagto"] = prof.Table.Rows[0]["id_pagtprof"].ToString();
                    Response.Redirect("MeusCursosINST.aspx");
                }
                else
                {
                    sqlProfessor.Update();
                    Session["NomeProf"] = cripto.Decrypt(prof.Table.Rows[0]["nome_prof"].ToString());
                    Session["usulogado"] = "Professor";
                    Session["id_pagto"] = prof.Table.Rows[0]["id_pagtprof"].ToString();
                    Response.Redirect("MeusCursosINST.aspx");
                }

            }

            if (adm.Table.Rows.Count > 0)
            {
                double acesso = Convert.ToDouble(adm.Table.Rows[0]["acesso_adm"].ToString());
                DateTime dt;
                dt = Convert.ToDateTime(adm.Table.Rows[0]["datacad_adm"].ToString());

                Session["DataCadastrada"] = dt.ToShortDateString();


                DateTime dataCadastrada;

                dataCadastrada = Convert.ToDateTime(Session["DataCadastrada"].ToString());

                dataCadastrada = dataCadastrada.AddMonths(6);

                if (acesso == 0)
                {
                    Session["Motivo"] = "Primeiro acesso";
                    Session["SenhaAtual"] = cripto.Decrypt(adm.Table.Rows[0]["pass_adm"].ToString());
                    Session["Senha1"] = adm.Table.Rows[0]["pass1_adm"].ToString();
                    Session["Id_adm"] = adm.Table.Rows[0]["id_adm"].ToString();
                    Response.Redirect("CriarNovaSenhaINICIO.aspx");

                }
                else
                {
                    Session["Id_adm"] = adm.Table.Rows[0]["id_adm"].ToString();
                    string statusADM = adm.Table.Rows[0]["status_adm"].ToString();

                    if (statusADM == "on")
                    {
                        Session["SenhaAtual"] = cripto.Decrypt(adm.Table.Rows[0]["pass_adm"].ToString());
                        Session["Senha1"] = adm.Table.Rows[0]["pass1_adm"].ToString();
                        Session["Id_adm"] = adm.Table.Rows[0]["id_adm"].ToString();

                        if (dataCadastrada.CompareTo(DateTime.Now) <= 0)
                        {
                            Session["Motivo"] = "Passou 6 meses";
                            Response.Redirect("CriarNovaSenhaINICIO.aspx");
                        }
                        else
                        {
                            Session["usulogado"] = "ADM";
                            Session["NomeADM"] = cripto.Decrypt(adm.Table.Rows[0]["nome_adm"].ToString());
                            Response.Redirect("HomeADM.aspx");
                        }
                    }
                    else
                    {
                        sqlADM.Update();

                        Session["SenhaAtual"] = cripto.Decrypt(adm.Table.Rows[0]["pass_adm"].ToString());
                        Session["Senha1"] = adm.Table.Rows[0]["pass1_adm"].ToString();
                        Session["Id_adm"] = adm.Table.Rows[0]["id_adm"].ToString();

                        if (dataCadastrada.CompareTo(DateTime.Now) <= 0)
                        {
                            Session["Motivo"] = "Passou 6 meses";
                            Response.Redirect("CriarNovaSenhaINICIO.aspx");
                        }
                        else
                        {
                            Session["usulogado"] = "ADM";
                            Session["NomeADM"] = cripto.Decrypt(adm.Table.Rows[0]["nome_adm"].ToString());
                            Response.Redirect("HomeADM.aspx");
                        }
                    }

                }

            }
        }

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("CadastroINICIO.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {

        Response.Redirect("EsqueciSenhaINICIO.aspx");
    }


    protected void btnProsseguir_Click(object sender, EventArgs e)
    {
        if (pnlEsconder.Visible == true)
        {
            rfvCaptcha.Enabled = true;
            pnlEsconder.Visible = false;
        }
        if (txtCaptcha.Text == "true")
        {
            rfvCaptcha.Enabled = false;

        }
        DataView Aluno, prof, adm;

        sqlAluno.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtLogin.Text);
        sqlAluno.SelectParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenha.Text);
        Aluno = (DataView)sqlAluno.Select(DataSourceSelectArguments.Empty);

        sqlProfessor.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtLogin.Text);
        sqlProfessor.SelectParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenha.Text);
        prof = (DataView)sqlProfessor.Select(DataSourceSelectArguments.Empty);

        sqlADM.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtLogin.Text);
        sqlADM.SelectParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenha.Text);
        adm = (DataView)sqlADM.Select(DataSourceSelectArguments.Empty);

        if (Aluno.Table.Rows.Count == 0 && prof.Table.Rows.Count == 0 && adm.Table.Rows.Count == 0)
        {
            lblErro.Text = "Email ou senha incorretas";
            btnEntrar.Visible = true;
            pnlTenativa.Visible = false;
        }
        else
        {
            if (Aluno.Table.Rows.Count > 0)
            {
                Session["Id_user"] = Aluno.Table.Rows[0]["id_user"].ToString();
                string statusAluno = Aluno.Table.Rows[0]["status_user"].ToString();

                if (statusAluno == "on")
                {
                    Session["usulogado"] = "Aluno";
                    Session["NomeAluno"] = cripto.Decrypt(Aluno.Table.Rows[0]["nome_user"].ToString());
                    Response.Redirect("HomeALUNO.aspx");
                }
                else
                {
                    sqlAluno.Update();
                    Session["usulogado"] = "Aluno";
                    Session["NomeAluno"] = cripto.Decrypt(Aluno.Table.Rows[0]["nome_user"].ToString());
                    Response.Redirect("HomeALUNO.aspx");
                }

            }

            if (prof.Table.Rows.Count > 0)
            {
                Session["Id_prof"] = prof.Table.Rows[0]["id_prof"].ToString();
                string statusProf = prof.Table.Rows[0]["status_Prof"].ToString();


                if (statusProf == "on")
                {
                    Session["NomeProf"] = cripto.Decrypt(prof.Table.Rows[0]["nome_prof"].ToString());
                    Session["usulogado"] = "Professor";
                    Session["id_pagto"] = prof.Table.Rows[0]["id_pagtprof"].ToString();
                    Response.Redirect("MeusCursosINST.aspx");
                }
                else
                {
                    sqlProfessor.Update();
                    Session["NomeProf"] = cripto.Decrypt(prof.Table.Rows[0]["nome_prof"].ToString());
                    Session["usulogado"] = "Professor";
                    Session["id_pagto"] = prof.Table.Rows[0]["id_pagtprof"].ToString();
                    Response.Redirect("MeusCursosINST.aspx");
                }

            }

            if (adm.Table.Rows.Count > 0)
            {
                    double acesso = Convert.ToDouble(adm.Table.Rows[0]["acesso_adm"].ToString());
                    DateTime dt;
                    dt = Convert.ToDateTime(adm.Table.Rows[0]["datacad_adm"].ToString());

                    Session["DataCadastrada"] = dt.ToShortDateString();


                    DateTime dataCadastrada;

                    dataCadastrada = Convert.ToDateTime(Session["DataCadastrada"].ToString());

                    dataCadastrada = dataCadastrada.AddMonths(6);

                    if (acesso == 0)
                    {
                        Session["Motivo"] = "Primeiro acesso";
                        Session["SenhaAtual"] = cripto.Decrypt(adm.Table.Rows[0]["pass_adm"].ToString());
                        Session["Senha1"] = adm.Table.Rows[0]["pass1_adm"].ToString();
                        Session["Id_adm"] = adm.Table.Rows[0]["id_adm"].ToString();
                        Response.Redirect("CriarNovaSenhaINICIO.aspx");

                    }
                    else
                    {
                        Session["Id_adm"] = adm.Table.Rows[0]["id_adm"].ToString();
                        string statusADM = adm.Table.Rows[0]["status_adm"].ToString();

                        if (statusADM == "on")
                        {
                            Session["SenhaAtual"] = cripto.Decrypt(adm.Table.Rows[0]["pass_adm"].ToString());
                            Session["Senha1"] = adm.Table.Rows[0]["pass1_adm"].ToString();
                            Session["Id_adm"] = adm.Table.Rows[0]["id_adm"].ToString();

                            if (dataCadastrada.CompareTo(DateTime.Now) <= 0)
                            {
                                Session["Motivo"] = "Passou 6 meses";
                                Response.Redirect("CriarNovaSenhaINICIO.aspx");
                            }
                            else
                            {
                                Session["usulogado"] = "ADM";
                                Session["NomeADM"] = cripto.Decrypt(adm.Table.Rows[0]["nome_adm"].ToString());
                            }
                        }
                        else
                        {
                            sqlADM.Update();

                            Session["SenhaAtual"] = cripto.Decrypt(adm.Table.Rows[0]["pass_adm"].ToString());
                            Session["Senha1"] = adm.Table.Rows[0]["pass1_adm"].ToString();
                            Session["Id_adm"] = adm.Table.Rows[0]["id_adm"].ToString();

                            if (dataCadastrada.CompareTo(DateTime.Now) <= 0)
                            {
                                Session["Motivo"] = "Passou 6 meses";
                                Response.Redirect("CriarNovaSenhaINICIO.aspx");
                            }
                            else
                            {
                                Session["usulogado"] = "ADM";
                                Session["NomeADM"] = cripto.Decrypt(adm.Table.Rows[0]["nome_adm"].ToString());
                            }
                        }

                    }

                    Response.Redirect("PegRespINICIO.aspx");

                }
            }
        
    }




}

