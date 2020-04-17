using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TermoINICIO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        // Voltar para a página de cadastro 
        Response.Redirect("CadastroINICIO.aspx");
    }
}