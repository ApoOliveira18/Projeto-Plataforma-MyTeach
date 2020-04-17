using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CompraALUNO : System.Web.UI.Page
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

        DataView Count = (DataView)sqlCount.Select(DataSourceSelectArguments.Empty);

        double qtd = Convert.ToDouble(Count.Table.Rows[0]["qtd"].ToString());

        if(qtd == 0)
        {
            lblNovoSaldo.Text = "Você não tem crédito";
            btnComprar.Visible = false;

        }
        else
        {
            DataView Curso, Carteira;

            Curso = (DataView)sqlCurso.Select(DataSourceSelectArguments.Empty);


            Carteira = (DataView)sqlCarteira.Select(DataSourceSelectArguments.Empty);

            try
            {
                //Fazer os calculos
                double ValorCurso, SaldoAluno, SaldoFinal, QntCompras;
                
                ValorCurso = Convert.ToDouble(cripto.Decrypt(Curso.Table.Rows[0]["valor_curso"].ToString()));
                SaldoAluno = Convert.ToDouble(cripto.Decrypt(Carteira.Table.Rows[0]["valor_cart"].ToString()));
                QntCompras = Convert.ToInt32(cripto.Decrypt(Carteira.Table.Rows[0]["qnt_cart"].ToString()));

                //Exibir as informações
                Session["idProfessor"] = Curso.Table.Rows[0]["id_prof"].ToString();
                lblPreco.Text = cripto.Decrypt(Curso.Table.Rows[0]["valor_curso"].ToString());
                lblProf.Text = cripto.Decrypt(Curso.Table.Rows[0]["nome_prof"].ToString());
                lblTamanho.Text = cripto.Decrypt(Curso.Table.Rows[0]["tam_curso"].ToString());
                Image.ImageUrl = cripto.Decrypt(Curso.Table.Rows[0]["imagem_curso"].ToString());
                LblSaldo.Text = SaldoAluno.ToString();
                lblValor.Text = ValorCurso.ToString();

                //Verificar se o aluno tem a quantia suficiente
                if (SaldoAluno < ValorCurso)
                {
                    lblNovoSaldo.Text = "Saldo Insuficiente";

                }
                else
                {  //Salvar a quantidade de compras do aluno
                    if (QntCompras == 10)
                    {
                        SaldoFinal = (SaldoAluno - ValorCurso) + 1;
                        lblNovoSaldo.Text = SaldoFinal.ToString() + " PJMs";
                        Session["QtdCompras"] = 10;

                    }
                    else
                    {
                        SaldoFinal = (SaldoAluno - ValorCurso);
                        lblNovoSaldo.Text = SaldoFinal.ToString() + " PJMs";
                        Session["QtdCompras"] = QntCompras.ToString();
                    }

                    Session["SaldoFinal"] = SaldoFinal;
                    Session["ValorCurso"] = lblValor.Text;
                }
            }
            catch
            {
                lblNovoSaldo.Text = "";
                lblPreco.Text = "";
                lblProf.Text = "";
                LblSaldo.Text = "";
                lblTamanho.Text = "";
                lblValor.Text = "";

            }
        }
        
    }

    protected void btnComprar_Click(object sender, EventArgs e)
    {
        //Pegando as informações
        DataView Professor,Pagamento;

        Professor = (DataView)sqlProfessor.Select(DataSourceSelectArguments.Empty);
        Session["idPagamento"] = Professor.Table.Rows[0]["id_pagtprof"].ToString();

        Pagamento = (DataView)sqlPagamento.Select(DataSourceSelectArguments.Empty);
       
        double Saldo, ValorProf, QtdCompras,PagamentoInicial, PagamentoFinal;

        Saldo = Convert.ToDouble(Session["ValorCurso"].ToString());

        //Calculando a porcentagem do professor
        ValorProf = (Saldo * 0.75) * 5;

        //Salvar a quantidade de compra
        QtdCompras = Convert.ToDouble(Session["QtdCompras"].ToString());

        //Cauculando o valor finla do pagamenot do professor
        PagamentoInicial = Convert.ToDouble(cripto.Decrypt(Pagamento.Table.Rows[0]["pagt_pagtprof"].ToString()));

        PagamentoFinal = PagamentoInicial + ValorProf;

        //Alterando a quantia
        sqlPagamento.UpdateParameters["Pagamento"].DefaultValue = cripto.Encrypt(PagamentoFinal.ToString("#0.00"));
        sqlPagamento.Update();

        //Alterando a quantia
        sqlCarteira.UpdateParameters["NovoSaldo"].DefaultValue = cripto.Encrypt(Saldo.ToString());

        //Se ele tiver 10 compras tem que zerar
        if (QtdCompras == 10)
        {
            sqlCarteira.UpdateParameters["QntCompra"].DefaultValue = cripto.Encrypt("0");
        }
        else
        {
            sqlCarteira.UpdateParameters["QntCompra"].DefaultValue = cripto.Encrypt(QtdCompras.ToString());
        }

        sqlCarteira.Update();

        //Salvar no tabela compra
        sqlCompra.InsertParameters["ValorCurso"].DefaultValue = cripto.Encrypt(lblPreco.Text);
        sqlCompra.InsertParameters["DataHora"].DefaultValue = DateTime.Now.ToString();
        sqlCompra.Insert();

        //Salvar na auditoria do aluno
        sqlAuditoria.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
        sqlAuditoria.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Compra");
        sqlAuditoria.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Compra do Curso");

        sqlAuditoria.Insert();
        lblNovoSaldo.Text = "Compra efetuada com sucesso";

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

