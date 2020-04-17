using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AuditoriaADM : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            pnlAdm.Visible = false;
            pnlAluno.Visible = false;
            pnlProf.Visible = false;
        }
    }       

        private void carregarGridProf()
        {
            DataView listaProfGrid = (DataView)sqlAuditoriaProf.Select(DataSourceSelectArguments.Empty);
            DataTable listaProfGridDesc = new DataTable();


            listaProfGridDesc.Columns.Add("datahora_audP", typeof(DateTime));
            listaProfGridDesc.Columns.Add("nome_prof", typeof(string));
            listaProfGridDesc.Columns.Add("acao_audP", typeof(string));
            listaProfGridDesc.Columns.Add("desc_audP", typeof(string));


            listaProfGridDesc.DefaultView.RowFilter = "nome_prof like '" + txtProf.Text + "%'";

            for (int i = 0; i < listaProfGrid.Table.Rows.Count; i++)
            {
                DataRow linha = listaProfGridDesc.NewRow();

                linha["nome_prof"] = cripto.Decrypt(listaProfGrid.Table.Rows[i]["nome_prof"].ToString());
                linha["acao_audP"] = cripto.Decrypt(listaProfGrid.Table.Rows[i]["acao_audP"].ToString());
                linha["datahora_audP"] = listaProfGrid.Table.Rows[i]["datahora_audP"].ToString();                
                linha["desc_audP"] = cripto.Decrypt(listaProfGrid.Table.Rows[i]["desc_audP"].ToString());


                listaProfGridDesc.Rows.Add(linha);
            }

            gvProf.DataSource = listaProfGridDesc;
            gvProf.DataBind();
        }

    protected void btnProf_Click(object sender, EventArgs e)
    {
        pnlAdm.Visible = false;
        pnlProf.Visible = true;
        pnlAluno.Visible = false;

    }

    protected void btnPesqProf_Click(object sender, EventArgs e)
    {   
            carregarGridProf();        
    }

    private void carregarGridAluno()
    {
        DataView listaAlunoGrid = (DataView)sqlAuditoriaAluno.Select(DataSourceSelectArguments.Empty);
        DataTable listaAlunoGridDesc = new DataTable();


        listaAlunoGridDesc.Columns.Add("datahora_audU", typeof(DateTime));
        listaAlunoGridDesc.Columns.Add("nome_user", typeof(string));
        listaAlunoGridDesc.Columns.Add("acao_audU", typeof(string));
        listaAlunoGridDesc.Columns.Add("desc_audU", typeof(string));


        listaAlunoGridDesc.DefaultView.RowFilter = "nome_user like '" + txtAluno.Text + "%'";

        for (int i = 0; i < listaAlunoGrid.Table.Rows.Count; i++)
        {
            DataRow linha = listaAlunoGridDesc.NewRow();

            linha["nome_user"] = cripto.Decrypt(listaAlunoGrid.Table.Rows[i]["nome_user"].ToString());
            linha["acao_audU"] = cripto.Decrypt(listaAlunoGrid.Table.Rows[i]["acao_audU"].ToString());
            linha["datahora_audU"] = listaAlunoGrid.Table.Rows[i]["datahora_audU"].ToString();
            linha["desc_audU"] = cripto.Decrypt(listaAlunoGrid.Table.Rows[i]["desc_audU"].ToString());


            listaAlunoGridDesc.Rows.Add(linha);
        }

        gvAluno.DataSource = listaAlunoGridDesc;
        gvAluno.DataBind();
    }

    protected void btnAluno_Click(object sender, EventArgs e)
    {
        pnlAdm.Visible = false;
        pnlProf.Visible = false;
        pnlAluno.Visible = true;
    }

    protected void btnPesqAluno_Click(object sender, EventArgs e)
    {
        carregarGridAluno();
    }

    private void carregarGridADM()
    {
        DataView listaAdmGrid = (DataView)sqlAuditoriaAdm.Select(DataSourceSelectArguments.Empty);
        DataTable listaAdmGridDesc = new DataTable();


        listaAdmGridDesc.Columns.Add("datahora_audA", typeof(DateTime));
        listaAdmGridDesc.Columns.Add("nome_adm", typeof(string));
        listaAdmGridDesc.Columns.Add("acao_audA", typeof(string));
        listaAdmGridDesc.Columns.Add("desc_audA", typeof(string));


        listaAdmGridDesc.DefaultView.RowFilter = "nome_adm like '" + txtAdm.Text + "%'";

        for (int i = 0; i < listaAdmGrid.Table.Rows.Count; i++)
        {
            DataRow linha = listaAdmGridDesc.NewRow();

            linha["nome_adm"] = cripto.Decrypt(listaAdmGrid.Table.Rows[i]["nome_adm"].ToString());
            linha["acao_audA"] = cripto.Decrypt(listaAdmGrid.Table.Rows[i]["acao_audA"].ToString());
            linha["datahora_audA"] = listaAdmGrid.Table.Rows[i]["datahora_audA"].ToString();
            linha["desc_audA"] = cripto.Decrypt(listaAdmGrid.Table.Rows[i]["desc_audA"].ToString());


            listaAdmGridDesc.Rows.Add(linha);
        }

        gvAdm.DataSource = listaAdmGridDesc;
        gvAdm.DataBind();
    }

    protected void btnAdm_Click(object sender, EventArgs e)
    {
        pnlAdm.Visible = true;
        pnlProf.Visible = false;
        pnlAluno.Visible = false;
    }

    protected void btnPesqAdm_Click(object sender, EventArgs e)
    {
        carregarGridADM();
    }
}