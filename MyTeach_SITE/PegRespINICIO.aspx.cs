using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PegRespINICIO : System.Web.UI.Page
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
    }

    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        //Verificando se a resposta está correta 
        sqlADM.SelectParameters["Resp"].DefaultValue = cripto.Encrypt(txtResp.Text);
        DataView Resp = (DataView)sqlADM.Select(DataSourceSelectArguments.Empty);

        if (Resp.Table.Rows.Count > 0)
        {
            Response.Redirect("HomeADM.aspx");
        }
        else
        {
            lblErro.Text = "Errou a resposta";
        }
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginINICIO.aspx");
    }
}