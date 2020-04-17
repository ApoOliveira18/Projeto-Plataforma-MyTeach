using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VerMaisProfADM : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usulogado"] != null)
        {
            if (Session["usulogado"].ToString() != "ADM")
            {
                Response.Redirect("LoginINICIO.aspx");

            }
        }
        else
        {
            Response.Redirect("LoginINICIO.aspx");
        }


        DataView ProfessorEscolhido, Professor;


        // Trazendo as informações do banco de dados pelo email do professor
        if (Session["EmailProf"]!= null)
        {
            sqlProf.SelectParameters["EmailProf"].DefaultValue = cripto.Encrypt(Session["EmailProf"].ToString());
            Professor = (DataView)sqlProf.
                Select(DataSourceSelectArguments.Empty);

            // Exibir as informações
            try
            {
                Session["idProf"] = Professor.Table.Rows[0]["id_prof"].ToString();
                lblIdade.Text = Professor.Table.Rows[0]["dataNasc_prof"].ToString();
                lblNome.Text = cripto.Decrypt(Professor.Table.Rows[0]["nome_prof"].ToString());
                lblSexo.Text = cripto.Decrypt(Professor.Table.Rows[0]["sexo_prof"].ToString());
                lblEmail.Text = cripto.Decrypt(Professor.Table.Rows[0]["email_prof"].ToString());
                lblTelefone.Text = cripto.Decrypt(Professor.Table.Rows[0]["tel_prof"].ToString());
                lblCidade.Text = cripto.Decrypt(Professor.Table.Rows[0]["cidade_prof"].ToString());
                lblBairro.Text = cripto.Decrypt(Professor.Table.Rows[0]["bairro_prof"].ToString());
                lblRua.Text = cripto.Decrypt(Professor.Table.Rows[0]["rua_prof"].ToString());
                lblNúmero.Text = cripto.Decrypt(Professor.Table.Rows[0]["num_prof"].ToString());
                imgProf.ImageUrl = cripto.Decrypt(Professor.Table.Rows[0]["imagem_prof"].ToString());
                Diploma.ImageUrl = cripto.Decrypt(Professor.Table.Rows[0]["diplomatras_prof"].ToString());
                DiplomaFrente.ImageUrl = cripto.Decrypt(Professor.Table.Rows[0]["diplomafrente_prof"].ToString());
            }
            catch
            {
                Session["idProf"] = "";
                Session["NomeProf"] = null;
                Session["EmailProf"] = null;
                lblIdade.Text = "";
                lblNome.Text = "";
                lblSexo.Text = "";
                lblEmail.Text = "";
                lblTelefone.Text = "";
                lblCidade.Text = "";
                lblBairro.Text = "";
                lblRua.Text = "";
                lblNúmero.Text = "";
                imgProf.ImageUrl = "";
                Diploma.ImageUrl = "";
                DiplomaFrente.ImageUrl = "";
            }
        }
        else
        {
            // Trazendo as informações do banco de dados polo nome professor
            if (Session["NomeProf"] != null)
            {
                sqlProfEscolhido.SelectParameters["NomeProf"].DefaultValue = cripto.Encrypt(Session["NomeProf"].ToString());
                ProfessorEscolhido = (DataView)sqlProfEscolhido.
                    Select(DataSourceSelectArguments.Empty);
                // Exibir as informações
                try
                {
                    Session["idProfEscolhido"] = ProfessorEscolhido.Table.Rows[0]["id_prof"].ToString();
                    lblIdade.Text = ProfessorEscolhido.Table.Rows[0]["dataNasc_prof"].ToString();
                    lblNome.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["nome_prof"].ToString());
                    lblSexo.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["sexo_prof"].ToString());
                    lblEmail.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["email_prof"].ToString());
                    lblTelefone.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["tel_prof"].ToString());
                    lblCidade.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["cidade_prof"].ToString());
                    lblBairro.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["bairro_prof"].ToString());
                    lblRua.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["rua_prof"].ToString());
                    lblNúmero.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["num_prof"].ToString());
                    imgProf.ImageUrl = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["imagem_prof"].ToString());
                    Diploma.ImageUrl = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["diplomatras_prof"].ToString());
                    DiplomaFrente.ImageUrl = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["diplomafrente_prof"].ToString());
                }
                catch
                {
                    Session["idProfEscolhido"] = "";
                    Session["NomeProf"] = null;
                    Session["EmailProf"] = null;
                    lblIdade.Text = "";
                    lblNome.Text = "";
                    lblSexo.Text = "";
                    lblEmail.Text = "";
                    lblTelefone.Text = "";
                    lblCidade.Text = "";
                    lblBairro.Text = "";
                    lblRua.Text = "";
                    lblNúmero.Text = "";
                    imgProf.ImageUrl = "";
                    Diploma.ImageUrl = "";
                    DiplomaFrente.ImageUrl = "";
                }
            }
        }
              
    }


    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("CursosADM.aspx");
    }

    protected void btnExcluir_Click1(object sender, EventArgs e)
    {
        // Desativar um professor 
        if (Session["EmailProf"] != null)
        {
            sqlProf.UpdateParameters["idProf"].DefaultValue =Session["idProf"].ToString();
            sqlProf.Update();
        }
        else
        {
            if (Session["NomeProf"] != null)
            {                
                sqlProfEscolhido.UpdateParameters["idProfEscolhido"].DefaultValue = Session["idProfEscolhido"].ToString();
                sqlProfEscolhido.Update();
            }
        }

        // auditoria para desativar 
        sqlAudAdm.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
        sqlAudAdm.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Desativar");
        sqlAudAdm.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Desativar o Professor ADM");

        sqlAudAdm.Insert();
        Response.Redirect("CursosADM.aspx");
    }
}