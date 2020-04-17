using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VerMaisCursoINST : System.Web.UI.Page
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

        //Aparecero nome
        lblNome.Text = Session["NomeProf"].ToString();

        //Pegar pelo o DataList
        if (Request.QueryString["id_curso"] != null)
        {
            Session["id_curso"] = Request.QueryString["id_curso"];
        }

        //Não Atualizar o ListBox
        if (!IsPostBack)
        {
            carregarListBox();
        }

        DataView Cursos;

        Cursos = (DataView)sqlCurso.
            Select(DataSourceSelectArguments.Empty);

        if (!IsPostBack)
        {
            //Caso o curso exista
            try
            {
                imgProf.ImageUrl = cripto.Decrypt(Cursos.Table.Rows[0]["imagem_curso"].ToString());
                Session["ImagemCurso"] = cripto.Decrypt(Cursos.Table.Rows[0]["imagem_curso"].ToString());
                Session["ArquivoCurso"] = cripto.Decrypt(Cursos.Table.Rows[0]["arquivo_curso"].ToString());
                mytextarea.InnerHtml = cripto.Decrypt(Cursos.Table.Rows[0]["desc_curso"].ToString());
                txtTamanho.Text = cripto.Decrypt(Cursos.Table.Rows[0]["tam_curso"].ToString());
                lblNomeVideo.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_curso"].ToString());
                txtPreco.Text = cripto.Decrypt(Cursos.Table.Rows[0]["valor_curso"].ToString());
                lblCategoria.Text = cripto.Decrypt(Cursos.Table.Rows[0]["nome_cat"].ToString());
                Session["NomeCat"] = Cursos.Table.Rows[0]["nome_cat"].ToString();
                lblContem.Text = cripto.Decrypt(Cursos.Table.Rows[0]["contem_curso"].ToString());
            }
            catch
            {
                Session["ImagemCurso"] = "";
                Session["ArquivoCurso"] = "";
                mytextarea.InnerHtml = "";
                txtTamanho.Text = "";
                lblNomeVideo.Text = "";
                txtPreco.Text = "";
                lblCategoria.Text = "";
                lblContem.Text = "";
                imgProf.ImageUrl = "";
            }
        }
    }

    private void carregarListBox()
    {
        DataView listaCat;

        // LISTA DE PRODUTOS CRIPTOGRAFADOS
        listaCat = (DataView)sqlListaCategoria.
            Select(DataSourceSelectArguments.Empty);

        //LIMPAR O DDL
        listBoxCatg.Items.Clear();

        //VARRER A LISTA DE PRODUTOS E ADICIONAR
        //AO DDL JÁ DESCRIPTOGRAFADOS
        for (int i = 0;
            i < listaCat.Table.Rows.Count;
            i++)
        {
            //ADICIONAR OS ITENS AO DDL
            listBoxCatg.Items.Add(
                new ListItem(cripto.Decrypt(listaCat.Table.Rows[i]["nome_cat"].ToString())
                ,listaCat.Table.Rows[i]["id_cat"].ToString())
                );

        }

    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("MeusCursosINST.aspx");
    }

    protected void btnExcluir_Click(object sender, EventArgs e)
    {
        // Desativando o curso
        sqlDesativar.Update();

        //Salvando a ação na auditoria
        sqlDesativarAUD.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
        sqlDesativarAUD.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Desativar");
        sqlDesativarAUD.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Desativação do curso");

        sqlDesativarAUD.Insert();

        Response.Redirect("MeusCursosINST.aspx");
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        //Para vaerificar se existe algum upload igual
        DataView dvArquivo;
        sqlArquivoCheck.SelectParameters["Arquivo"].DefaultValue = cripto.Encrypt(FlArquivo.FileName);
        dvArquivo = (DataView)sqlArquivoCheck.Select(DataSourceSelectArguments.Empty);

        DataView dvImagem;
        sqlImagemCheck.SelectParameters["Imagem"].DefaultValue = cripto.Encrypt(flImagem.FileName);
        dvImagem = (DataView)sqlImagemCheck.Select(DataSourceSelectArguments.Empty);

        //O "Wordizinho" nõa pode estar vazio
        if (mytextarea.InnerText == "")
        {
            lblMytextarea.Text = "Descreva seu produto";
        }
        else
        {
            lblMytextarea.Text = "";


            //Caso ja exista o Arquivo
            if (dvArquivo.Table.Rows.Count > 0)
            {
                lblArquivoCheck.Text = "Já cadastrado";
                lblImagemCheck.Text = "";
            }

            else
            {
                //Caso ja exista o Imagem
                if (dvImagem.Table.Rows.Count > 0)
                {
                    lblImagemCheck.Text = "Já cadastrado";
                    lblArquivoCheck.Text = "";

                }
                else
                {
                    lblArquivoCheck.Text = "";
                    lblImagemCheck.Text = "";


                    // Verificar qual checkbox foi selecionado
                    if (chkExemplos.Checked == true && chkExercicios.Checked == false && chkLivros.Checked == false && chkSlides.Checked == false)
                    {
                        sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos");
                    }
                    else
                    {
                        if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == false && chkSlides.Checked == false)
                        {
                            sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos e Exercícios");
                        }
                        else
                        {
                            if (chkExemplos.Checked == true && chkExercicios.Checked == false && chkLivros.Checked == true && chkSlides.Checked == false)
                            {
                                sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos e Livros");
                            }

                            else
                            {
                                if (chkExemplos.Checked == true && chkExercicios.Checked == false && chkLivros.Checked == false && chkSlides.Checked == true)
                                {
                                    sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos e Slides");
                                }
                                else
                                {

                                    if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == false)
                                    {
                                        sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos, Exercícios e Livros");
                                    }

                                    else
                                    {

                                        if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == true)
                                        {
                                            sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos, Exercícios, Livros e Slides");
                                        }
                                        else
                                        {
                                            if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == false && chkSlides.Checked == false)
                                            {
                                                sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos, Exercícios e Slides");
                                            }
                                            else
                                            {

                                                if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == true)
                                                {
                                                    sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos, Livros e Slides");
                                                }
                                                else
                                                {

                                                    if (chkExemplos.Checked == false && chkExercicios.Checked == true && chkLivros.Checked == false && chkSlides.Checked == false)
                                                    {
                                                        sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exercícios");
                                                    }
                                                    else
                                                    {
                                                        if (chkExemplos.Checked == false && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == false)
                                                        {
                                                            sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exercícios e Livros");
                                                        }
                                                        else
                                                        {
                                                            if (chkExemplos.Checked == false && chkExercicios.Checked == true && chkLivros.Checked == false && chkSlides.Checked == true)
                                                            {
                                                                sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exercícios e Slides");
                                                            }
                                                            else
                                                            {
                                                                if (chkExemplos.Checked == false && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == true)
                                                                {
                                                                    sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Exercícios, Livros e Slides");
                                                                }

                                                                else
                                                                {
                                                                    if (chkExemplos.Checked == false && chkExercicios.Checked == false && chkLivros.Checked == true && chkSlides.Checked == false)
                                                                    {
                                                                        sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Livros");
                                                                    }
                                                                    else
                                                                    {
                                                                        if (chkExemplos.Checked == false && chkExercicios.Checked == false && chkLivros.Checked == true && chkSlides.Checked == true)
                                                                        {
                                                                            sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Livros e Slides");
                                                                        }
                                                                        else
                                                                        {
                                                                            if (chkExemplos.Checked == false && chkExercicios.Checked == false && chkLivros.Checked == false && chkSlides.Checked == true)
                                                                            {
                                                                                sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt("Slides");

                                                                            }
                                                                            else
                                                                            {
                                                                                if (chkExemplos.Checked == false && chkExercicios.Checked == false && chkLivros.Checked == false && chkSlides.Checked == false)
                                                                                {
                                                                                    sqlCurso.UpdateParameters["Contem"].DefaultValue = cripto.Encrypt(lblContem.Text);
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }

                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Atualizar a categoria escolhida
                    if (listBoxCatg.SelectedValue != "")
                    {
                        sqlCurso.UpdateParameters["Categoria"].DefaultValue = cripto.Encrypt(listBoxCatg.SelectedValue);
                    }
                    else
                    {
                        // Para descobrir o ID da categoria que ja estava salva 
                        DataView Categoria;
                        string IdCategoria;

                        sqlCategoria.SelectParameters["Categoria"].DefaultValue = Session["NomeCat"].ToString();
                        Categoria = (DataView)sqlCategoria.Select(DataSourceSelectArguments.Empty);
                        IdCategoria = Categoria.Table.Rows[0]["id"].ToString();

                       sqlCurso.UpdateParameters["Categoria"].DefaultValue = IdCategoria;
                    }

                    // Atuzlizar informações do curso
                    sqlCurso.UpdateParameters["Nome"].DefaultValue = cripto.Encrypt(lblNomeVideo.Text);
                    sqlCurso.UpdateParameters["Valor"].DefaultValue = cripto.Encrypt(txtPreco.Text.Replace(',', '.'));
                    sqlCurso.UpdateParameters["Desc"].DefaultValue = cripto.Encrypt((HttpUtility.HtmlEncode(mytextarea.InnerText)));
                    sqlCurso.UpdateParameters["Tamanho"].DefaultValue = cripto.Encrypt(txtTamanho.Text);

                    // INICIO CÓDIGO PARA UPLOAD DE IMAGENS
                    String foto, urlBD;

                    foto = flImagem.FileName;

                    if (foto != "")
                    {
                        flImagem.SaveAs(Server.MapPath("\\Imagens\\Curso\\" + foto));
                        urlBD = "~\\Imagens\\Curso\\" + foto;
                    }
                    else
                    {
                        urlBD = Session["ImagemCurso"].ToString();
                    }

                    sqlCurso.UpdateParameters["Imagem"].DefaultValue = cripto.Encrypt(urlBD);


                    // INICIO CÓDIGO PARA UPLOAD DE ARQUIVO
                    String Arquivo, ArquivoBD;

                    Arquivo = FlArquivo.FileName;

                    if (Arquivo != "")
                    {
                        FlArquivo.SaveAs(Server.MapPath("\\Imagens\\Curso\\" + Arquivo));
                        ArquivoBD = "~\\Imagens\\Curso\\" + Arquivo;
                    }
                    else
                    {
                        ArquivoBD = Session["ArquivoCurso"].ToString();
                    }

                    sqlCurso.UpdateParameters["Arquivo"].DefaultValue = cripto.Encrypt(ArquivoBD);

                    sqlCurso.Update();

                    //Salvar na Auditoria
                    sqlAudCur.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                    sqlAudCur.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Update");
                    sqlAudCur.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Update do curso");

                    sqlAudCur.Insert();
                }
            }
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