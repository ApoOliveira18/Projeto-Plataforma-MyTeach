using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CursosADM : System.Web.UI.Page
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
            pnlCursos.Visible = false;
            pnlProfessores.Visible = false;
            pnCategoria.Visible = false;
        }        
    }


    protected void btnProfessores_Click(object sender, EventArgs e)
    {
        //Se ele clicar no botõa deve exibir seu panel e seu grid
        pnlCursos.Visible = false;
        pnlProfessores.Visible = true;
        pnCategoria.Visible = false;

        if (!IsPostBack)
        {
            carregarGridProf();
        }

    }

    private void carregarGridProf()
    {
        DataView listaProfGrid = (DataView)sqlProfessor.Select(DataSourceSelectArguments.Empty);
        DataTable listaProfGridDesc = new DataTable();


        listaProfGridDesc.Columns.Add("nome_prof", typeof(string));
        listaProfGridDesc.Columns.Add("email_prof", typeof(string));
        listaProfGridDesc.Columns.Add("sexo_prof", typeof(string));
        listaProfGridDesc.Columns.Add("dataNasc_prof", typeof(DateTime));


        listaProfGridDesc.DefaultView.RowFilter = "nome_prof like '" + txtProf.Text + "%'";

        for (int i = 0; i < listaProfGrid.Table.Rows.Count; i++)
        {
            DataRow linha = listaProfGridDesc.NewRow();

            linha["nome_prof"] = cripto.Decrypt(listaProfGrid.Table.Rows[i]["nome_prof"].ToString());
            linha["email_prof"] = cripto.Decrypt(listaProfGrid.Table.Rows[i]["email_prof"].ToString());
            linha["sexo_prof"] = cripto.Decrypt(listaProfGrid.Table.Rows[i]["sexo_prof"].ToString());
            linha["dataNasc_prof"] = listaProfGrid.Table.Rows[i]["dataNasc_prof"].ToString();


            listaProfGridDesc.Rows.Add(linha);
        }

        gvProf.DataSource = listaProfGridDesc;
        gvProf.DataBind();
    }

    protected void btnProf_Click(object sender, EventArgs e)
    {
        carregarGridProf();
    }

    protected void gvProf_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Amarzenar o email para outra pagina
        Session["EmailProf"] = Server.HtmlDecode(gvProf.Rows[gvProf.SelectedIndex].Cells[1].Text);

        Response.Redirect("VerMaisProfADM.aspx");
    }


    protected void btnCursos_Click(object sender, EventArgs e)
    {
        //Se ele clicar no botõa deve exibir seu panel e seu grid
        pnlCursos.Visible = true;
        pnlProfessores.Visible = false;
        pnCategoria.Visible = false;

        if (!IsPostBack)
        {
            carregarGridCurso();
        }
    }

    private void carregarGridCurso()
    {
        //pegando as informações criptografadas do BANCO DE DADOS
        DataView listaCursoGrid = (DataView)sqlCurso.Select(DataSourceSelectArguments.Empty);


        //Criando uma lista temporária para armazenar NO PROGRAMA as infos que serão descriptografadas (como se fosse uma tabela do banco de dados só que no ASP )
        DataTable listaCursoGridDesc = new DataTable();

        //criando coluna para variavel, e dando o nome para a coluna (ex: id_produto) e o tipo de coisa q ela vai armazenar (ex: int) 
        listaCursoGridDesc.Columns.Add("nome_curso", typeof(string));
        listaCursoGridDesc.Columns.Add("nome_prof", typeof(string));
        listaCursoGridDesc.Columns.Add("nome_cat", typeof(string));
        listaCursoGridDesc.Columns.Add("imagem_curso", typeof(string));
        listaCursoGridDesc.Columns.Add("valor_curso", typeof(string));

        //fazendo o filtro like do select (que era feito no sqlDataSource) a mão
        listaCursoGridDesc.DefaultView.RowFilter = "nome_curso like '" + txtCurso.Text + "%'";

        // fazer esse codigo até dar o numero de linhas que tem dentro do listaProdCripto (BANDO DE DADOS)
        for (int i = 0; i < listaCursoGrid.Table.Rows.Count; i++)
        {
            //criando uma linha para listaProdDescripto
            DataRow linha = listaCursoGridDesc.NewRow();

            //preenchendo linhas com valores da tabela DO ASP (listaProdCripto) 
            linha["nome_curso"] = cripto.Decrypt(listaCursoGrid.Table.Rows[i]["nome_curso"].ToString());
            linha["nome_prof"] = cripto.Decrypt(listaCursoGrid.Table.Rows[i]["nome_prof"].ToString());
            linha["nome_cat"] = cripto.Decrypt(listaCursoGrid.Table.Rows[i]["nome_cat"].ToString());
            linha["valor_curso"] = cripto.Decrypt(listaCursoGrid.Table.Rows[i]["valor_curso"].ToString());
            linha["imagem_curso"] = cripto.Decrypt(listaCursoGrid.Table.Rows[i]["imagem_curso"].ToString());

            //
            listaCursoGridDesc.Rows.Add(linha);
        }
        //exibindo as infos da tabela que a gente criou no ASP 
        gvCurso.DataSource = listaCursoGridDesc;

        //atualizando o gv
        gvCurso.DataBind();
    }

    protected void gvCurso_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Amazenar o nome
        Session["NomeCurso"] = Server.HtmlDecode(gvCurso.Rows[gvCurso.SelectedIndex].Cells[0].Text);

        Response.Redirect("VerMaisCursoADM.aspx");
    }

    protected void btnPesquisarCursos_Click(object sender, EventArgs e)
    {
        carregarGridCurso();
    }

    protected void btnCategrorias_Click(object sender, EventArgs e)
    {
        //Se ele clicar no botõa deve exibir seu panel e seu grid
        pnlCursos.Visible = false;
        pnlProfessores.Visible = false;
        pnCategoria.Visible = true;
        btnExcluirCatg.Visible = false;

        if (!IsPostBack)
        {
            carregarGridCategoria();
        }
    }

    private void carregarGridCategoria()
    {
        //pegando as informações criptografadas do BANCO DE DADOS
        DataView listaCategoriaGrid = (DataView)sqlCatg.Select(DataSourceSelectArguments.Empty);


        //Criando uma lista temporária para armazenar NO PROGRAMA as infos que serão descriptografadas (como se fosse uma tabela do banco de dados só que no ASP )
        DataTable listaCatgGridDesc = new DataTable();

        //criando coluna para variavel, e dando o nome para a coluna (ex: id_produto) e o tipo de coisa q ela vai armazenar (ex: int) 

        listaCatgGridDesc.Columns.Add("nome_cat", typeof(string));


        // fazer esse codigo até dar o numero de linhas que tem dentro do listaProdCripto (BANCO DE DADOS)
        for (int i = 0; i < listaCategoriaGrid.Table.Rows.Count; i++)
        {
            //criando uma linha para listaProdDescripto
            DataRow linha = listaCatgGridDesc.NewRow();

            //preenchendo linhas com valores da tabela DO ASP (listaProdCripto) 

            linha["nome_cat"] = cripto.Decrypt(listaCategoriaGrid.Table.Rows[i]["nome_cat"].ToString());

            //
            listaCatgGridDesc.Rows.Add(linha);
        }
        //exibindo as infos da tabela que a gente criou no ASP 
        gvCategoria.DataSource = listaCatgGridDesc;

        //atualizando o gv
        gvCategoria.DataBind();
    }

    protected void btnCatg_Click(object sender, EventArgs e)
    {
        btnExcluirCatg.Visible = true;
        //Caso ele quueira adiconar uma categoria 
        DataView dvCategoriaADM, Categoria;
        sqlCategoriaCheck.SelectParameters["Categoria"].DefaultValue = cripto.Encrypt(txtCatg.Text);
        dvCategoriaADM = (DataView)sqlCategoriaCheck.Select(DataSourceSelectArguments.Empty);

        //Verficar se ja existe 
        if (dvCategoriaADM.Table.Rows.Count > 0)
        {
            lblCategoriaCheck.Text = "Já cadastrado";
            carregarGridCategoria();
        }
        else
        {
            lblCategoriaCheck.Text = "";
            //Não esta vazia

            if (txtCatg.Text != "")
            {
                sqlCatg.InsertParameters["Categoria"].DefaultValue = cripto.Encrypt(txtCatg.Text);
                sqlCatg.Insert();
                txtCatg.Text = "";

                Categoria = (DataView)sqlCatg.Select(DataSourceSelectArguments.Empty);

                carregarGridCategoria();
                Session["idCat"] = Categoria.Table.Rows[0]["id_cat"];

                //Salvar na auditoria
                sqlAudDesativar.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                sqlAudDesativar.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Cadastrar");
                sqlAudDesativar.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Cadastrar Categoria");

                sqlAudDesativar.Insert();
            }
            else
            {
                carregarGridCategoria();
            }
        }

    }

    protected void btnExcluirCatg_Click(object sender, EventArgs e)
    { 
        //Caso queira desativar a categoria

        //cria a variavel 'linha' que equivale a cada linha do gridview
        foreach (GridViewRow linha in gvCategoria.Rows)
        {
            //cria variavel para salvar o objeto checkbox da linha
            CheckBox chVariavel;

            //dando valor para variavel
            chVariavel = (CheckBox)linha.FindControl("chkOP");

            //quando o check box estiver ativado faz isso
            if (chVariavel.Checked == true)
            {
                //criando variavel
                String nome;

                //dando valor da variavel onde ela é a coluna 1 da linha (lembrando que começa no 0)
                nome = linha.Cells[1].Text;

                Session["nome"] = nome.ToString();

                //dando valor para o parametro 
                sqlCatg.UpdateParameters["nome"].DefaultValue = cripto.Encrypt(Session["nome"].ToString());

                //dando comando do update
                sqlCatg.Update();

                //Salvando na auditoria
                sqlAudDesativar.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                sqlAudDesativar.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Desativar");
                sqlAudDesativar.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Desativar Categoria");

                sqlAudDesativar.Insert();

            }
        }
        gvCategoria.DataBind();
    }

    protected void gvCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}