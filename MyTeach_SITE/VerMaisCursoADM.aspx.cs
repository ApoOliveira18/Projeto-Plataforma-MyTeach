using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VerMaisCursoADM : System.Web.UI.Page
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

        DataView Cursos;

        sqlCursos.SelectParameters["Nome"].DefaultValue = cripto.Encrypt(Session["NomeCurso"].ToString());

        Cursos = (DataView)sqlCursos.
            Select(DataSourceSelectArguments.Empty);

        //Carregar e exibir as informações do curso
       try
       {   
            Session["Arquivo"] = cripto.Decrypt(Cursos.Table.Rows[0]["arquivo_curso"].ToString());
            Image.ImageUrl = cripto.Decrypt(Cursos.Table.Rows[0]["imagem_curso"].ToString());
            lblContem.Text = cripto.Decrypt(Cursos.Table.Rows[0]["contem_curso"].ToString());
            lblDesc.Text = HttpUtility.HtmlDecode(cripto.Decrypt(Cursos.Table.Rows[0]["desc_curso"].ToString()));
            lhkProf.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_prof"].ToString());
            Session["NomeProf"] = lhkProf.Text;
            lblTamanho.Text = cripto.Decrypt(Cursos.Table.Rows[0]["tam_curso"].ToString());
            lblTitulo.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_curso"].ToString());
            lblValor.Text = cripto.Decrypt(Cursos.Table.Rows[0]["valor_curso"].ToString());
            lblCategoria.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_cat"].ToString());
       }
        catch
        {
            Session["Arquivo"] = "";
            Session["NomeProf"] = null;
            Image.ImageUrl = "";
            lblContem.Text = "";
            lblDesc.Text = "";
            lhkProf.Text = "";
            lblTamanho.Text = "";
            lblTitulo.Text = "";
            lblValor.Text = "";
            lblCategoria.Text = "";

        }

    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        // Voltar para a página de Cursos
        Response.Redirect("CursosADM.aspx");
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        // Fazer download do arquivo do curso 
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Session["Arquivo"].ToString() + "");
        Response.TransmitFile(Server.MapPath(Session["Arquivo"].ToString()));
        Response.End();
    }

    protected void btnExcluir_Click(object sender, EventArgs e)
    {
        // Desativar um curso pelo nome dele 
        sqlDesativar.UpdateParameters["Nome"].DefaultValue = cripto.Encrypt(Session["NomeCurso"].ToString());
        sqlDesativar.Update();

        //Salvando na auditoria
        sqlDesativarCurso.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
        sqlDesativarCurso.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Desativar");
        sqlDesativarCurso.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Desativar curso ADM");
        sqlDesativarCurso.Insert();

        Response.Redirect("CursosADM.aspx");

    }

    protected void lhkProf_Click(object sender, EventArgs e)
    {
        // Ir para a página para ver mais informações do professor 
        Session["NomeProf"] = lhkProf.Text;
        Session["EmailProf"] = null;
        Response.Redirect("VerMaisProfADM.aspx");
    }
}