using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomeADM : System.Web.UI.Page
{
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
    }

    protected void btnCursos_Click(object sender, EventArgs e)
    {
        Response.Redirect("CursosADM.aspx");
    }

    protected void btnCadADM_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdAdmADM.aspx");
    }

    protected void btnCodigo_Click(object sender, EventArgs e)
    {
        Response.Redirect("QRcodeADM.aspx");
    }

    protected void btnAuditoria_Click(object sender, EventArgs e)
    {
        Response.Redirect("AuditoriaADM.aspx");
    }

    protected void btnMinhaConta_Click(object sender, EventArgs e)
    {
        Response.Redirect("MinhaContaADM.aspx");
    }

    protected void btnFinanceiro_Click(object sender, EventArgs e)
    {
        Response.Redirect("FinanceiroADM.aspx");
    }
}