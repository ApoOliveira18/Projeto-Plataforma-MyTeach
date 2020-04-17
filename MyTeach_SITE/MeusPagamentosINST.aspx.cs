using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MeusPagamentosINST : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usulogado"] != null)
        {
            if (Session["usulogado"].ToString() != "Professor")
            {
                Response.Redirect("LoginINICIO.aspx");

            }
        }
        else
        {
            Response.Redirect("LoginINICIO.aspx");
        }

        DataView Pagamento;

        Pagamento = (DataView)sqlPagamento.
            Select(DataSourceSelectArguments.Empty);

        //Caso exista 
        try
        {
            double valor;

            //salvar o valor que o professor tem em sua "carteira"
            valor = Convert.ToDouble(cripto.Decrypt(Pagamento.Table.Rows[0]["pagt_pagtprof"].ToString()));

            if (valor > 0)
            {
                lblMoeda.Text = "R$"+ valor.ToString("#0.00");
            }
            else
            {
                lblMoeda.Text = "R$ 0.00";
            }

        }
        catch
        {
            lblMoeda.Text = "R$ 0.00";
        }

    }

    protected void lnHelp_Click(object sender, EventArgs e)
    {
        Session["Arquivo"] = "\\Conteudo\\Professor\\ManualProf.pdf";

        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Session["Arquivo"].ToString() + "");
        Response.TransmitFile(Server.MapPath(Session["Arquivo"].ToString()));
        Response.End();
    }
}