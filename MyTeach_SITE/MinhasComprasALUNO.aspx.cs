using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MinhasComprasALUNO : System.Web.UI.Page
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

        pnlGrid.Visible = false;
        pnlImagem.Visible = false;

        //Verifica se o aluno ja fez alguma compra
        DataView Verificação;

        Verificação = (DataView)sqlCompraVerificar.Select(DataSourceSelectArguments.Empty);

        double qtd = Convert.ToDouble(Verificação.Table.Rows[0]["qtd"].ToString());

        //Se ele tiver um venda o grid deve aparecer
        if (qtd == 0)
        {
            pnlImagem.Visible = true;
        }      
        else
        {
            pnlGrid.Visible = true;
            carregarGridCompras();
        }
        
    }

    private void carregarGridCompras()
    {
        //pegando as informações criptografadas do BANCO DE DADOS
        DataView listaCursoGrid = (DataView)sqlCompra.Select(DataSourceSelectArguments.Empty);
        Session["Id_user"] = listaCursoGrid.Table.Rows[0]["id_user"].ToString();
        Session["arquivoCurso"] = cripto.Decrypt(listaCursoGrid.Table.Rows[0]["arquivo_curso"].ToString());

        //Criando uma lista temporária para armazenar NO PROGRAMA as infos que serão descriptografadas (como se fosse uma tabela do banco de dados só que no ASP )
        DataTable listaCursoGridDesc = new DataTable();

        //criando coluna para variavel, e dando o nome para a coluna (ex: id_produto) e o tipo de coisa q ela vai armazenar (ex: int) 
        listaCursoGridDesc.Columns.Add("id_user", typeof(string));
        listaCursoGridDesc.Columns.Add("nome_curso", typeof(string));
        listaCursoGridDesc.Columns.Add("nome_prof", typeof(string));
        listaCursoGridDesc.Columns.Add("valor_compra", typeof(double));
        listaCursoGridDesc.Columns.Add("data_compra", typeof(string));
             

        // fazer esse codigo até dar o numero de linhas que tem dentro do listaProdCripto (BANDO DE DADOS)
        for (int i = 0; i < listaCursoGrid.Table.Rows.Count; i++)
        {
            //criando uma linha para listaProdDescripto
            DataRow linha = listaCursoGridDesc.NewRow();

            //preenchendo linhas com valores da tabela DO ASP (listaProdCripto) 
            linha["nome_curso"] = cripto.Decrypt(listaCursoGrid.Table.Rows[i]["nome_curso"].ToString());
            linha["nome_prof"] = cripto.Decrypt(listaCursoGrid.Table.Rows[i]["nome_prof"].ToString());
            linha["valor_compra"] = cripto.Decrypt(listaCursoGrid.Table.Rows[i]["valor_compra"].ToString());
            linha["data_compra"] = listaCursoGrid.Table.Rows[i]["data_compra"].ToString();

            listaCursoGridDesc.Rows.Add(linha);
        }
        //exibindo as infos da tabela que a gente criou no ASP 
        gridCompras.DataSource = listaCursoGridDesc;

        //atualizando o gv
        gridCompras.DataBind();
    }


    protected void lnHelp_Click(object sender, EventArgs e)
    {
        Session["Arquivo"] = "\\Conteudo\\Aluno\\ManualALUNO.pdf";

        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Session["Arquivo"].ToString() + "");
        Response.TransmitFile(Server.MapPath(Session["Arquivo"].ToString()));
        Response.End();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Fazer download
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Session["arquivoCurso"].ToString() + "");
        Response.TransmitFile(Server.MapPath(Session["arquivoCurso"].ToString()));
        Response.End();
    }
}