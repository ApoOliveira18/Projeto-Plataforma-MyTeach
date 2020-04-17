using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class FinanceiroADM : System.Web.UI.Page
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

        pnlPago.Visible = false;
    }
    private void carregarGrid()
    {
        //pegando as informações criptografadas do BANCO DE DADOS
        DataView listaProdCripto = (DataView)sqlFinanceiro.Select(DataSourceSelectArguments.Empty);

        Session["IdPagto"] = listaProdCripto.Table.Rows[0]["id_pagtprof"].ToString();
        Session["Valor"]= cripto.Decrypt(listaProdCripto.Table.Rows[0]["pagt_pagtprof"].ToString());

        //Criando uma lista temporária para armazenar NO PROGRAMA as infos que serão descriptografadas (como se fosse uma tabela do banco de dados só que no ASP )
        DataTable listaProdDescripto = new DataTable();

        //criando coluna para variavel, e dando o nome para a coluna (ex: id_produto) e o tipo de coisa q ela vai armazenar (ex: int) 
        listaProdDescripto.Columns.Add("nome_prof", typeof(string));
        listaProdDescripto.Columns.Add("tipo_pagtprof", typeof(string));
        listaProdDescripto.Columns.Add("banco_pagtprof", typeof(string));
        listaProdDescripto.Columns.Add("agencia_pagtprof", typeof(string));
        listaProdDescripto.Columns.Add("conta_pagtprof", typeof(string));
        listaProdDescripto.Columns.Add("pagt_pagtprof", typeof(double));
        listaProdDescripto.Columns.Add("data_pagtprof", typeof(string));

        //COMO FAZER SELECT PELA DATA ESCOLHIDA
        listaProdDescripto.DefaultView.RowFilter = "data_pagtprof like '" + txtData.Text + "%'";

        // fazer esse codigo até dar o numero de linhas que tem dentro do listaProdCripto (BANDO DE DADOS)
        for (int i = 0; i < listaProdCripto.Table.Rows.Count; i++)
        {
            //criando uma linha para listaProdDescripto
            DataRow linha = listaProdDescripto.NewRow();

            //preenchendo linhas com valores da tabela DO ASP (listaProdCripto) 
            linha["nome_prof"] = cripto.Decrypt(listaProdCripto.Table.Rows[i]["nome_prof"].ToString());
            linha["tipo_pagtprof"] = cripto.Decrypt(listaProdCripto.Table.Rows[i]["tipo_pagtprof"].ToString());
            linha["banco_pagtprof"] = cripto.Decrypt(listaProdCripto.Table.Rows[i]["banco_pagtprof"].ToString());
            linha["conta_pagtprof"] = cripto.Decrypt(listaProdCripto.Table.Rows[i]["conta_pagtprof"].ToString());
            linha["agencia_pagtprof"] = cripto.Decrypt(listaProdCripto.Table.Rows[i]["agencia_pagtprof"].ToString());
            linha["pagt_pagtprof"] = cripto.Decrypt(listaProdCripto.Table.Rows[i]["pagt_pagtprof"].ToString());
            linha["data_pagtprof"] = cripto.Decrypt(listaProdCripto.Table.Rows[i]["data_pagtprof"].ToString());

            //Session["idProf"]= listaProdCripto.Table.Rows[i]["id_prof"].ToString();
        //
        listaProdDescripto.Rows.Add(linha);
        }
        //exibindo as infos da tabela que a gente criou no ASP 
        GridView1.DataSource = listaProdDescripto;

        //atualizando o gv
        GridView1.DataBind();
    }


    protected void btnProsseguir_Click(object sender, EventArgs e)
    {       
        //Quqndo a data estiver vazia
        if(txtData.Text == "")
        {
            lblErro.Text = "Escolha uma data";
            //quando clica no botão carrega esse evento
            carregarGrid();
            btnPago.Visible = false;           
        }
        else
        {
            int data;

            data = Convert.ToInt32(txtData.Text);

            //Limitando o valor que pode ser pedido
            if (data < 1 || data >28)
            {
                lblErro.Text = "Escolha uma data entre 1 á 28";
                pnlPago.Visible = false;
                btnPago.Visible = false;
            }
            else
            {
                //quando clica no botão carrega esse evento
                carregarGrid();
                pnlPago.Visible = true;
            }
        }
      

    }

    protected void btnPago_Click(object sender, EventArgs e)
    {
        //Zerando o pagamento do professor
        double pagamento, valorFinal;
        pagamento = Convert.ToDouble(Session["Valor"]);
        valorFinal = pagamento - pagamento;


        //cria a variavel 'linha' que equivale a cada linha do gridview
        foreach (GridViewRow linha in GridView1.Rows)
        {
            //cria variavel para salvar o objeto checkbox da linha
            CheckBox chVariavel;

            //dando valor para variavel
            chVariavel = (CheckBox)linha.FindControl("chkOP");

            //quando o check box estiver ativado faz isso
            if (chVariavel.Checked == true)
            {
                //criando variavel
                String idProd, valor;


                //dando valor da variavel onde ela é a coluna 1 da linha (lembrando que começa no 0)
                idProd = linha.Cells[1].Text;
                valor = linha.Cells[6].Text;

                //dando valor para o parametro 
                sqlPagamento.UpdateParameters["Valor"].DefaultValue = cripto.Encrypt(valorFinal.ToString("0.00"));

                //dando comando do update
                sqlPagamento.Update();

                sqlPagamentoAuditoria.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                sqlPagamentoAuditoria.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Pago");
                sqlPagamentoAuditoria.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Pagamento do Professor");
                sqlPagamentoAuditoria.Insert();

            }
        }
        GridView1.DataBind();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomeADM.aspx");
    }
}