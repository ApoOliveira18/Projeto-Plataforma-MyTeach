using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MinhasPjmALUNO : System.Web.UI.Page
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


        // Ligar com o sql da moeda
        DataView Moeda;

        Moeda = (DataView)sqlMoeda.
            Select(DataSourceSelectArguments.Empty);


        //  Exibir a quantidade de Pjms(moeda) aluno tem
        try
        {
            double valor;

            valor = Convert.ToDouble(cripto.Decrypt(Moeda.Table.Rows[0]["valor_cart"].ToString()));

            if(valor > 0)
            {
                lblMoeda.Text = valor.ToString() + " PJMs";               
            }
            else
            {
                lblMoeda.Text = "0 PJMs";
            }
            
        }
        catch
        {
            lblMoeda.Text = "0 PJMs";
        }
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