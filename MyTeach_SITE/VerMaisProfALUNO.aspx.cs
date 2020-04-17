using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class VerMaisProfALUNO : System.Web.UI.Page
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

        // Ligar com as informações do banco 
        DataView ProfessorEscolhido;

        sqlProfEscolhido.SelectParameters["ProfPesq"].DefaultValue = cripto.Encrypt(Session["ProfPesq"].ToString());
        ProfessorEscolhido = (DataView)sqlProfEscolhido.
            Select(DataSourceSelectArguments.Empty);

        // Exibir as informações do banco
        try
        {

            lblIdade.Text = ProfessorEscolhido.Table.Rows[0]["dataNasc_prof"].ToString();
            lblNome.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["nome_prof"].ToString());
            lblSexo.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["sexo_prof"].ToString());
            lblEmail.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["email_prof"].ToString());
            lblCidade.Text = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["cidade_prof"].ToString());
            imgProf.ImageUrl = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["imagem_prof"].ToString());
            Diploma.ImageUrl = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["diplomafrente_prof"].ToString());
            DiplomaFrente.ImageUrl = cripto.Decrypt(ProfessorEscolhido.Table.Rows[0]["diplomatras_prof"].ToString());
        }
        //Caso não exista
        catch
        {
            Session["NomeProf"] = null;
            Session["EmailProf"] = null;
            lblIdade.Text = "";
            lblNome.Text = "";
            lblSexo.Text = "";
            lblEmail.Text = "";
            lblCidade.Text = "";
            imgProf.ImageUrl = "";
            Diploma.ImageUrl = "";
            Diploma.ImageUrl = "";
            DiplomaFrente.ImageUrl = "";
        }
    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("VerMaisCursoALUNO.aspx");
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