using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VerMaisCursoALUNO : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia ("MyTeach");
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


        // Salvar o id do curso e as informações
        if (Request.QueryString["id_curso"] != null)
        {
            Session["id_curso"] = Request.QueryString["id_curso"];
        }

        DataView Cursos;

        Cursos = (DataView)sqlCursos.
            Select(DataSourceSelectArguments.Empty);


        // Exibir as informações do curso 
        try
        {
            Image.ImageUrl = cripto.Decrypt(Cursos.Table.Rows[0]["imagem_curso"].ToString());
            lblDesc.Text = HttpUtility.HtmlDecode(cripto.Decrypt(Cursos.Table.Rows[0]["desc_curso"].ToString()));
            lnbProf.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_prof"].ToString());
            lblContem.Text = cripto.Decrypt(Cursos.Table.Rows[0]["contem_curso"].ToString());
            Session["ProfPesq"] = lnbProf.Text;
            lblTamanho.Text = cripto.Decrypt(Cursos.Table.Rows[0]["tam_curso"].ToString());
            lblTitulo.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_curso"].ToString());
            lblValor.Text = cripto.Decrypt(Cursos.Table.Rows[0]["valor_curso"].ToString()) + " PJMs";
            lblCategoria.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_cat"].ToString());
        }
        catch
        {
            Image.ImageUrl = "";
            lblDesc.Text = "";
            lnbProf.Text = "";
            lblTamanho.Text = "";
            lblTitulo.Text = "";
            lblValor.Text = "";
            lblCategoria.Text = "";
        }
    }

    protected void lnbProf_Click(object sender, EventArgs e)
    {
      // Ir para a página para ver mais informações sobre o professor 
        Response.Redirect("VerMaisProfALUNO.aspx");
    }

    protected void btnComprar_Click(object sender, EventArgs e)
    {
        // Ir para a página de compra do curso 
        Response.Redirect("CompraALUNO.aspx");
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