using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MeusCursosINST : System.Web.UI.Page
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

        //Verficar se ele tem cursos

        DataView Count = (DataView)sqlCount.Select
           (DataSourceSelectArguments.Empty);

        double qtd = Convert.ToDouble(Count.Table.Rows[0]["qtd"].ToString());

        if (qtd == 0)
        {
           PnlImagem.Visible = true;
            pnlDataList.Visible = false;
        }
        else
        {
            pnlDataList.Visible = true;
            PnlImagem.Visible = false;
            paginacao("");
        }        
    }

    private void paginacao(String comando)
    {
        // qtd de informações que devem aparecer na tela
        int tamanhoPagina = 6;

        // que representa o inicio do registro na paginação
        int registroInicio = 0;

        if (ViewState["registroInicio"] != null)
        {
            registroInicio = (int)ViewState["registroInicio"];
        }

        if (comando == "Proximo")
        {
            registroInicio = registroInicio + tamanhoPagina;
        }

        if (comando == "Anterior" && registroInicio > 0)
        {
            registroInicio = registroInicio - tamanhoPagina;
        }

        //criar uma tabela para exibir no Datalist
        DataTable listaDataProd = new DataTable();

        //trazer os dados descriptografados
        DataTable listaCursoDescripto = pesquisaCursosDescripto();

        //clonar as tabelas (copiar a estrutura da tabela)
        listaDataProd = listaCursoDescripto.Clone();

        //exibir os registros
        for (int i = registroInicio;
            i < (registroInicio + tamanhoPagina); i++)
        {
            if (i < listaCursoDescripto.Rows.Count)
            {
                listaDataProd.ImportRow(
                    listaCursoDescripto.Rows[i]);
            }
        }

        //tratando o final dos registros
        if (comando == "Proximo" &&
            listaDataProd.Rows.Count == 0 &&
            registroInicio > 0)
        {
            registroInicio = registroInicio - tamanhoPagina;
            for (int i = registroInicio;
            i < (registroInicio + tamanhoPagina); i++)
            {
                if (i < listaCursoDescripto.Rows.Count)
                {
                    listaDataProd.ImportRow(
                        listaCursoDescripto.Rows[i]);
                }
            }
        }

        lstCurso.DataSource = listaDataProd;
        lstCurso.DataBind();

        ViewState["registroInicio"] = registroInicio;
    }


    private DataTable pesquisaCursosDescripto()
    {
        DataTable listaProd = new DataTable();

        //NÃO PODEMOS CLONAR, POIS PRECISAMOS
        //QUE AS COLUNAS DO GRID SEJAM DOUBLE
        //OU DATETIME OU FOTO
        //SE CLONAR ELAS SERÃO SEMPRE TEXT
        listaProd.Columns.Add("id_curso", typeof(int));
        listaProd.Columns.Add("nome_curso", typeof(string));
        listaProd.Columns.Add("valor_curso", typeof(double));
        listaProd.Columns.Add("nome_prof", typeof(string));
        listaProd.Columns.Add("nome_cat", typeof(string));
        listaProd.Columns.Add("imagem_curso", typeof(string));

        //FAZER UM SELECT PARA CARREGAR TODAS AS INFO´S
        //CRIPTOGRAFADAS
        
        DataView listaCripto = (DataView)sqlCurso.Select
           (DataSourceSelectArguments.Empty);


        for (int i = 0;
            i < listaCripto.Table.Rows.Count; i++)
        {
            DataRow linha = listaProd.NewRow();

            linha["id_curso"] = listaCripto.Table.Rows[i]["id_curso"].ToString();
            linha["nome_curso"] = cripto.Decrypt(listaCripto.Table.Rows[i]["nome_curso"].ToString());
            linha["valor_curso"] = cripto.Decrypt(listaCripto.Table.Rows[i]["valor_curso"].ToString());
            linha["nome_prof"] = cripto.Decrypt(listaCripto.Table.Rows[i]["nome_prof"].ToString());
            linha["nome_cat"] = cripto.Decrypt(listaCripto.Table.Rows[i]["nome_cat"].ToString());
            linha["imagem_curso"] = cripto.Decrypt(listaCripto.Table.Rows[i]["imagem_curso"].ToString());


            listaProd.Rows.Add(linha);
        }

        return listaProd;

    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        paginacao("Anterior");
    }

    protected void btnSeguinte_Click(object sender, EventArgs e)
    {
        paginacao("Proximo");
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