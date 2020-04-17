using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CadastroINICIO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LbkAluno_Click(object sender, EventArgs e)
    {
        Response.Redirect("TermoINICIO.aspx");
    }

    protected void btnSelecionar_Click(object sender, EventArgs e)
    {
        //Direcionar para a pagina na qual ele escolheu o tipo de cadastro
        if (chkTermo.Checked == true)
        {
            if (rbnTipoUso.SelectedIndex == 1)
            {
                Response.Redirect("CadastroProfINICIO.aspx");
            }
            else
            {
                Response.Redirect("CadastroAlunoINICIO.aspx");
            }
        }
        else
        {
            lblErro.Text = "Leia o termo e confirme para prosseguir";
        }
    }

    protected void btnVoltarSel_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginINICIO.aspx");
    }
}