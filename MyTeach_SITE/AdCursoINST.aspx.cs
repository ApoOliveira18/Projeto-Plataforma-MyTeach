using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdCursoINST : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia ("MyTeach");
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

        //Exibir o nome
        lblNome.Text = Session["NomeProf"].ToString();

        if (!IsPostBack)
        {
            //Não atualizar o listBox
            carregarListBox();
        }
    }

    private void carregarListBox()
    {
        DataView listaCat;

        // LISTA DE PRODUTOS CRIPTOGRAFADOS
        listaCat = (DataView)sqlListaCategoria.
            Select(DataSourceSelectArguments.Empty);

        //LIMPAR O DDL
        ListBoxCategoria.Items.Clear();

        //VARRER A LISTA DE PRODUTOS E ADICIONAR
        //AO DDL JÁ DESCRIPTOGRAFADOS
        for (int i = 0;
            i < listaCat.Table.Rows.Count;
            i++)
        {
            //ADICIONAR OS ITENS AO DDL
            ListBoxCategoria.Items.Add(
                new ListItem(/*text*/cripto.Decrypt(listaCat.Table.Rows[i]["nome_cat"].ToString())
                ,/*value*/listaCat.Table.Rows[i]["id_cat"].ToString())
                );

        }

    }

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        //Verificar se já existe 
        DataView dvNome;
        sqlNomeCheck.SelectParameters["Nome"].DefaultValue = cripto.Encrypt(txtNomeVideo.Text);
        dvNome = (DataView)sqlNomeCheck.Select(DataSourceSelectArguments.Empty);

        DataView dvArquivo;
        sqlArquivoCheck.SelectParameters["Arquivo"].DefaultValue = cripto.Encrypt(FlArquivo.FileName);
        dvArquivo = (DataView)sqlArquivoCheck.Select(DataSourceSelectArguments.Empty);

        DataView dvImagem;
        sqlImagemCheck.SelectParameters["Imagem"].DefaultValue = cripto.Encrypt(FlImagem.FileName);
        dvImagem = (DataView)sqlImagemCheck.Select(DataSourceSelectArguments.Empty);
        
        //Verificar se o "wordizinho" está vazio
        if(mytextarea.InnerText == "")
        {
            lblMytextarea.Text = "Descreva seu produto";
        }
        else
        {
            lblMytextarea.Text = "";
            //Caso ja exista o Nome
            if (dvNome.Table.Rows.Count > 0)
            {
                lblNomeCheck.Text = "Já cadastrado";
                lblArquivoCheck.Text = "";
                lblImagemCheck.Text = "";
            }
            else
            {
                //Caso ja exista o Arquivo
                if (dvArquivo.Table.Rows.Count > 0)
                {
                    lblArquivoCheck.Text = "Já cadastrado";
                    lblNomeCheck.Text = "";
                    lblImagemCheck.Text = "";
                }

                else
                {
                    //Caso ja exista o Imagem
                    if (dvImagem.Table.Rows.Count > 0)
                    {
                        lblImagemCheck.Text = "Já cadastrado";
                        lblNomeCheck.Text = "";
                        lblArquivoCheck.Text = "";

                    }
                    else
                    {
                        lblNomeCheck.Text = "";
                        lblArquivoCheck.Text = "";
                        lblImagemCheck.Text = "";

                        //Ver o que esta selecionado
                        if (chkExemplos.Checked == true && chkExercicios.Checked == false && chkLivros.Checked == false && chkSlides.Checked == false)
                        {
                            sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos");
                        }
                        else
                        {
                            if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == false && chkSlides.Checked == false)
                            {
                                sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos e Exercícios");
                            }
                            else
                            {
                                if (chkExemplos.Checked == true && chkExercicios.Checked == false && chkLivros.Checked == true && chkSlides.Checked == false)
                                {
                                    sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos e Livros");
                                }

                                else
                                {
                                    if (chkExemplos.Checked == true && chkExercicios.Checked == false && chkLivros.Checked == false && chkSlides.Checked == true)
                                    {
                                        sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos e Slides");
                                    }
                                    else
                                    {

                                        if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == false)
                                        {
                                            sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos, Exercícios e Livros");
                                        }

                                        else
                                        {

                                            if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == true)
                                            {
                                                sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos, Exercícios, Livros e Slides");
                                            }
                                            else
                                            {
                                                if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == false && chkSlides.Checked == false)
                                                {
                                                    sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos, Exercícios e Slides");
                                                }
                                                else
                                                {

                                                    if (chkExemplos.Checked == true && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == true)
                                                    {
                                                        sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exemplos, Livros e Slides");
                                                    }
                                                    else
                                                    {

                                                        if (chkExemplos.Checked == false && chkExercicios.Checked == true && chkLivros.Checked == false && chkSlides.Checked == false)
                                                        {
                                                            sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exercícios");
                                                        }
                                                        else
                                                        {
                                                            if (chkExemplos.Checked == false && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == false)
                                                            {
                                                                sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exercícios e Livros");
                                                            }
                                                            else
                                                            {
                                                                if (chkExemplos.Checked == false && chkExercicios.Checked == true && chkLivros.Checked == false && chkSlides.Checked == true)
                                                                {
                                                                    sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exercícios e Slides");
                                                                }
                                                                else
                                                                {
                                                                    if (chkExemplos.Checked == false && chkExercicios.Checked == true && chkLivros.Checked == true && chkSlides.Checked == true)
                                                                    {
                                                                        sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Exercícios, Livros e Slides");
                                                                    }

                                                                    else
                                                                    {
                                                                        if (chkExemplos.Checked == false && chkExercicios.Checked == false && chkLivros.Checked == true && chkSlides.Checked == false)
                                                                        {
                                                                            sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Livros");
                                                                        }
                                                                        else
                                                                        {
                                                                            if (chkExemplos.Checked == false && chkExercicios.Checked == false && chkLivros.Checked == true && chkSlides.Checked == true)
                                                                            {
                                                                                sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Livros e Slides");
                                                                            }
                                                                            else
                                                                            {
                                                                                if (chkExemplos.Checked == false && chkExercicios.Checked == false && chkLivros.Checked == false && chkSlides.Checked == true)
                                                                                {
                                                                                    sqlCurso.InsertParameters["Contem"].DefaultValue = cripto.Encrypt("Slides");

                                                                                }
                                                                                else
                                                                                {
                                                                                    if (chkExemplos.Checked == false && chkExercicios.Checked == false && chkLivros.Checked == false && chkSlides.Checked == false)
                                                                                    {
                                                                                        lblErroConteudo.Text = "Selecione um conteudo";
                                                                                    }
                                                                                    else
                                                                                    {

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

                        sqlCurso.InsertParameters["Nome"].DefaultValue = cripto.Encrypt(txtNomeVideo.Text);
                        sqlCurso.InsertParameters["Valor"].DefaultValue = cripto.Encrypt(txtPreco.Text);
                        sqlCurso.InsertParameters["Desc"].DefaultValue = cripto.Encrypt((HttpUtility.HtmlEncode(mytextarea.InnerText)));
                        sqlCurso.InsertParameters["Tamanho"].DefaultValue = cripto.Encrypt(txtTamanho.Text);

                        // INICIO CÓDIGO PARA UPLOAD DE IMAGENS
                        String foto, urlBD;

                        foto = FlImagem.FileName;

                        if (foto != "")
                        {
                            FlImagem.SaveAs(Server.MapPath("\\Imagens\\Curso\\" + foto));
                            urlBD = "~\\Imagens\\Curso\\" + foto;
                        }
                        else
                        {
                            urlBD = "~\\Imagens\\Curso\\sem-imagem.jpg";
                        }

                        sqlCurso.InsertParameters["Imagem"].DefaultValue = cripto.Encrypt(urlBD);

                        /////////////////////////////////////////////////////


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
                            ArquivoBD = "~\\Imagens\\Curso\\sem-imagem.jpg";
                        }

                        sqlCurso.InsertParameters["Arquivo"].DefaultValue = cripto.Encrypt(ArquivoBD);

                        sqlCurso.Insert();

                        txtNomeVideo.Text = "";
                        txtPreco.Text = "";
                        txtTamanho.Text = "";
                        mytextarea.InnerText = "";

                        //Salvar na auditoria
                        sqlAudCur.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                        sqlAudCur.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Insert");
                        sqlAudCur.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Cadstrar do curso");

                        sqlAudCur.Insert();
                    }
                }
            }

        }

        

    }

    protected void ListBoxCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {

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