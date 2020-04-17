using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class EsqueciSenhaINICIO : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("MyTeach");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEsqueciSenhaEntrar_Click(object sender, EventArgs e)
    {
        //Verifica se há cadastros com o email e cpf
        DataView TentativaAluno, TentativaProf, TentativaAdm;
        string EmailAluno, EmailProf, EmailADM;

        sqlTentativaAluno.SelectParameters["CPF"].DefaultValue = cripto.Encrypt(txtCPF.Text);
        sqlTentativaAluno.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEsqueciMinhaSennha.Text);
        TentativaAluno = (DataView)sqlTentativaAluno.Select(DataSourceSelectArguments.Empty);

        sqlTentativaProf.SelectParameters["CPF"].DefaultValue = cripto.Encrypt(txtCPF.Text);
        sqlTentativaProf.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEsqueciMinhaSennha.Text);
        TentativaProf = (DataView)sqlTentativaProf.Select(DataSourceSelectArguments.Empty);

        sqlTentativaADM.SelectParameters["CPF"].DefaultValue = cripto.Encrypt(txtCPF.Text);
        sqlTentativaADM.SelectParameters["Email"].DefaultValue = cripto.Encrypt(txtEsqueciMinhaSennha.Text);
        TentativaAdm = (DataView)sqlTentativaADM.Select(DataSourceSelectArguments.Empty);

        //Caso não exista
        if (TentativaAluno.Table.Rows.Count == 0 && TentativaProf.Table.Rows.Count == 0 && TentativaAdm.Table.Rows.Count == 0)
        {
            lblErroTentativa.Text = "Este Email ou CPF não estão cadastrados";

        }

        else
        {
            //Se existir no do Aluno
            if (TentativaAluno.Table.Rows.Count > 0)
            {
                EmailAluno = txtEsqueciMinhaSennha.Text;
                Session["senhaALUNO"] = cripto.Decrypt(TentativaAluno.Table.Rows[0]["pass_user"].ToString());

                SmtpClient cliente = new SmtpClient("smtp.gmail.com");
                cliente.EnableSsl = true;
                cliente.Port = 587;
                cliente.UseDefaultCredentials = false;

                MailAddress remetente = new MailAddress("2p1f1j@gmail.com");

                MailAddress destinatario = new MailAddress(EmailAluno);

                MailMessage mensagem = new MailMessage(remetente, destinatario);

                mensagem.Body = "Sua senha do site MyTeach é " + Session["senhaALUNO"];
                mensagem.Subject = "Esqueci minha senha do site MyTeach";

                NetworkCredential credenciais = new NetworkCredential("2p1f1j@gmail.com", "TCC5WA2019", "");
                cliente.Credentials = credenciais;


                cliente.Send(mensagem);
                lblErroTentativa.Text = "Seu email foi enviado com sucesso. Aguarde contato.";
                txtEsqueciMinhaSennha.Text = "";
                txtCPF.Text = "";

            }

            else
            {
                //Se existir no professor
                if (TentativaProf.Table.Rows.Count > 0)
                {
                    EmailProf = txtEsqueciMinhaSennha.Text;
                    Session["senhaINST"] = cripto.Decrypt(TentativaProf.Table.Rows[0]["pass_prof"].ToString());

                    SmtpClient cliente = new SmtpClient("smtp.gmail.com");
                    cliente.EnableSsl = true;
                    cliente.Port = 587;
                    cliente.UseDefaultCredentials = false;

                    MailAddress remetente = new MailAddress("2p1f1j@gmail.com");

                    MailAddress destinatario = new MailAddress(EmailProf);

                    MailMessage mensagem = new MailMessage(remetente, destinatario);

                    mensagem.Body = "Sua senha do site MyTeach é " + Session["senhaINST"];
                    mensagem.Subject = "Esqueci minha senha do site MyTeach";

                    NetworkCredential credenciais = new NetworkCredential("2p1f1j@gmail.com", "TCC5WA2019", "");
                    cliente.Credentials = credenciais;


                    cliente.Send(mensagem);
                    lblErroTentativa.Text = "Seu email foi enviado com sucesso. Aguarde contato.";
                    txtEsqueciMinhaSennha.Text = "";
                    txtCPF.Text = "";

                }

            }

            if (TentativaAdm.Table.Rows.Count > 0)
            {
                //se existir no adm
                EmailADM = txtEsqueciMinhaSennha.Text;
                Session["senhaADM"] = cripto.Decrypt(TentativaAdm.Table.Rows[0]["pass_adm"].ToString());


                SmtpClient cliente = new SmtpClient("smtp.gmail.com");
                cliente.EnableSsl = true;
                cliente.Port = 587;
                cliente.UseDefaultCredentials = false;

                MailAddress remetente = new MailAddress("2p1f1j@gmail.com");

                MailAddress destinatario = new MailAddress(EmailADM);

                MailMessage mensagem = new MailMessage(remetente, destinatario);

                mensagem.Body = "Sua senha do site MyTeach é" + Session["senhaADM"];
                    mensagem.Subject = "Esqueci minha senha do site MyTeach";        

                NetworkCredential credenciais = new NetworkCredential("2p1f1j@gmail.com", "TCC5WA2019", "");
                cliente.Credentials = credenciais;


                cliente.Send(mensagem);
                lblErroTentativa.Text = "Seu email foi enviado com sucesso. Aguarde contato.";
                txtEsqueciMinhaSennha.Text = "";
                txtCPF.Text = "";

            }

        }
       
    }

    protected void btnVoltarEsqueciSenha_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginINICIO.aspx");
    }
}


