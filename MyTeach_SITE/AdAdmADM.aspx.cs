using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class AdAdmADM : System.Web.UI.Page
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

    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomeADM.aspx");
    }

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        //Verificar se exite email ou cpf nas três tabelas
        DataView dvEmailADM;
        sqlEmailCheckADM.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmail.Text);
        dvEmailADM = (DataView)sqlEmailCheckADM.Select(DataSourceSelectArguments.Empty);

        DataView dvEmailAluno;
        sqlEmailCheckAluno.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmail.Text);
        dvEmailAluno = (DataView)sqlEmailCheckAluno.Select(DataSourceSelectArguments.Empty);

        DataView dvEmailProf;
        sqlEmailCheckProf.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEmail.Text);
        dvEmailProf = (DataView)sqlEmailCheckProf.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfADM;
        sqlCPFCheckADM.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCpf.Text);
        dvCpfADM = (DataView)sqlCPFCheckADM.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfAluno;
        sqlCPFCheckAluno.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCpf.Text);
        dvCpfAluno = (DataView)sqlCPFCheckAluno.Select(DataSourceSelectArguments.Empty);

        DataView dvCpfProf;
        sqlCPFCheckProf.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCpf.Text);
        dvCpfProf = (DataView)sqlCPFCheckProf.Select(DataSourceSelectArguments.Empty);

        //Se o formato do Email esteja incorreto
        if (ValidarEmail(txtEmail.Text) == false)
        {
            lblErroEmail.Text = "Formato incorreto";
            lblErroCPF.Text = "";
        }
        else
        {   //Se o formato do CPF esteja incorreto
            if (CPF.Validar(txtCpf.Text) == false)
            {
                lblErroCPF.Text = "Formato Incorreto";
                lblErroEmail.Text = "";
                lblData.Text = "";
            }
            else
            {
                //Caso existe o emaile alguma das tabelas
                if (dvEmailADM.Table.Rows.Count > 0 || dvEmailProf.Table.Rows.Count > 0 || dvEmailAluno.Table.Rows.Count > 0)
                {
                    lblErroEmail.Text = "Já cadastrado";
                    lblErroCPF.Text = "";
                    lblData.Text = "";
                }
                else
                {
                    //Caso exista o CPF em alguma das tabelas
                    if (dvCpfAluno.Table.Rows.Count > 0 || dvCpfProf.Table.Rows.Count > 0 || dvCpfADM.Table.Rows.Count > 0)
                    {
                        lblErroCPF.Text = "Já cadastrado";
                        lblErroEmail.Text = "";
                        lblData.Text = "";
                    }
                    else
                    {
                        lblErroCPF.Text = "";
                        lblErroEmail.Text = "";
                        lblData.Text = "";

                        try
                        {
                            sqlADM.InsertParameters["Nome"].DefaultValue = cripto.Encrypt(txtNome.Text);
                            sqlADM.InsertParameters["Email"].DefaultValue = cripto.Encrypt(txtEmail.Text);
                            sqlADM.InsertParameters["CPF"].DefaultValue = cripto.Encrypt(txtCpf.Text);
                            sqlADM.InsertParameters["Sexo"].DefaultValue = cripto.Encrypt(rbnSexo.SelectedValue);
                            sqlADM.InsertParameters["CEP"].DefaultValue = cripto.Encrypt(txtCep.Text);
                            sqlADM.InsertParameters["Cidade"].DefaultValue = cripto.Encrypt(txtCidade.Text);
                            sqlADM.InsertParameters["Rua"].DefaultValue = cripto.Encrypt(txtRua.Text);
                            sqlADM.InsertParameters["Bairro"].DefaultValue = cripto.Encrypt(txtBairro.Text);
                            sqlADM.InsertParameters["Num"].DefaultValue = cripto.Encrypt(txtNúmero.Text);
                            sqlADM.InsertParameters["Tel"].DefaultValue = cripto.Encrypt(txtTel.Text);
                            sqlADM.InsertParameters["Resposta"].DefaultValue = cripto.Encrypt(txtResp.Text);
                            sqlADM.InsertParameters["Data"].DefaultValue = DateTime.Now.ToString();

                            //Para Arrumar a data
                            Convert.ToDateTime(txtData.Text);

                            sqlADM.InsertParameters["DataNasc"].DefaultValue = txtData.Text;


                            // INICIO CÓDIGO PARA UPLOAD DE IMAGENS

                            String foto, urlBD;

                            foto = flFoto.FileName;

                            if (foto != "")
                            {
                                flFoto.SaveAs(Server.MapPath("\\Imagens\\ADM\\" + foto));
                                urlBD = "~\\Imagens\\ADM\\" + foto;
                            }
                            else
                            {
                                urlBD = "~\\Imagens\\ADM\\sem-imagem.jpg";
                            }

                            sqlADM.InsertParameters["Foto"].DefaultValue = cripto.Encrypt(urlBD);
                            //FIM

                            //FAZER A SENHA
                            int tamanhoSENHA = 8;
                            string caracteresPermitidos = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-";
                            char[] chars = new char[tamanhoSENHA];
                            Random rd = new Random();
                            for (int i = 0; i < tamanhoSENHA; i++)
                            {
                                chars[i] = caracteresPermitidos[rd.Next(0, caracteresPermitidos.Length)];
                            }

                            //SALVAR A SENHA
                            Session["SenhaR"] = new string(chars);
                            sqlADM.InsertParameters["Senha"].DefaultValue = cripto.Encrypt(Session["SenhaR"].ToString());
                            sqlADM.InsertParameters["Senha1"].DefaultValue = cripto.Encrypt("");
                            sqlADM.InsertParameters["Senha2"].DefaultValue = cripto.Encrypt("");
                            sqlADM.Insert();

                            //ENVIAR A SENHA
                            string  EmailADM;

                            EmailADM = txtEmail.Text;
                            

                            SmtpClient cliente = new SmtpClient("smtp.gmail.com");
                            cliente.EnableSsl = true;
                            cliente.Port = 587;
                            cliente.UseDefaultCredentials = false;

                            MailAddress remetente = new MailAddress("2p1f1j@gmail.com");

                            MailAddress destinatario = new MailAddress(EmailADM);

                            MailMessage mensagem = new MailMessage(remetente, destinatario);

                            mensagem.Body = "Sua senha do site MyTeach é " + Session["SenhaR"] + " e faça o primeiro login para alterar a senha." ;
                            mensagem.Subject = "Senha do MyTeach";

                            NetworkCredential credenciais = new NetworkCredential("2p1f1j@gmail.com", "TCC5WA2019", "");
                            cliente.Credentials = credenciais;
                            cliente.Send(mensagem);
                            ////////////


                            txtBairro.Text = "";
                            txtCep.Text = "";
                            txtCidade.Text = "";
                            txtCpf.Text = "";
                            txtData.Text = "";
                            txtEmail.Text = "";
                            txtNome.Text = "";
                            txtNúmero.Text = "";
                            txtRua.Text = "";
                            txtResp.Text = "";
                            txtTel.Text = "";

                            //Salvar na banco
                            sqlAudAdm.InsertParameters["DATAHORA"].DefaultValue = DateTime.Now.ToString();
                            sqlAudAdm.InsertParameters["ACAO"].DefaultValue = cripto.Encrypt("Insert");
                            sqlAudAdm.InsertParameters["DESC"].DefaultValue = cripto.Encrypt("Cadstrar adm");

                            sqlAudAdm.Insert();


                        }
                        catch (FormatException)
                        {
                            lblData.Text = "Data Inválida!!";
                            lblErroCPF.Text = "";
                            lblErroEmail.Text = "";
                        }
                    }
                }
            }
        }
              
    }

    //Busca do CEP
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        BuscadoCorreio.AtendeClienteClient
       webServiceCorreios = new BuscadoCorreio.AtendeClienteClient("AtendeClientePort");

        try
        {
            var infoCep = webServiceCorreios.consultaCEP(txtCep.Text);

            txtCidade.Text = infoCep.cidade;
            txtBairro.Text = infoCep.bairro;
            txtRua.Text = infoCep.end;
        }
        catch (Exception)
        {
            txtCidade.Text = "";
            txtBairro.Text = "";
            txtRua.Text = "";
        }

    }
    //Validação do email
    public static bool ValidarEmail(string strEmail)
    {
        string strModelo = "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$";
        if (System.Text.RegularExpressions.Regex.IsMatch(strEmail, strModelo))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
