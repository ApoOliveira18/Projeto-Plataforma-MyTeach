using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VerMaisCursoINICIO : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");

    protected void Page_Load(object sender, EventArgs e)
    {
        // Salvar id e pegar as informações do curso
        if (Request.QueryString["id_curso"] != null)
        {
            Session["id_curso"] = Request.QueryString["id_curso"];
        }

        DataView Cursos;

        Cursos = (DataView)sqlCursos.
            Select(DataSourceSelectArguments.Empty);

        // Carregar as informações do curso
        try
        {
            Image.ImageUrl = cripto.Decrypt(Cursos.Table.Rows[0]["imagem_curso"].ToString());
            lblDesc.Text = HttpUtility.HtmlDecode(cripto.Decrypt(Cursos.Table.Rows[0]["desc_curso"].ToString()));
            lblProfessor.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_prof"].ToString());
            lblTamanho.Text = cripto.Decrypt(Cursos.Table.Rows[0]["tam_curso"].ToString());
            lblTitulo.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_curso"].ToString());
            lblValor.Text = cripto.Decrypt(Cursos.Table.Rows[0]["valor_curso"].ToString());
            lblCategoria.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_cat"].ToString());
            lblContem.Text = cripto.Decrypt(Cursos.Table.Rows[0]["contem_curso"].ToString());
        }
        catch
        {
            Image.ImageUrl = "";
            lblDesc.Text = "";
            lblProfessor.Text = "";
            lblTamanho.Text = "";
            lblTitulo.Text = "";
            lblValor.Text = "";
            lblCategoria.Text = "";
            lblContem.Text = "";
        }


    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        // Voltar para página do curso inicio
        Response.Redirect("CursosINICIO.aspx");
    }

    protected void btnComprar_Click(object sender, EventArgs e)
    {
        // Ir para a página de login, já que está página ele ainda não está logado para fazer a compra
        Response.Redirect("LoginINICIO.aspx");
    }
}